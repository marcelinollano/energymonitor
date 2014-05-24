int inPin = 2;         // the number of the input pin
int outPin = 13;       // the number of the output pin

int state = LOW;       // the current state of the output pin
int reading;           // the current reading from the input pin
int previous = HIGH;   // the previous reading from the input pin

long time = 0;         // the last time the output pin was toggled
long debounce = 300;   // the debounce time, increase if the output flickers

void setup()
{
  Serial.begin(9600);
  pinMode(inPin, INPUT);
  pinMode(outPin, OUTPUT);
  Serial.println('0'); 
}

void loop()
{
  reading = digitalRead(inPin);

  if (reading == HIGH && previous == LOW && millis() - time > debounce) {
    if (state == HIGH) {
      state = LOW;
      Serial.println('0');
    } else {
      state = HIGH;
      Serial.println('1');
      time = millis();
    }
  }

  digitalWrite(outPin, state);
  previous = reading;
}
