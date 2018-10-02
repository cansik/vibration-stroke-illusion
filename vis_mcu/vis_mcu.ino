#define VIB_SIZE 8

String inputString;
String pinString;
String pulseString;

int pins[VIB_SIZE] = { D0, D1, D2, D3, D4, D5, D6, D7 };

void setup() {
  for (auto i = 0; i < VIB_SIZE; i++)
  {
    pinMode(pins[i], OUTPUT);
    digitalWrite(pins[i], LOW);
  }

  Serial.begin(9600);

  Serial.println("starting...");
  delay(1000);

  Serial.println("done");
}

void loop() {
  readInput();

  delay(100);

  Serial.println("ready!");
}

void readInput()
{
  // read command
  inputString = "";
  pinString = "";
  pulseString = "";
  while (Serial.available()) {
    auto c = static_cast<char>(Serial.read());
    inputString += c;
    delay(2);
  }

  // if no input -> opt out
  if (inputString.length() == 0) {
    return;
  }

  // process input
  if (inputString.startsWith("v"))
  {
    pinString = inputString.substring(3, 2);
    pulseString = inputString.substring(5, 4);

    auto pin = pinString.toInt();
    auto pulse = pulseString.toInt();

    analogWrite(pins[pin], pulse);
  }
}

