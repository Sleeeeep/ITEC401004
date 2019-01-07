int setupSizeX = 594, setupSizeY = 420;
int setSizeX = 594, setSizeY = 420;
int setDraw = 0, saveDraw;

int pencilWeight = 3;
color clickColor = color(0);

int dataSensitive = 12;

int endPointX, endPointY, endFlag = 0;

int nextPointer=0;
int dataSetSize = 1000;
int dataSetX[] = new int[dataSetSize];
int dataSetY[] = new int[dataSetSize];

int buttonPointX =80,  buttonPointY = 80;

int nextDraw = 0,nextDrawTemp;

int drawNextPointer = 0;
int drawDataSetSize = 2000;
int drawDataSet[][] = new int[drawDataSetSize][4];

int drawSpeed= 30;
PImage img, imgBut1, imgBut2, imgBut3, imgBut4, imgBut5;

int printSize = 1;


void setup() {
  surface.setSize(setSizeX, setSizeY);
  fill(255);
  
  img = loadImage("img05.png");
  imgBut1 = loadImage("img06.png");
  imgBut2 = loadImage("img07.png");
  imgBut3 = loadImage("img08.png");
  imgBut4 = loadImage("img09.png");
  imgBut5 = loadImage("img10.png");
}

void draw() {
  
  switch(setDraw){
   case 0: 
      surface.setSize(setupSizeX, setupSizeY);
      fill(255);
      image(img,0,0);
      bgSwich();
      delay(100);
      break;
   case 1:
      create_Button(buttonPointX,buttonPointY);
      savePoint();
      break;
   case 2:
      create_Button(buttonPointX,buttonPointY);
      savePoint();
      break;
   case 5:
      createLine();
      delay(drawSpeed);
      nextDraw++;
      if(nextDraw >= nextPointer){
        nextDraw=0;
        setDraw = 6;
     
      }
      break;
      
   case 6:
      print(nextPointer);
      println(" : number create DataSet");
      rect(0, 0, setSizeX, setSizeY);
      dataFormat();
      nextPointer = 0;
      setDraw = 0;
      delay(3000);
      
      break;
      
   case 7:
      if(nextDraw <1){
        nextPointer =0;
        setDraw = saveDraw;
        break;
      }
      if(drawDataSet[nextDraw][0] == -1 && drawDataSet[nextDraw][1] == -1){
        for(int i = nextPointer-1;;i--){
          if(i<1){
            nextPointer = 0;
            break; 
          }
          if(dataSetX[i] == -1 && dataSetY[i] == -1){
            nextPointer = i-1;
            break;
          }
        }
        
        pencil_For_White(drawDataSet[nextDraw-1][0],drawDataSet[nextDraw-1][1],drawDataSet[nextDraw-1][2],drawDataSet[nextDraw-1][3]);  
        drawNextPointer = nextDraw;
        nextDraw =0;
        setDraw = saveDraw;
        println("Remove End Point : "+ nextPointer);
        
      }
      else{
        pencil_For_White(drawDataSet[nextDraw][0],drawDataSet[nextDraw][1],drawDataSet[nextDraw][2],drawDataSet[nextDraw][3]);
        nextDraw--;
      }
      break;
   case 8:

  }
}

void bgSwich(){
  if(mousePressed && mouseX<300){
      setSizeX = 594; setSizeY = 500;
      surface.setSize(setSizeX, setSizeY);
      rect(0, 0, setSizeX, setSizeY); 
      background(255);
      setDraw = 1;
      println("setbg : 1");
  }
  else if(mousePressed && mouseX>300){
      setSizeX = 594; setSizeY = 500;
      surface.setSize(setSizeX, setSizeY);
      rect(0, 0, setSizeX, setSizeY); 
      background(255);
      setDraw = 2;
      println("setbg : 2");
  }
}

void create_Button(int x,int y){
  strokeWeight(3);
  line(0,setSizeY - x,setSizeX,setSizeY - x);
  
  //start
  rect(setSizeX -x, setSizeY -y,x-2,y-2,10);
  image(imgBut1,(setSizeX -x) +7,setSizeY -y +7);
  
  //remove
  rect(setSizeX -x*2, setSizeY -y,x-2,y-2,10);
  image(imgBut3,(setSizeX -x*2) + 6,setSizeY -y + 10);
  
  //back
  rect(setSizeX -x*3, setSizeY -y,x-2,y-2,10);
  image(imgBut2,(setSizeX -x*3) +6,setSizeY -y+10);
  
  rect(setSizeX -x*4, setSizeY -y,x-2,y-2,10);
  image(imgBut4,(setSizeX -x*4) +9,setSizeY -y+10);
  
  rect(setSizeX -x*5, setSizeY -y,x-2,y-2,10);
  image(imgBut5,(setSizeX -x*5) +9,setSizeY -y+10);
  
  strokeWeight(pencilWeight);
}

void pencil(int x, int y, int px, int py) {
    stroke(clickColor);
    strokeWeight(pencilWeight);
    
    line(x, y, px, py);
}

