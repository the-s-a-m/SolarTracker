//Initialisiere Endschalter (Digiale Eingaenge)
//int endschalterImp2 = 2;
//int endschalterImp3 = 3;
//int endschalterImp4 = 4;
//int endschalterImp5 = 5;

////definiere Variabeln für Endschalter
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

//Initialisiere Messung Batterie (Analoger Eingang)
//int VBatterie = 12;  //Nur für Erweiterung eingeplant

//Variablen zu den Ausgänge der HBrücke(Motoren)
int goToSolarzelle1, goToSolarzelle2, goToSolarzelle3, goToSolarzelle4 = 0;

//Initialisiere Motoren (Digitale Ausgaenge)
int motorB1 = 7;
int motorB2 = 9;
int motorBH = 6;
int motorL1 = 8;
int motorL2 = 11;
int motorLH = 10;

//Definiere Eingänge zur Shuntmessung über die Widerstaende 1 und 2
int shunt1 = 4;
int shunt2 = 5;

//Definiere Bearbeitungsvariablen zur Auswertung der Shunts
int VarShunt1;
int VarShunt2;

//Globale Variabel zur Blockade der Motoren immfalle einer Shunt auslösung
int NotGoToSolarzelle1, NotGoToSolarzelle2, NotGoToSolarzelle3, NotGoToSolarzelle4 = 0;

//initialisiere ON schalter
int schalterON = 2;

//bearbeitungsVariabel Schalter ON
int VarSchalterON = 0;

//Initialisiere Schalter Pin
int HBrueckePinLed = 3;

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
  
  //Definiere LED Leuchte
  pinMode(HBrueckePinLed, OUTPUT);
  
  //Definiere Schalter Input
  pinMode(schalterON, INPUT);
}

//Lese Analogwerte in Arrays und berechne Durchschnitt
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
  
//for (int i = 0; i<10; i++) {
//  if (solarSpannung0 +i == solarSpannung1) {
//  (solarSpannung0 == solarSpannung1);
//  } if (solarSpannung1 +i == solarSpannung3) {
//  (solarSpannung2 == solarSpannung3);
//  }
//  }
}

void shuntEinlesen() {
  VarShunt1 = 0;
  VarShunt2 = 0;
  delay(200);      //warte um den Anlaufstrom nicht zu messen
  VarShunt1 = analogRead(shunt1);
  VarShunt2 = analogRead(shunt2);
  Serial.println(VarShunt1);
  Serial.println(VarShunt2);
}

void shuntVarCheck() {
  shuntEinlesen();
  if ((VarShunt1 >= 110) && (goToSolarzelle1 == 1)) {
    NotGoToSolarzelle1 = 1;
    Serial.println("wert NotGoToSolarzelle1 wurde geschrieben");
  } if ((VarShunt1 >= 110) && (goToSolarzelle2 == 1)) {
    NotGoToSolarzelle2 = 1;
    Serial.println("wert NotGoToSolarzelle2 wurde geschrieben");
  } if ((VarShunt2 >= 130) && (goToSolarzelle3 == 1)) {
    NotGoToSolarzelle3 = 1;
    Serial.println("wert NotGoToSolarzelle3 wurde geschrieben");
  } if ((VarShunt2 >= 130) && (goToSolarzelle4 == 1)) {
    NotGoToSolarzelle4 = 1;
    Serial.println("wert NotGoToSolarzelle4 wurde geschrieben");
  }
}

void shuntUnBlock() {
  shuntVarCheck();
  if ((NotGoToSolarzelle1 == 1) && (goToSolarzelle1 < goToSolarzelle2)) {
    NotGoToSolarzelle1 = 0;
  } if ((NotGoToSolarzelle2 == 1) && (goToSolarzelle2 < goToSolarzelle1)) {
    NotGoToSolarzelle2 = 0;
  } if ((NotGoToSolarzelle3 == 1) && (goToSolarzelle3 < goToSolarzelle4)) {
    NotGoToSolarzelle3 = 0;
  } if ((NotGoToSolarzelle4 == 1) && (goToSolarzelle4 < goToSolarzelle3)) {
    NotGoToSolarzelle4 = 0;
  }
}

//void endschalterAuslesen() {
//  endschalter0 = digitalRead(endschalterImp2);
//  endschalter1 = digitalRead(endschalterImp3);
//  endschalter2 = digitalRead(endschalterImp4);
//  endschalter3 = digitalRead(endschalterImp5);
//}
//
//void endschalterVergleichen() {
//  endschalterAuslesen();
//  if (endschalter0| endschalter3 == HIGH) { 
//     goToSolarzelle1 = 0;
//     Serial.println("Endschalter Blockiert goToSolarzelle1");
//  }
//  if (endschalter1| endschalter2 == HIGH) { 
//     goToSolarzelle2 = 0;
//     Serial.println("Endschalter Blockiert goToSolarzelle2");
//  }   
//  if (endschalter0| endschalter1 == HIGH) { 
//     goToSolarzelle3 = 0;
//     Serial.println("Endschalter Blockiert goToSolarzelle3");
//  }
//  if (endschalter2| endschalter3 == HIGH) { 
//     goToSolarzelle4 = 0;
//     Serial.println("Endschalter Blockiert goToSolarzelle4");
//  } 
//  endschalterAuslesen();
//}

