//Initialisiere Messsolarzellen (Analoge Eingaenge)
int solarPin0 = 0;
int solarPin1 = 1;
int solarPin2 = 2;
int solarPin3 = 3;

//Inizialisiere Variablen zum einlesen der Spannungen
int solarSpannung0;
int solarSpannung1;
int solarSpannung2;
int solarSpannung3;

//Initialisiere Messung Batterie (Analoger Eingang)
//int VBatterie = 12;  //Nur für Erweiterung eingeplant

//Variablen zu den Ausgänge der HBrücke(Motoren)
int goToSolarzelle1, goToSolarzelle2, goToSolarzelle3, goToSolarzelle4 = 0;

//Initialisiere Motoren (Digitale Ausgaenge)
int motorB1 = 6;
int motorB2 = 9;
int motorBH = 7;
int motorL1 = 10;
int motorL2 = 11;
int motorLH = 8;

void setup() {
//Inizialisiere Serialport
  Serial.begin(9600);
  delay(10);
  Serial.println("Hallo, Arduino UNO steht zu Ihrer Verfuegung");
  //Inizialisiere Zähler für Ausgangsdefinition
//  for (int i = 0; i<4; i++) {
//    //Lege Endschalter 1 bis 4 als Input fest
//    pinMode(endschalterImp2, INPUT), (endschalterImp3, INPUT), (endschalterImp4, INPUT), (endschalterImp5, INPUT);
//    digitalWrite(endschalterImp2, LOW), (endschalterImp3, LOW), (endschalterImp4, LOW), (endschalterImp5, LOW);
//}
  //Definiere Motor Ausgänge
//  pinMode(motorB1, OUTPUT);
//  pinMode(motorB2, OUTPUT);
//  pinMode(motorBH, OUTPUT);
//  pinMode(motorL1, OUTPUT);
//  pinMode(motorL2, OUTPUT);
//  pinMode(motorLH, OUTPUT);
}

void readVal() {
  solarSpannung0 = 0;
  solarSpannung1 = 0;
  solarSpannung2 = 0;
  solarSpannung3 = 0;
  for (int i = 0; i<20; i++) {
    solarSpannung0 += analogRead(solarPin0);
    solarSpannung1 += analogRead(solarPin1);
    solarSpannung2 += analogRead(solarPin2);
    solarSpannung3 += analogRead(solarPin3);
  }
  
  solarSpannung0 = solarSpannung0 / 20;
  solarSpannung1 = solarSpannung1 / 20;
  solarSpannung2 = solarSpannung2 / 20;
  solarSpannung3 = solarSpannung3 / 20;
}

void sendVoltage() {
  Serial.println(solarSpannung0);
  Serial.println(solarSpannung1);
  Serial.println(solarSpannung2);
  Serial.println(solarSpannung3);
}

void loop() {
  readVal();
  sendVoltage();
  delay(5000);
}