void pencil_For_White(int x, int y, int px, int py){
    strokeWeight(5);
    stroke(255,255,255);
    line(x,y,px,py);
    stroke(0,0,0);
    strokeWeight(pencilWeight); 
}
void pencilSave(int x, int y, int px, int py){
  drawDataSet[drawNextPointer][0] = x;
  drawDataSet[drawNextPointer][1] = y;
  drawDataSet[drawNextPointer][2] = px;
  drawDataSet[drawNextPointer][3] = py;
  drawNextPointer++;
}
void createLine(){
   if(dataSetX[nextDraw] == -1 || dataSetY[nextDraw] == -1){
      strokeWeight(1);
      stroke(255,0,0);
      line(dataSetX[nextDraw-1], dataSetY[nextDraw-1], dataSetX[nextDraw+1], dataSetY[nextDraw+1]);
      strokeWeight(pencilWeight);
      stroke(0,0,0);
      
    }
    else if(dataSetX[nextDraw+1] == -1 || dataSetY[nextDraw+1] == -1){
      delay(100);
    }
    else{
      print("create Line : "+dataSetX[nextDraw]+ " " +dataSetY[nextDraw] + " - ");
      println(dataSetX[nextDraw+1]+ " " +dataSetY[nextDraw+1]);
      
      line(dataSetX[nextDraw], dataSetY[nextDraw], dataSetX[nextDraw+1], dataSetY[nextDraw+1]);
    }
}


void savePoint(){
  int x = mouseX;
  int y = mouseY;
  int px = pmouseX;
  int py = pmouseY;
  
  if(mousePressed){
    if(setSizeX-buttonPointX < x && setSizeY-buttonPointY < y){
      setDraw = 5;
      rect(0, 0, setSizeX, setSizeY); 
    }
    else if(setSizeX-buttonPointX > x && setSizeX-buttonPointX * 2 < x && setSizeY-buttonPointY < y){    
      rect(0, 0, setSizeX, setSizeY);
      println("Remove ALL");
      delay(100);
      nextPointer = 0;
    }
    else if(setSizeX-buttonPointX > x && setSizeX-buttonPointX * 3 < x && setSizeY-buttonPointY < y){
      nextDraw = drawNextPointer - 1;
      saveDraw = setDraw;
      setDraw = 7;
      println("Remove Start Point : "+ nextPointer);
    }
    else if(setSizeX-buttonPointX > x && setSizeX-buttonPointX * 4 < x && setSizeY-buttonPointY < y){    
      println("Set Size A4");
      printSize = 1;
      delay(100);
    }
    else if(setSizeX-buttonPointX > x && setSizeX-buttonPointX * 5 < x && setSizeY-buttonPointY < y){    
      println("Set Size A2");
      printSize = 2;
      delay(100);
    }
    else{
      pencil(x, y, px, py);
      pencilSave(x, y, px, py);
      
      if(nextPointer <= dataSetSize - 2){
        if(dataSetX[nextPointer] > x + dataSensitive || dataSetY[nextPointer] > y + dataSensitive 
        || dataSetX[nextPointer] < x - dataSensitive || dataSetY[nextPointer] < y - dataSensitive ){
          if(endFlag == 1){
            nextPointer++;
            dataSetX[nextPointer] = -1;
            dataSetY[nextPointer] = -1;
            pencilSave(-1, -1, -1, -1);
            
            println(nextPointer + " : Stop point -1,-1");
          
            nextPointer++;
            dataSetX[nextPointer] = x;
            dataSetY[nextPointer] = y;
          
            print(nextPointer + " : new create line ");
            println(x,y);
            //println(x);
            //println(y);
          
            endFlag = 0;
          }
          else{
            nextPointer++;
            dataSetX[nextPointer] = x;
            dataSetY[nextPointer] = y;
            print(nextPointer + " : new create point ");
            println(x,y);
            //println(x);
            //println(y);
          }
        }

      }
      else{
        println("Not Save : Many Data");
      }
    }  
  }
  else{
   if(endFlag == 0){
     endPointX = x;
     endPointY = y;
     endFlag = 1;
   }
 
 }
}

void dataFormat(){
   int i;
  String data = "";
  
  print("START\n");
  for (i=1; i<nextPointer; i++)
  {
    if (dataSetX[i] == -1 && dataSetY[i] == -1) // up pen and move to next pos
    {
      data = "UP\n";
      print(data);
      data = dataSetX[i+1] + " " + dataSetY[i+1] + "\n";
      print(data);
    }
    else
    {
      if (dataSetX[i-1] == -1 || dataSetY[i-1] == -1) // just down pen
      {
        data = "DOWN\n";
        print(data);
      }
      if(dataSetX[i+1] == -1 && dataSetY[i+1] == -1)
        continue;
      data = dataSetX[i+1] + " " + dataSetY[i+1] + "\n";
      print(data);
    }
  }
  print("END\n");
}

