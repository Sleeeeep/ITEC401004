#include<stdio.h>
#include<unistd.h>
#include<ros/ros.h>
#include<geometry_msgs/Twist.h>
#include<nav_msgs/Odometry.h>
#include<boost/thread/mutex.hpp>
#include<tf/tf.h>
#include<sensor_msgs/LaserScan.h>

#define toRadian(degree)	((degree) * (M_PI / 180.))
#define toDegree(radian)	((radian) * (180. / M_PI))

boost::mutex mutex;
nav_msgs::Odometry g_odom;
float pre_dAngleTurned = 0;
ros::Publisher pub;

void scanMsgCallback(const sensor_msgs::LaserScan &msg)
{
	bool obstacle = false;
	
	int nRangeSize = (int)msg.ranges.size();
	double leftSum = 0, frontSum = 0, rightSum = 0;
    int leftcount = 0, frontcount = 0, rightcount = 0;
	
	for(int i=0; i<nRangeSize; i++)
	{
		if(i>0 && i<=20)
		{    
			double dRange = msg.ranges[i];
			
			if(isnan(dRange) || dRange > msg.range_max)
				continue;
			else
			{   
				if(i <= 10)
				{
					frontcount++;
					frontSum += dRange;
				}
				leftcount++;
			    leftSum += dRange;
			}
		}
		else if(i>=340 && i<360)
		{    
			double dRange = msg.ranges[i];
			
			if(isnan(dRange) || dRange > msg.range_max)
				continue;
			else
			{   
				if(i >= 350)
				{
					frontcount++;
					frontSum += dRange;
				}
				rightcount++;
			    rightSum += dRange;
			}
		}
		else
			continue;
			
	}
    if(leftcount != 0)
	{
		if(leftSum/leftcount < 0.35)
			obstacle = true;
	}
	if(frontcount != 0)
	{
		if(frontSum/frontcount < 0.35)
			obstacle = true;
	}
	if(rightcount != 0)
	{
		if(rightSum/rightcount < 0.35)
			obstacle = true;
	}

	if(obstacle)
	{

	}
}

void odomMsgCallback(const nav_msgs::Odometry &msg)
{
    mutex.lock(); {
        g_odom = msg;
    } mutex.unlock();
}

tf::Transform getCurrentTransformation(void)
{
    tf::Transform transformation;

    nav_msgs::Odometry odom;
    
    mutex.lock(); {
        odom = g_odom;
    } mutex.unlock();

    transformation.setOrigin(tf::Vector3(odom.pose.pose.position.x, odom.pose.pose.position.y, odom.pose.pose.position.z));

    transformation.setRotation(tf::Quaternion(odom.pose.pose.orientation.x, odom.pose.pose.orientation.y, odom.pose.pose.orientation.z, odom.pose.pose.orientation.w));

    return transformation;
}

tf::Transform getInitialTransformation(void)
{
    tf::Transform transformation;

    ros::Rate loopRate(1000.0);

    while(ros::ok()) {
        ros::spinOnce();

        transformation = getCurrentTransformation();

        if(transformation.getOrigin().getX() != 0. || transformation.getOrigin().getY() != 0. && transformation.getOrigin().getZ() != 0.) {
            break;
        } else {
            loopRate.sleep();
        }
    }

    return transformation;
}

double getHeadingAngle(tf::Transform temp)
{
    tf::Quaternion rotationQuat = temp.getRotation();
    double tempvalue = atan2((2 * rotationQuat[2] * rotationQuat[3]) , (1-(2 * (rotationQuat[2] * rotationQuat[2]) ) ));
    
    return tempvalue;
}

bool doRotation(tf::Transform &initialTransformation, double dRotation, double dRotationSpeed)
{
    geometry_msgs::Twist baseCmd;
    baseCmd.linear.x = 0.0;
    baseCmd.linear.y = 0.0;
    
    if(dRotation < 0.) 
        baseCmd.angular.z = -dRotationSpeed;
    else 
        baseCmd.angular.z = dRotationSpeed;
    
    bool bDone = false;
    ros::Rate loopRate(1000.0);

    while(ros::ok() && !bDone) 
    {
        ros::spinOnce();
      
        tf::Transform currentTransformation = getCurrentTransformation();
        tf::Transform relativeTransformation = initialTransformation.inverse() * currentTransformation ;

        double dAngleTurned = getHeadingAngle(relativeTransformation);
        
        if( fabs(dAngleTurned) > fabs(dRotation) || (abs(pre_dAngleTurned - dRotation) <  abs(dAngleTurned - dRotation)) || (dRotation == 0)) 
    	{
            bDone = true;
            pre_dAngleTurned = dAngleTurned;
            break;
        } 
        else
        {
	        pre_dAngleTurned = dAngleTurned;
        
            pub.publish(baseCmd);

            loopRate.sleep();
        }
    }
    
    
    baseCmd.linear.x = 0.05;
    baseCmd.angular.z = 0.0;
    pub.publish(baseCmd);

    return bDone;
}

