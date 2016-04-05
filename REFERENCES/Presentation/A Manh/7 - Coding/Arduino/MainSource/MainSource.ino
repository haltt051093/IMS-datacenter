
//************************************DEFINE************************************
/*OUTPUT FREQUENCY SCALING OPYTION*/
#define POWER_DOWN 0
#define OUTPUT_FREQUENCY_SCALING_2_Percentage 1
#define OUTPUT_FREQUENCY_SCALING_20_Percentage 2
#define OUTPUT_FREQUENCY_SCALING_100_Percentage 3

/*COLOR FILTER OPTION*/
#define N0_FILTER 0
#define RED_FILTER 1
#define BLUE_FILTER 2
#define GREEN_FILTER 3

/*SERVO*/
#define MODULE_1_LSERVO_TCS230 53
#define MODULE_1_LSERVO_RED 51
#define MODULE_1_LSERVO_GREEN 49
#define MODULE_1_LSERVO_BLUE 47
#define MODULE_1_LSERVO_PURPLE 45
#define MODULE_1_LSERVO_PINK 43

#define MODULE_1_MSERVO_GATE_1 52
#define MODULE_1_MSERVO_GATE_2 50

/*INFRARED PORTS*/
#define MODULE_1_IP_GATE 48
#define MODULE_1_IP_TCS230 46

#define MODULE_1_IP_RED 40
#define MODULE_1_IP_GREEN 38
#define MODULE_1_IP_BLUE 36
#define MODULE_1_IP_PURPLE 34
#define MODULE_1_IP_PINK 32


/*OTHER*/
#define NUMBER_OF_TIMES_OF_ONE_RESULT 2//Mot ket qua phai ra giong nhau lien tiep dung So Lan NUMBER_OF_TIMES_OF_ONE_RESULT thi moi duoc ket luan





//************************************SYSTEM LIBRARIES************************************
#include <Servo.h>

//************************************MY LIBRARIES************************************
#include <ColorAnalysisItem.h>
#include <ColorAnalysisTable.h>
#include <ColorDetection.h>
#include <Globals.h>
#include <KSelection.h>


//************************************MAIN PROGRAM************************************
byte OUT=2,S2=3,S3=4,LED=5,S0=6,S1=7;
byte POWER_IP_GATE = 12;
//byte pinR=12, pinG=11, pinB=10;

Servo LServo_TCS230, MServo_Gate1, MServo_Gate2;
Servo LServo_Red, LServo_Green, LServo_Blue, LServo_Purple, LServo_Pink;

void setup()
{
  Serial.begin(9600);
  setupTCS230();
  setupServos();
  setupInfraredPorts();
  
  //Through old Marbles
  MServo_Gate2.write(18);
  delay(250);
  MServo_Gate1.write(60);
  delay(250);
  MServo_Gate1.write(138);
  delay(250);
  MServo_Gate2.write(85);
  delay(250);
  
  LServo_TCS230.write(110);
  delay(300);
  LServo_TCS230.write(30); 
  delay(200);
//  pinMode(pinR,OUTPUT);
//  pinMode(pinG,OUTPUT); 
//  pinMode(pinB,OUTPUT);  
}

void loop()
{

  digitalWrite(LED,HIGH);
  
  //Kiem tra xem bi con khong
  boolean hasBall = false;
  while(!hasBall)
  {
    byte signal = digitalRead(MODULE_1_IP_GATE);
    if(signal == 0) hasBall = true;  
  }
  

  MServo_Gate2.write(18);
  delay(250);
  MServo_Gate1.write(60);
  delay(250);
  MServo_Gate1.write(138);
  delay(250);
  MServo_Gate2.write(85);
  delay(250);

  //Kiem tra xem bi da vao cho vi tri cua TCS230 chua
  digitalWrite(POWER_IP_GATE,HIGH);
  delay(20);
  unsigned long Timer = millis();
  hasBall = false;
  while(!hasBall)
  {
    byte signal = digitalRead(MODULE_1_IP_TCS230);
    //Serial.println(signal);
    if(signal == 0) 
    {
      hasBall = true;  
      digitalWrite(POWER_IP_GATE,LOW);
    }
    
    if(millis() - Timer >= 5000UL)
    {
      controlModule2ServoFilterGate(100);
      LServo_TCS230.write(90);
      delay(300);
      LServo_TCS230.write(10); 
      delay(200);
      digitalWrite(POWER_IP_GATE,LOW);
      return;
    }
  }
  uint8_t closet_color;
  getColorResult(closet_color);
  controlModule2ServoFilterGate(closet_color);
  LServo_TCS230.write(110);
  delay(300);
  LServo_TCS230.write(30); 
  delay(200);
  //Serial.println(getMemoryFree());
}

