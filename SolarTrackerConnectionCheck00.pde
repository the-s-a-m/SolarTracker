//Initialisiere Endschalter (Digiale Eingaenge)
//int endschalterImp2 = 2;
//int endschalterImp3 = 3;
//int endschalterImp4 = 4;
//int endschalterImp5 = 5;

//definiere Variabeln für Endschalter
//int endschalter0, endschalter1, endschalter2, endschalter3 = 0;

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

//definiere ShuntMessung
int shuntSpannung0 = 4;
int shuntSpannung1 = 5;

//definiere ShuntMessungs Variablen
int shuntVar1, shuntVar2 = 0;

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
  pinMode(motorB1, OUTPUT);
  pinMode(motorB2, OUTPUT);
  pinMode(motorBH, OUTPUT);
  pinMode(motorL1, OUTPUT);
  pinMode(motorL2, OUTPUT);
  pinMode(motorLH, OUTPUT);
}

void checkSolarPin0() {
    solarSpannung0 = analogRead(solarPin0);
    Serial.print("solarPin0 hat ");
    Serial.print(solarSpannung0*0.0048828125);
    Serial.println(" Volt");
    Serial.println("Check der AnalogInput 0");
}

void checkSolarPin1() {    
    solarSpannung1 = analogRead(solarPin1);
    Serial.print("solarPin1 hat ");
    Serial.print(solarSpannung1*0.0048828125);
    Serial.println(" Volt");
    Serial.println("Check der AnalogInput 1");
}
    
void checkSolarPin2() {
    solarSpannung2 = analogRead(solarPin2);
    Serial.print("solarPin2 hat ");
    Serial.print(solarSpannung2*0.0048828125);
    Serial.println(" Volt");
    Serial.println("Check der AnalogInput 2");
}

void checkSolarPin3() {
    solarSpannung3 = analogRead(solarPin3);
    Serial.print("solarPin3 hat ");
    Serial.print(solarSpannung3*0.0048828125);
    Serial.println(" Volt");
    Serial.println("Check der AnalogInput 3");
}

void shuntCheck1() {
  shuntVar1 = analogRead(shuntSpannung0);
  Serial.print("shuntSpannung0 hat ");
  Serial.print(shuntVar1*0.0048828125);
  Serial.println(" Volt");
  Serial.println("Check der AnalogInput 4");
}
  
void shuntCheck2() {
  shuntVar2 = analogRead(shuntSpannung1);
  Serial.print("shuntSpannung1 hat ");
  Serial.print(shuntVar2*0.0048828125);
  Serial.println(" Volt");  
  Serial.println("Check der AnalogInput 5");  
}

void motor1CheckLinks() {
  goToSolarzelle1 = 1;
  goToSolarzelle2 = 0;
  digitalWrite(motorB1, goToSolarzelle1);
  digitalWrite(motorB2, goToSolarzelle2);
  digitalWrite(motorBH, 1);
  Serial.println("Motor 1 check Links");
}

void motor1CheckRechts() {
  goToSolarzelle1 = 0;
  goToSolarzelle2 = 1;
  digitalWrite(motorB1, goToSolarzelle1);
  digitalWrite(motorB2, goToSolarzelle2);
  digitalWrite(motorBH, 1);
  Serial.println("Motor 1 check Rechts");
}

void motor2CheckLinks() {
  goToSolarzelle3 = 1;
  goToSolarzelle4 = 0;
  digitalWrite(motorL1, goToSolarzelle3);
  digitalWrite(motorL2, goToSolarzelle4);
  digitalWrite(motorLH, 1);
  Serial.println("Motor 2 check Links");
}

void motor2CheckRechts() {
  goToSolarzelle3 = 0;
  goToSolarzelle4 = 1;
  digitalWrite(motorL1, goToSolarzelle3);
  digitalWrite(motorL2, goToSolarzelle4);
  digitalWrite(motorLH, 1);
  Serial.println("Motor 2 check Rechts");
}

void loop() {
  Serial.println("Analog connection Check");
//  checkSolarPin0();
//  checkSolarPin1();
//  checkSolarPin2();
//  checkSolarPin3();
//  shuntCheck1();
//  shuntCheck2();
//  motor1CheckLinks();
//  motor1CheckRechts();
//  motor2CheckLinks();
//  motor2CheckRechts();
  delay(2000);
}
