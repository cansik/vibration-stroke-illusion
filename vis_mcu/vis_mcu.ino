#define VIB_PIN D0

void setup() {
  pinMode(VIB_PIN, OUTPUT);

   Serial.begin(9600);


  Serial.println("starting...");
  delay(3000);
  Serial.println("done");
}

void loop() {
  Serial.println("vibrate");
  analogWrite(VIB_PIN, 1023);
  delay(500);

  Serial.println("stop");
  analogWrite(VIB_PIN, 0);
  delay(1000);
}
