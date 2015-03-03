import processing.serial.*;
Serial port;
int mapped;
float x;
float y;
float easing = 0.05;

void setup() {
  size(640, 360); 
  noStroke();  
  port = new Serial(this, Serial.list()[2], 9600);  

}

void draw() { 
  background(255);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
 fill(100,100,255);
 rect(10,10,width-20,height-20);
 fill(0);

 ellipse(x, y, 66, 66);
 mapped = (int)map(x,0,width,30,50);
 port.write(mapped);
}
