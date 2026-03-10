// Pinos
const int pinA = 13, pinB = 12;
const int pinSaida = 11, pinCarry = 10;
const int pinOP1 = 7, pinOP0 = 6;
const int BT_OPERACAO = 2, BT_ENTRADAS = 3;

// Variáveis de estado
int contadorEntradas = 0;
int contadorOperacao = 0;

void setup() {
  pinMode(pinA, OUTPUT);
  pinMode(pinB, OUTPUT);
  pinMode(pinOP0, OUTPUT);
  pinMode(pinOP1, OUTPUT);
  pinMode(pinSaida, OUTPUT);
  pinMode(pinCarry, OUTPUT);
  pinMode(BT_OPERACAO, INPUT_PULLUP);
  pinMode(BT_ENTRADAS, INPUT_PULLUP);
}

void loop() {
  if (digitalRead(BT_ENTRADAS) == LOW) {
    contadorEntradas = (contadorEntradas + 1) % 4;
    delay(250);
  }
  if (digitalRead(BT_OPERACAO) == LOW) {
    contadorOperacao = (contadorOperacao + 1) % 4;
    delay(250);
  }
  digitalWrite(pinA, (contadorEntradas >> 1) & 1);
  digitalWrite(pinB, contadorEntradas & 1);
  digitalWrite(pinOP1, (contadorOperacao >> 1) & 1);
  digitalWrite(pinOP0, contadorOperacao & 1);
  processarULA(digitalRead(pinA), digitalRead(pinB), digitalRead(pinOP1), digitalRead(pinOP0));
}

// ULA
void processarULA(int a, int b, int op1, int op0) {
  if (op1 == LOW && op0 == LOW) { // 00 = AND
    digitalWrite(pinSaida, a && b);
    digitalWrite(pinCarry, LOW);
  } 
  else if (op1 == LOW && op0 == HIGH) { // 01 = OR
    digitalWrite(pinSaida, a || b);
    digitalWrite(pinCarry, LOW);
  } 
  else if (op1 == HIGH && op0 == LOW) { // 10 = NOT A
    digitalWrite(pinSaida, !a);
    digitalWrite(pinCarry, LOW);
  } 
  else if (op1 == HIGH && op0 == HIGH) { // 11 = SOMA
    digitalWrite(pinSaida, a ^ b);
    digitalWrite(pinCarry, a && b);
  }
}