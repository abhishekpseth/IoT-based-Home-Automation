import controlP5.*; //import ControlP5 library
import processing.serial.*;
PImage img1,img2;
Serial port;
int t1=0,t2=0;
ControlP5 cp5; //create ControlP5 object
PFont font1,font2;

void setup()
{ //same as arduino program

  size(2000, 2000);    //window size, (width, height)
  
  printArray(Serial.list());   //prints all available serial ports
  
 
 port = new Serial(this, "COM11", 9600);  //i have connected arduino to com3, it would be different in linux and mac os
  
  //lets add buton to empty window
  
   img1= loadImage("lighton.jpg");
   img2= loadImage("lightoff.jpg");
  cp5 = new ControlP5(this);
  font1 = createFont("calibri light bold", 30);    // custom fonts for buttons and title
  font2=createFont("calibri light bold",20);
  cp5.addButton("MANUAL_CONTROL_1")       //"red" is the name of button
    .setPosition(30, 120)                //x and y coordinates of upper left corner of button
    .setSize(225, 50)                   //(width, height)
    .setFont(font2);
 cp5.addButton("AUTO_CONTROL_1") 
    .setPosition(30,190)              
    .setSize(225, 50)                  
    .setFont(font2);
 cp5.addButton("MANUAL_CONTROL_2") 
    .setPosition(30,550)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("AUTO_CONTROL_2") 
    .setPosition(30,620)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("STOP_LIGHT") 
    .setPosition(30,260)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("STOP_FAN") 
    .setPosition(30,690)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("OPEN") 
    .setPosition(30,820)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("CLOSE") 
    .setPosition(400,820)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("ON_1") 
    .setPosition(1000,120)              
    .setSize(225, 50)                  
    .setFont(font2); 
 cp5.addButton("OFF_1") 
    .setPosition(1250,120)              
    .setSize(225, 50)                  
    .setFont(font2);    
 cp5.addButton("MANUAL_CONTROL_3") 
    .setPosition(710,120)              
    .setSize(225, 50)                  
    .setFont(font2);
 cp5.addButton("AUTO_CONTROL_3") 
    .setPosition(710,190)              
    .setSize(225, 50)                  
    .setFont(font2);    
    
  //slider  
  cp5.addSlider("lED")
 .setPosition(300,120)
 .setSize(350,60)
 .setRange(150,170)  //  lowest:0 and highest:255
 .setValue(160)      // start value
 .setColorBackground(color(0,0,255))
 .setColorForeground(color(255,0,0))
 .setColorValue(color(255,255,255))
 .setColorActive(color(0,255,0))
 ;
 cp5.addSlider("FAN")
 .setPosition(300,550)
 .setSize(350,60)
 .setRange(171,191)  //  lowest:0 and highest:255
 .setValue(181)      // start value
 .setColorBackground(color(0,0,255))
 .setColorForeground(color(255,0,0))
 .setColorValue(color(255,255,255))
 .setColorActive(color(0,255,0))
 ; 
} 
void draw()
{  //same as loop in arduino

  background(150, 0 , 150); // background color of window (r, g, b) or (0 to 255)
  if(t1==0) image(img2,400,200,200,270);
  else  image(img1,400,200,200,270);
  if(t2==0) image(img2,1500,120,290,350);
   else image(img1,1500,120,290,350);
  //lets give title to our window
  fill(0, 255, 0);               //text color (r, g, b)
  textFont(font1);
  text("HOME AUTOMATION", 850, 30);  // ("text", x coordinate, y coordinate)
  textFont(font2);
  text("LIGHT1",30,100);
  text("LIGHT2",710,100);
  text("FAN 1",30,530);
  text("DOOR LOCK",30,800);
}
int a=0,b=0,c=0;

// for light 1
void MANUAL_CONTROL_1()
{
 a=1- a;
}
 void LED_1(int LED)
   {
     if(a ==0) port.write(LED);
   } 

void AUTO_CONTROL_1()
{
 port.write(200);
}

void STOP_LIGHT()
 {
   port.write(201);
 }    

// for light 2
void MANUAL_CONTROL_3()
{
  b=1-b;
}
void ON_1()
 {
  if(b ==1)
  {
    port.write(202);
    t2=1;
  }  
 }    
void OFF_1()
 {
  if(b ==1) 
  {
    port.write(203);
    t2=0;
  }
  
 }
void AUTO_CONTROL_3()    
 {
  port.write(204); 
 }   


// for fan 1 
void MANUAL_CONTROL_2()  
 {
  c=1-c;
 }  
void FAN(int FAN)
 {
  if(c==1)  port.write(FAN);
 }
void AUTO_CONTROL_2()
{
  port.write(205); 
}
void STOP_FAN()
{
  port.write(206); 
}


// for door
void OPEN()
{
  port.write(207); 
}  

void CLOSE()
{
  port.write(208); 
}  

