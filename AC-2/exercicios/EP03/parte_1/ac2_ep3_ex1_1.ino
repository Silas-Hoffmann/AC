int LedVermelho=12;
int LedAmarelo=9;
int LedVerde=7;
int LedAzul=2;

void setup() {
  pinMode(LedVermelho, OUTPUT);
  pinMode(LedAmarelo, OUTPUT);
  pinMode(LedVerde, OUTPUT);
  pinMode(LedAzul, OUTPUT);
}

void loop() {
  digitalWrite(LedVermelho, HIGH);
  for (int i=0;i<3;i++){
    digitalWrite(LedAzul, HIGH);
  	delay(500);
  	digitalWrite(LedAzul, LOW);
  	delay(500);
  }
  digitalWrite(LedVermelho, LOW);
  digitalWrite(LedVerde, HIGH);
  for (int i=0;i<4;i++){
    digitalWrite(LedAzul, HIGH);
  	delay(500);
  	digitalWrite(LedAzul, LOW);
  	delay(500);
  }
  digitalWrite(LedVerde, LOW);
  digitalWrite(LedAmarelo, HIGH);
  for (int i=0;i<2;i++){
    digitalWrite(LedAzul, HIGH);
  	delay(500);
  	digitalWrite(LedAzul, LOW);
  	delay(500);
  }
  digitalWrite(LedAmarelo, LOW);
}
