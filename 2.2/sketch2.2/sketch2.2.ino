
int sensePin = 0;
int senseRead;
void setup(void) {
  Serial.begin(9600);
}
void loop(void) {
  senseRead = analogRead(sensePin);
  Serial.println(senseRead);
}

