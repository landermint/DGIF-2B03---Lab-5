import processing.serial.*;

float redValue = 0;        // red value

Serial myPort;

void setup() {
  size(400, 400);
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[2], 9600);
  myPort.bufferUntil('\n');
}

void draw() {
  background(redValue);
  ellipseMode(CORNER);
  noStroke();
  float mappedval = map(redValue,0,255,0,100);
    fill(0);
  ellipse(150,165,100,50+mappedval);
    fill(255,0,0);

  ellipse(125,150,100,50);
  ellipse(175,150,100,50);
  ellipse(150,175+mappedval,100,50);
  float mappedval2 = map(redValue,0,255,255,0);
  fill(mappedval2);
  ellipse(50,50,50,50);
  ellipse(300,50,50,50);

}

void serialEvent(Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    inString = trim(inString);

    float colors = float(inString);
      redValue = map(colors, 920, 700, 0, 255);

  }
}