void Hbruecke1AusEin() {
  if ((goToSolarzelle1 == goToSolarzelle2) || (NotGoToSolarzelle1 || NotGoToSolarzelle2 == 1)){
    digitalWrite(motorBH, 0);
    Serial.println("HBruecke1 wurde ausgeschaltet");
    digitalWrite(HBrueckePinLed, HIGH);
  } else {
    digitalWrite(motorBH, 1);
    Serial.println("HBruecke1 wurde eingeschaltet");
    digitalWrite(HBrueckePinLed, LOW);
  }
}

void Hbruecke2AusEin() {
  if ((goToSolarzelle3 == goToSolarzelle4) || (NotGoToSolarzelle3 || NotGoToSolarzelle4 == 1)) {
    digitalWrite(motorLH, 0);
    Serial.println("HBruecke2 wurde ausgeschaltet");
    digitalWrite(HBrueckePinLed, HIGH);
  } else {
    digitalWrite(motorLH, 1);
    Serial.println("HBruecke2 wurde eingeschaltet");
    digitalWrite(HBrueckePinLed, LOW);
  }
}

//Vergleiche die AnalogWerte der Solarzellen 1 und 2
void vergleichAnalogWert1() {
  int zaeler = 0;
  int var1 = 0;
  while (solarSpannung0 != solarSpannung1) {
    if (solarSpannung0 > solarSpannung1) {
        //falls die Werte nicht gleich sind prüfe an welcher Seite mehr Spannung anliegt
        Serial.println("An der Solarzelle 1 ist eine groessere Spannung");
        goToSolarzelle1 = 1;
        goToSolarzelle2 = 0;
        if (var1 == 1) {
          zaeler += 1;
          var1 = 0;
        }
    } else {
        Serial.println("An der Solarzelle 2 ist eine groessere Spannung");  
        goToSolarzelle1 = 0;
        goToSolarzelle2 = 1;
        if (var1 == 0) {
        zaeler += 1;
        var1 = 1;
        }
    }
//    endschalterVergleichen();
//    delay(200);
    digitalWrite(motorB1, goToSolarzelle1);
    digitalWrite(motorB2, goToSolarzelle2);
    shuntUnBlock();
    Hbruecke1AusEin();
    shuntVarCheck();
    readVal(); 
    if(zaeler == 3) {
    solarSpannung0 = solarSpannung1;
    } if(NotGoToSolarzelle1 || NotGoToSolarzelle2 == 1) {
    solarSpannung0 = solarSpannung1;
    }
  }
  digitalWrite(motorBH, 0);
  Serial.println("An der Solarzelle 1 und 2 ist die gleiche Spannung");
}

//Vergleiche die AnalogWerte der Solarzellen 3 und 3
void vergleichAnalogWert2() {
  int zaeler = 0;
  int var1 = 0;
  //hier wird die Funktion des vergleichAnalogWert1 hineinkopiert und angepasst
  while (solarSpannung2 != solarSpannung3) {
    if (solarSpannung2 > solarSpannung3) {
        //falls die Werte nicht gleich sind prüfe an welcher Seite mehr Spannung anliegt
        Serial.println("An der Solarzelle 3 ist eine groessere Spannung");
        goToSolarzelle3 = 1;
        goToSolarzelle4 = 0;
        if (var1 == 1) {
          zaeler += 1;
          var1 = 0;
        }
    } else {
        Serial.println("An der Solarzelle 4 ist eine groessere Spannung");  
        goToSolarzelle3 = 0;
        goToSolarzelle4 = 1;
        if (var1 == 0) {
        zaeler += 1;
        var1 = 1;
        }
    }
//    endschalterVergleichen();
//    delay(200);
    digitalWrite(motorL1, goToSolarzelle3);
    digitalWrite(motorL2, goToSolarzelle4);
    shuntUnBlock();
    Hbruecke2AusEin();
    shuntVarCheck();
    readVal();
    if(zaeler == 3) {
    solarSpannung2 = solarSpannung3;
    } if(NotGoToSolarzelle3 || NotGoToSolarzelle4 == 1) {
    solarSpannung2 = solarSpannung3;
    }
  }
  digitalWrite(motorLH, 0);
  Serial.println("An der Solarzelle 3 und 4 ist die gleiche Spannung");
}

//Schlafe 15 Sekunden
void schlafe() {
  Serial.println("Schlafe 10 Sekunden");
  delay(5000);
}

void schalterONOFF() {
  VarSchalterON = digitalRead(schalterON);
  while (VarSchalterON == HIGH) {
    VarSchalterON = digitalRead(schalterON);
  }
}

void loop() {
  schalterONOFF();
  readVal();                    //Ruft Funktion auf die Variablen in Arrays schreibt
//  endschalterAuslesen();        //Liesst die Werte der Endschalter aus
  vergleichAnalogWert1();       //Ruft Funktion auf, welche den ersten und den zweiten Durchschnitt vergleicht
  vergleichAnalogWert2();       //Ruft Funktion auf, welche den dritten und vierten Durchschnitt vergleicht    
  schlafe();                    //Funktion die 15 Sekunden schläft
}