//************************************SETUP FUNCTIONS************************************
void setupTCS230()
{
  pinMode(S0,OUTPUT); 
  pinMode(S1,OUTPUT); 
  pinMode(S2,OUTPUT); 
  pinMode(S3,OUTPUT); 
  pinMode(LED,OUTPUT); 
  pinMode(OUT,INPUT);   
}

//Thiet lap cac servo
void setupServos()
{
  //Thiet lap cho cac servo cua module 1 
  LServo_TCS230.attach(MODULE_1_LSERVO_TCS230);
  LServo_TCS230.write(30);

  MServo_Gate1.attach(MODULE_1_MSERVO_GATE_1);
  MServo_Gate1.write(138);
  delay(300);

  MServo_Gate2.attach(MODULE_1_MSERVO_GATE_2);
  MServo_Gate2.write(85);
  delay(300);

  //Thiet lap cho cac servo cua module 2
  LServo_Red.attach(MODULE_1_LSERVO_RED);
  LServo_Red.write(38);
  delay(300);
  LServo_Green.attach(MODULE_1_LSERVO_GREEN);
  LServo_Green.write(23);
  delay(300);
  LServo_Blue.attach(MODULE_1_LSERVO_BLUE);
  LServo_Blue.write(37);
  delay(300);
  LServo_Purple.attach(MODULE_1_LSERVO_PURPLE);
  LServo_Purple.write(39);
  delay(300);
  LServo_Pink.attach(MODULE_1_LSERVO_PINK);
  LServo_Pink.write(3);
  delay(300);
}

//Thiet lap cac cam bien hong ngoai
void setupInfraredPorts()
{
  pinMode(MODULE_1_IP_TCS230,INPUT);
  pinMode(MODULE_1_IP_GATE,INPUT);
  pinMode(POWER_IP_GATE,OUTPUT);
}



//************************************TCS230 FUNCTION************************************
//Ham lua chon ty le xung output
void TCS230_On_Off(int outputOption)
{
  switch(outputOption){
  case OUTPUT_FREQUENCY_SCALING_2_Percentage:
    { //Output frequency scaling (2%)
      digitalWrite(S0,LOW); 
      digitalWrite(S1,HIGH);
      break;
    }
  case OUTPUT_FREQUENCY_SCALING_20_Percentage:
    { //Output frequency scaling (20%)
      digitalWrite(S0,HIGH); 
      digitalWrite(S1,LOW);
      break;
    }
  case OUTPUT_FREQUENCY_SCALING_100_Percentage:
    { //Output frequency scaling (100%)
      digitalWrite(S0,HIGH); 
      digitalWrite(S1,HIGH);
      break;
    }
  default:
    { //Power down
      digitalWrite(S0,LOW); 
      digitalWrite(S1,LOW);
      break;  
    };    
  }
  delay(5);
}

//Ham lua chon bo filter cho sensor
void TCS230_Filter_Controller(int filterOption)
{
  switch(filterOption){
  case RED_FILTER:
    {
      digitalWrite(S2,LOW);
      digitalWrite(S3,LOW);
      break; 
    }
  case BLUE_FILTER:
    {
      digitalWrite(S2,LOW);
      digitalWrite(S3,HIGH);
      break; 
    }
  case GREEN_FILTER:
    {
      digitalWrite(S2,HIGH);
      digitalWrite(S3,HIGH);
      break; 
    }
  default:
    {//No Filter
      digitalWrite(S2,HIGH);
      digitalWrite(S3,LOW);
      break; 
    }
  }
  delay(5);
}

