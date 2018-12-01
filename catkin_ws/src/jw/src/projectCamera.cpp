#include<ros/ros.h>
#include<opencv2/opencv.hpp>
#include<cv_bridge/cv_bridge.h>
#include<jw/projectMsg.h>
#include<sensor_msgs/LaserScan.h>
#include<boost/thread/mutex.hpp>

using namespace cv;
using namespace std;

boost::mutex mutex;
bool Turning = 0;
vector< vector< Point> > leftcontours, rightcontours, stopcontours, gocontours;
ros::Publisher mypub;

template<typename T> inline bool isnan(T value)
{
	return value != value;
}

void scanMsgCallback(const sensor_msgs::LaserScan &msg)
{
	if(Turning)
		return ;
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
		printf("Detect obstacle!!! ");
		
		mutex.lock(); {
			Turning = true;
		} mutex.unlock();

		jw::projectMsg obstaclemsg;
		obstaclemsg.Move = -1;
		obstaclemsg.Done = 0;
		switch(rand()%2)
		{
			case 0:
				printf("(Turn Right)\n");
				obstaclemsg.Direction = -1;
				break;
			case 1:
				printf("(Turn Left)\n");
				obstaclemsg.Direction = 1;
				break;
		}
		mypub.publish(obstaclemsg);
	}
}

void projectMsgCallback(const jw::projectMsg &msg)
{
	printf("Accept Done Message for Turn\n");
	Turning = false;
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "projectCamera");
	ros::NodeHandle nh1, nh2, nhs, nhp;

	ros::Subscriber sub = nh2.subscribe("/scan", 10, &scanMsgCallback);

	ros::Subscriber mysub = nhs.subscribe("project_msg_done", 100, &projectMsgCallback);
	mypub = nhp.advertise<jw::projectMsg>("project_msg", 100);

	srand(time(NULL));

	ros::spin();

	return 0;
}
