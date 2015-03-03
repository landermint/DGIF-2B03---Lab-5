#include <Servo.h> 

Servo myservo;

void setup()
{
  Serial.begin(9600);
  myservo.attach(9);
}

void loop() {
  byte mapped;

  if (Serial.available()) {
    mapped = Serial.read();
    myservo.write(mapped);
  }
}