//Ham lay Phan Tram R,G,B va Frequency Clear
void getFrequencyValue(uint8_t& percentage_red, uint8_t& percentage_green, uint8_t& percentage_blue, float& frequency_clear)
{
  float frequency_red, frequency_green, frequency_blue;

  //Lay tan so tu cac bo loc rieng biet
  TCS230_On_Off(OUTPUT_FREQUENCY_SCALING_100_Percentage);

  TCS230_Filter_Controller(N0_FILTER);
  frequency_clear=500.0/pulseIn(OUT,LOW,10000); // Frequency in kHz

  TCS230_Filter_Controller(RED_FILTER);
  frequency_red=500.0/pulseIn(OUT,LOW,10000); // Frequency in kHz

  TCS230_Filter_Controller(GREEN_FILTER);
  frequency_green=500.0/pulseIn(OUT,LOW,10000); // Frequency in kHz

  TCS230_Filter_Controller(BLUE_FILTER);
  frequency_blue=500.0/pulseIn(OUT,LOW,10000); // Frequency in kHz

  TCS230_On_Off(POWER_DOWN);

  //Tinh toan Phan Tram cua cac tan so R,G,B so voi tan so Clear (Lay tu datasheet)
  percentage_red=(uint8_t)((frequency_red/frequency_clear)*100.0);
  percentage_green=(uint8_t)((frequency_green/frequency_clear)*100.0);
  percentage_blue=(uint8_t)((frequency_blue/frequency_clear)*100.0);
  /*
   Serial.print("Percentage Red= ");
   Serial.println(percentage_red);
   Serial.print("Percentage Green= ");
   Serial.println(percentage_green);
   Serial.print("Percentage Blue= ");
   Serial.println(percentage_blue);  
   Serial.print("FC= ");
   Serial.println(frequency_clear);
   */
}

//Ham nhan dang Mau sac
void getColorResult(uint8_t& closet_color) 
{ 
  float frequency_clear;
  uint8_t percentage_red, percentage_green, percentage_blue;

  //Vong lap se kiem tra ket qua do nhieu lan. 
  //Mot ket qua phai ra giong nhau lien tiep voi So Lan = NUMBER_OF_TIMES_OF_ONE_RESULT, thi moi duoc ket luan 
  uint8_t count = 0;
  uint8_t current_result = 0;
  while(count != NUMBER_OF_TIMES_OF_ONE_RESULT)
  {
    //Lay Phan Tram R,G,B va Frequency Clear
    getFrequencyValue(percentage_red, percentage_green, percentage_blue, frequency_clear); 

    ColorDetection cd((uint8_t)percentage_red,(uint8_t) percentage_green,(uint8_t) percentage_blue, frequency_clear);
    uint8_t new_result = cd.findClosetColor();
    if(new_result == current_result)
    {
      count++; 
    }
    else
    {
      count = 0; 
    }
    current_result = new_result;
    
//    Serial.print("Current result: ");
//    Serial.println(current_result);
//    Serial.print("Count: ");
//    Serial.println(count);
     
  }

  closet_color = current_result; 
  if(closet_color==4) closet_color = 5; // green
  if(closet_color==6) closet_color = 7; //blue
  if(closet_color==8) closet_color = 9; //purple
  if(closet_color==11) closet_color = 10; // pink
  boolean hasSpace = CheckRepositoryHasSpace(closet_color); 
  if(!hasSpace)
  {
    if(closet_color==1)  closet_color = 101;
    if(closet_color==5)  closet_color = 105;
    if(closet_color==7)  closet_color = 107;
    if(closet_color==9)  closet_color = 109;
    if(closet_color==10)  closet_color = 110;
  }
  Serial.println(closet_color);
//  if(closet_color==1) Serial.println("This color is RED"); // red
//  if(closet_color==2) Serial.println("This color is ORANGE"); // orange
//  if(closet_color==3) Serial.println("This color is YELLOW"); // yellow
//  if(closet_color==4) Serial.println("This color is GREEN - Light"); // green
//  if(closet_color==5) Serial.println("This color is GREEN - Dark"); // blue
//  if(closet_color==6) Serial.println("This color is BLUE - Light"); //purple
//  if(closet_color==7) Serial.println("This color is BLUE- Dark"); //purple
//  if(closet_color==8) Serial.println("This color is PURPLE - Light"); //pink
//  if(closet_color==9) Serial.println("This color is PURPLE - Dark"); //pink
//  if(closet_color==10) Serial.println("This color is PINK - Light"); //blue
//  if(closet_color==11) Serial.println("This color is PINK - Dark"); // green
//  if(closet_color==100) Serial.println("NO COLOR"); // switch RGB LED off
} 


