//************************************DEFINE************************************
/*SERVO*/
#define MODULE_2_SERVOR_RED_GATE_1 52 
#define MODULE_2_SERVOR_GREEN_GATE_3 50 
#define MODULE_2_SERVOR_BLUE_GATE_5 48 
#define MODULE_2_SERVOR_PURPLE_GATE_7 46 
#define MODULE_2_SERVOR_PINK_GATE_9 44

#define MODULE_2_SERVOR_RED_GATE_2 53 
#define MODULE_2_SERVOR_GREEN_GATE_4 51 
#define MODULE_2_SERVOR_BLUE_GATE_6 49 
#define MODULE_2_SERVOR_PURPLE_GATE_8 47 
#define MODULE_2_SERVOR_PINK_GATE_10 45 

/*INFRARED PORTS*/
#define MODULE_2_IP_CHECK_RIGHT_POSITION 10

/*CONTROL MOTOR*/
#define SPEED_CONTROLLER 13
#define DIR1 12
#define DIR2 11

#define SPEED_VALUE 255
#define BASE_DIRECTION 1 

//************************************SYSTEM LIBRARIES************************************
#include <Servo.h>

//************************************GLOBAL VARIABLES************************************
Servo 
MServo_Red_Gate1, 
MServo_Red_Gate2, 
MServo_Green_Gate3, 
MServo_Green_Gate4,
MServo_Blue_Gate5, 
MServo_Blue_Gate6, 
MServo_Purple_Gate7, 
MServo_Purple_Gate8,
MServo_Pink_Gate9, 
MServo_Pink_Gate10;

void setup()
{
  
  Serial.begin(9600);
  setupServos();
  
  motorOn(BASE_DIRECTION, SPEED_VALUE);
  delay(3000);
  motorOff();
  
}

void loop()
{
  
  if(Serial.available())
  {
      int result = Serial.parseInt();
      
      //1001 - App hoi Arduino san sang nhan bi chua
      if(result == 1001 || result == 1003)  //Software sends message: Check Arduino Connection and input packages or not
      {
        //Arduino se quay bang truyen de xem co hop hang den dung vi tri chua
        motorOn(BASE_DIRECTION, SPEED_VALUE);  
        
        unsigned long Timer = millis();
        boolean hasPackage = false;
        while(!hasPackage)
        {
          byte signal = digitalRead(MODULE_2_IP_CHECK_RIGHT_POSITION);
          if(signal == 0) 
          {
            //neu den dung thi tat motor, thoat vong lap
            hasPackage = true; 
            motorOff();
			if(result == 1001)
			{
              Serial.println("2001"); //If this is first time, send this message to Software to get Marbles for first packages
			}
			else if(result == 1003)
			{
			  Serial.println("2003"); //If this is not first time, send this message to Software to get Marbles for other packages
			}
          } 
          
          //Thiet lap thoi gian tiemout neu khong co hop hang
          if(millis() - Timer >= 3000UL)
          {
            motorOff();
			if(result == 1001)
			{
              Serial.println("2101"); //If this is first time, send this message to Software to notice that "No input box or package"
			}
			else if(result == 1003)
			{
			  Serial.println("2103"); //If this is not  time, send this message to Software to notice that "No input other box or package"
			}
            return;
          }
        }
      }      
          
      //Lay Marbles, cac ma so lay bi lan luot la 1-do, 5-xanh la, 7-xanh duong, 9-tim, 10-hong, khac voi 1001, 1004, nen se chay code duoi day
      if(result != 1001 && result != 1002 && result!= 1003)
      {      
        int closet_color = result;
        getMarbles(closet_color);
      }
      
      //1002 - Ket thuc qua trinh lay
      if(result == 1002)
      {
          motorOn(BASE_DIRECTION, SPEED_VALUE);
          delay(3000);     
          motorOff();
		  Serial.println("2002");
      }
  }  
}

//************************************SETUP FUNCTION************************************

void setupServos()
{
  MServo_Red_Gate1.attach(MODULE_2_SERVOR_RED_GATE_1);
  MServo_Red_Gate1.write(148);
  delay(200);
  
  MServo_Red_Gate2.attach(MODULE_2_SERVOR_RED_GATE_2);
  MServo_Red_Gate2.write(115);
  delay(200);
  
  MServo_Green_Gate3.attach(MODULE_2_SERVOR_GREEN_GATE_3);
  MServo_Green_Gate3.write(160);
  delay(200);
  
   MServo_Green_Gate4.attach(MODULE_2_SERVOR_GREEN_GATE_4);
  MServo_Green_Gate4.write(100);
  delay(200);
  
  MServo_Blue_Gate5.attach(MODULE_2_SERVOR_BLUE_GATE_5);
  MServo_Blue_Gate5.write(145);
  delay(200);
  
  MServo_Blue_Gate6.attach(MODULE_2_SERVOR_BLUE_GATE_6);
  MServo_Blue_Gate6.write(120);
  delay(200);
  
  MServo_Purple_Gate7.attach(MODULE_2_SERVOR_PURPLE_GATE_7);
  MServo_Purple_Gate7.write(155);
  delay(200);
  
  MServo_Purple_Gate8.attach(MODULE_2_SERVOR_PURPLE_GATE_8);
  MServo_Purple_Gate8.write(105);
  delay(200);
  
  MServo_Pink_Gate9.attach(MODULE_2_SERVOR_PINK_GATE_9);
  MServo_Pink_Gate9.write(140);
  delay(200);
  
  MServo_Pink_Gate10.attach(MODULE_2_SERVOR_PINK_GATE_10);
  MServo_Pink_Gate10.write(100);
  delay(200);

}

//************************************SERVO FUNCTION************************************
void getMarbles(int gate)
{
  switch(gate)
  {
    case 1:selectFilterGate(MServo_Red_Gate1, 148, 58, MServo_Red_Gate2, 35, 115);break;
    case 5:selectFilterGate(MServo_Green_Gate3, 160, 75, MServo_Green_Gate4, 15, 100);break;
    case 7:selectFilterGate(MServo_Blue_Gate5, 145, 70, MServo_Blue_Gate6, 35, 120);break;
    case 9:selectFilterGate(MServo_Purple_Gate7, 155, 75, MServo_Purple_Gate8, 20, 105);break;
    case 10:selectFilterGate(MServo_Pink_Gate9, 140, 65, MServo_Pink_Gate10, 20, 100);break;
    default: break; 
  }
  
}

void selectFilterGate(Servo servo1, uint8_t servo1_close, uint8_t servo1_open, Servo servo2, uint8_t servo2_close, uint8_t servo2_open)
{
  servo2.write(servo2_close);
  delay(200);
  servo1.write(servo1_open);
  delay(200);
  servo1.write(servo1_close);
  delay(200);
  servo2.write(servo2_open);
  delay(200);
}

//************************************MOTOR FUNCTION************************************
void motorOn(byte directionValue, int speedValue){ //drive motor
  if (directionValue == BASE_DIRECTION) {
    digitalWrite(DIR1, HIGH);
    digitalWrite(DIR2, LOW);
  } else {
    digitalWrite(DIR1, LOW);
    digitalWrite(DIR2, HIGH);
  }
  analogWrite(SPEED_CONTROLLER, speedValue);
}

void motorOff(){ //stop motor and reset all variable
  digitalWrite(DIR1, LOW);
  digitalWrite(DIR2, LOW);
  analogWrite(SPEED_CONTROLLER, 0);
}
