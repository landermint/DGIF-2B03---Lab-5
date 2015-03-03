
int photocellPin = 0; // the cell and 10K pulldown are connected to a0
int photocellReading; // the analog reading from the sensor divider
void setup(void) {
  Serial.begin(9600);
}
void loop(void) {
  photocellReading = analogRead(photocellPin);
  Serial.println(photocellReading); // the raw analog reading
}