//************************************SERVOR FUNCTION************************************
void controlModule2ServoFilterGate(uint8_t closet_color)
{
  switch(closet_color){
  case 1:
    {
      //Serial.println("This color is RED");
      LServo_Red.write(118);
      LServo_Green.write(23);
      LServo_Blue.write(37);
      LServo_Purple.write(39);
      LServo_Pink.write(3);
      break;
    }
//  case 2:
//    {
//      //Serial.println("This color is ORANGE");
//      break;
//    }
//  case 3:
//    {
//      //Serial.println("This color is YELLOW");
//      break;
//    }
  case 4:
  case 5:
    {
      //Serial.println("This color is GREEN");
      LServo_Red.write(38);
      LServo_Green.write(103);
      LServo_Blue.write(37);
      LServo_Purple.write(39);
      LServo_Pink.write(3);
      break;
    }
  case 6:
  case 7:
    {
      //Serial.println("This color is BLUE");
      LServo_Red.write(38);
      LServo_Green.write(23);
      LServo_Blue.write(117);
      LServo_Purple.write(39);
      LServo_Pink.write(3);
      break;
    }
  case 8:
  case 9:
    {
      //Serial.println("This color is PURPLE");
      LServo_Red.write(38);
      LServo_Green.write(23);
      LServo_Blue.write(37);
      LServo_Purple.write(129);
      LServo_Pink.write(3);
      break;
    }
  case 10:
  case 11:
    {
      //Serial.println("This color is PINK");
      LServo_Red.write(38);
      LServo_Green.write(23);
      LServo_Blue.write(37);
      LServo_Purple.write(39);
      LServo_Pink.write(83);
      break;
    }
  default:
     LServo_Red.write(38);
     LServo_Green.write(23);
     LServo_Blue.write(37);
     LServo_Purple.write(39);
     LServo_Pink.write(3);
    break;
  }
  //Serial.println("---");
}

//************************************IR FUNCTION************************************
boolean CheckRepositoryHasSpace(uint8_t closet_color)
{
    
  int count = 0;
  boolean hasSpace = true;
  byte signal = -1;
  
  switch(closet_color)
  {
      case 1:
    {
      signal = digitalRead(MODULE_1_IP_RED);
      break;
    }
//  case 2:
//    {
//      //Serial.println("This color is ORANGE");
//      break;
//    }
//  case 3:
//    {
//      //Serial.println("This color is YELLOW");
//      break;
//    }
  case 4:
  case 5:
    {
      signal = digitalRead(MODULE_1_IP_GREEN);
      break;
    }
  case 6:
  case 7:
    {
      signal = digitalRead(MODULE_1_IP_BLUE);
      break;
    }
  case 8:
  case 9:
    {
      signal = digitalRead(MODULE_1_IP_PURPLE);
      break;
    }
  case 10:
  case 11:
    {
      signal = digitalRead(MODULE_1_IP_PINK);
      break;
    }
  default:
    break;
  }

  
  while(true)
  {
    //0 - has object, 1 - don't have object
    if(signal == 1)
    {
      count++;
    }
    else
    {
      count--;
    }
    if(count == 3000) //Still have space
    {
       hasSpace = true;  
       break;
    }
    if(count == -4000)//Don't have enough space
    {
      hasSpace = false; 
      break;
    }
  }
//  Serial.println(count);
  return hasSpace; 
}

//************************************HELPER FUNCTION************************************
//Xem dung luong Ram da dung
int getMemoryFree() {
  extern int __heap_start;
  extern int *__brkval;
  return (int) SP - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);
}




