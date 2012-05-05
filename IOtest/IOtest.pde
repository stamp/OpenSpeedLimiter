#include <Servo.h>

/*
  Testing SparkFun's 4-digit 7-Segment Display (Blue)
 */

Servo speed;
int segmentA = 11;
int segmentB = 6;
int segmentC = 10;
int segmentD = 8;
int segmentE = 7;
int segmentF = 9;
int segmentG = 12;

/*int digit1 = A5;
int digit2 = A4;
int digit3 = A3
int digit4 = A2;*/

/*
10 digits:
 Each defines which segments should be on/off for that digit: A,B,C,D,E,F,G,P
 */
byte numbers[10] =
{
  B11000000, // 0
  B11111001, // 1
  B10100100, // 2
  B10110000, // 3
  B10011001, // 4
  B10010010, // 5
  B10000010, // 6
  B11111000, // 7
  B10000000, // 8
  B10010000  // 9
};

void setup()
{

  
  pinMode(segmentA,OUTPUT);
  pinMode(segmentB,OUTPUT);
  pinMode(segmentC,OUTPUT);
  pinMode(segmentD,OUTPUT);
  pinMode(segmentE,OUTPUT);
  pinMode(segmentF,OUTPUT);
  pinMode(segmentG,OUTPUT);

  pinMode(A5,OUTPUT);
  pinMode(A4,OUTPUT);
  pinMode(A3,OUTPUT);
  pinMode(A2,OUTPUT);
  
  speed.attach(3);
 
  pinMode(13,OUTPUT);
  
}

void loop()
{
  
  for (int digitPosition=0; digitPosition < 4; digitPosition++)
  {
    digitalWrite(A2 + digitPosition,HIGH);
    digitalWrite(13,digitPosition%2);
    
    speed.write(digitPosition*45);
    
    for (int numIndex=0; numIndex <= 9; numIndex++)
    {
      int number =  numbers[numIndex];
      digitalWrite(segmentA, bitRead(number, 0) );
      digitalWrite(segmentB, bitRead(number, 1) );
      digitalWrite(segmentC, bitRead(number, 2) );
      digitalWrite(segmentD, bitRead(number, 3) );
      digitalWrite(segmentE, bitRead(number, 4) );
      digitalWrite(segmentF, bitRead(number, 5) );
      digitalWrite(segmentG, bitRead(number, 6) );
      
      delay(100);
    }

    digitalWrite(A2 + digitPosition,LOW);
  }
}
