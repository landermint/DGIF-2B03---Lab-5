import processing.serial.*;

float senseValue = 0;

Serial myPort;

void setup() {
  size(400, 400);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(senseValue);
  ellipseMode(CORNER);
  noStroke();
  float mappedval = map(senseValue,0,255,0,100);
  fill(0);
  ellipse(150,165,100,50+mappedval);
  fill(255,0,0);
  ellipse(125,150,100,50);
  ellipse(175,150,100,50);
  ellipse(150,175+mappedval,100,50);
  float mappedval2 = map(senseValue,0,255,255,0);
  fill(mappedval2);
  ellipse(50,50,50,50);
  ellipse(300,50,50,50);

}

void serialEvent(Serial myPort) {
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);

    float colors = float(inString);
      senseValue = map(colors, 920, 700, 0, 255);

  }
}