bool doTranslation(tf::Transform &initialTransformation, double dTranslation, double dTranslationSpeed)
{
    geometry_msgs::Twist baseCmd;

    if(dTranslation < 0)
        baseCmd.linear.x = -dTranslationSpeed;
    else 
        baseCmd.linear.x = dTranslationSpeed;
 
    baseCmd.linear.y = 0;
    baseCmd.angular.z = 0;

    bool bDone = false;
    ros::Rate loopRate(1000.0);

    while(ros::ok() && !bDone) 
    {
        ros::spinOnce();

        tf::Transform currentTransformation = getCurrentTransformation();

        tf::Transform relativeTransformation = initialTransformation.inverse() * currentTransformation ;
        double dDistMoved = relativeTransformation.getOrigin().length();

        if(fabs(dDistMoved) >= fabs(dTranslation)) 
        {
            bDone = true;
            break;
        }
        else
        {
            pub.publish(baseCmd);

            loopRate.sleep();
        }
    }

    baseCmd.linear.x = 0.0;
    baseCmd.angular.z = 0.0;
    pub.publish(baseCmd);

    return bDone;
}

int main(int ac, char *av[])
{
    ros::init(ac, av, "CDProject");

    ros::NodeHandle nhp, nhs, nh1, nh2;
    // odom msg
	ros::Subscriber sub = nhs.subscribe("/odom", 100, &odomMsgCallback);
	ros::Subscriber subscan = nh2.subscribe("/scan", 10, &scanMsgCallback);
    pub = nhp.advertise<geometry_msgs::Twist>("/cmd_vel", 100);

	FILE *fp = fopen(av[1], "r");
	if(fp == NULL)
	{
		fprintf(stderr, "fopen() error!!!\n");
		exit(1);
	}

	int n;
    double prevX, prevY;
    double x, y;
    
    tf::Transform initialTransformation = getInitialTransformation();
    // 초기값 설정
    prevX = initialTransformation.getOrigin().getX();
    prevY = initialTransformation.getOrigin().getY();
    
    fscanf(fp, "%d", &n);
    fscanf(fp, "%lf %lf", &x, &y);
 
    for(int i=0; i<n; i++)
    {
        printf("--------------------------------------------\n");
        printf("PATH %d : [%lf] [%lf]\n", i+1, x, y);
        
        double dRotation = toDegree(atan2(y-prevY, x-prevX) - getHeadingAngle(getCurrentTransformation()));
        float _dRatation = fmod(dRotation, 360);
        double dTranslation = sqrt(pow(prevX-x, 2) + pow(prevY-y, 2));
        
        if(fabs(_dRatation) > 180)
        {
	        if(dRotation > 0) 
	            dRotation = -(360-_dRatation);
            else 
                dRotation = (360+_dRatation); 
        }
        else
            dRotation = _dRatation;
       
        doRotation(initialTransformation, toRadian(dRotation), 0.75);
    
        if(fabs(getHeadingAngle(getCurrentTransformation()) - atan2(y-prevY, x-prevX)) > 0.25)
        {
            printf("angle modify...\n");
            initialTransformation = getCurrentTransformation();
            i--;
            continue;
        }
            
        ros::Duration(2.0).sleep(); 
        
        doTranslation(initialTransformation, dTranslation, 0.25);
        
        initialTransformation = getCurrentTransformation();
        prevX = initialTransformation.getOrigin().getX();
        prevY = initialTransformation.getOrigin().getY();

        if(fabs(initialTransformation.getOrigin().getX()-x) < 0.1 && fabs(initialTransformation.getOrigin().getY()-y) < 0.1)
            fscanf(fp, "%lf %lf", &x, &y);
        else
        {
            printf("position modify...\n");
            i--;
        }
        
        printf("SUCESS! <%lf> <%lf>\n", prevX, prevY);
        
        ros::Duration(2.0).sleep();      
    }
    
    fclose(fp);
    return 0;
}
