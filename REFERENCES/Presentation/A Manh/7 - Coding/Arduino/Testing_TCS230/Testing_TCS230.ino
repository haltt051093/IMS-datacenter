


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
#define MODULE_1_SERVOR_FILTER_GATE_1 48 //Module 1 la bo xac dinh mau
#define MODULE_1_SERVOR_FILTER_GATE_2 46
#define MODULE_1_SERVOR_TCS230_GATE 53 

#define MODULE_2_SERVOR_FILTER_GATE_1 51
#define MODULE_2_SERVOR_FILTER_GATE_2 49
#define MODULE_2_SERVOR_FILTER_GATE_3 47
#define MODULE_2_SERVOR_FILTER_GATE_4 45

/*INFRARED PORTS*/
#define MODULE_1_IP_FILTER_GATE 52
#define MODULE_1_IP_TCS230_GATE 50

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





//************************************SETUP FUNCTION************************************
byte OUT=2,S2=3,S3=4,LED=5,S0=6,S1=7;

Servo module1_servo_TCS230_gate, module1_servo_filter_gate1, module1_servo_filter_gate2;
Servo module2_servo_filter_gate1, module2_servo_filter_gate2, module2_servo_filter_gate3, module2_servo_filter_gate4;

void setup()
{
  Serial.begin(9600);
  setupTCS230();
}

void loop()
{

  digitalWrite(LED,HIGH);
    bool hasBall = false;
  //Kiem tra xem bi con khong
  while(!hasBall)
  {
    byte signal = digitalRead(46);
    Serial.println(signal);
    if(signal == 0) hasBall = true;  
  }
  uint8_t closet_color;
  getColorResult(closet_color);
  //Serial.println(getMemoryFree());
}





//************************************GLOBAL VARIABLES************************************
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
  module1_servo_TCS230_gate.attach(MODULE_1_SERVOR_TCS230_GATE);
  module1_servo_TCS230_gate.write(0);

  module1_servo_filter_gate1.attach(MODULE_1_SERVOR_FILTER_GATE_1);
  module1_servo_filter_gate1.write(20);
  delay(300);

  module1_servo_filter_gate2.attach(MODULE_1_SERVOR_FILTER_GATE_2);
  module1_servo_filter_gate2.write(60);
  delay(300);

  //Thiet lap cho cac servo cua module 2
  module2_servo_filter_gate1.attach(MODULE_2_SERVOR_FILTER_GATE_1);
  module2_servo_filter_gate1.write(178);
  delay(300);
  module2_servo_filter_gate2.attach(MODULE_2_SERVOR_FILTER_GATE_2);
  module2_servo_filter_gate2.write(180);
  delay(300);
  module2_servo_filter_gate3.attach(MODULE_2_SERVOR_FILTER_GATE_3);
  module2_servo_filter_gate3.write(180);
  delay(300);
  module2_servo_filter_gate4.attach(MODULE_2_SERVOR_FILTER_GATE_4);
  module2_servo_filter_gate4.write(180);
  delay(300);
}

//Thiet lap cac cam bien hong ngoai
void setupInfraredPorts()
{
  pinMode(MODULE_1_IP_TCS230_GATE,INPUT);
  pinMode(MODULE_1_IP_FILTER_GATE,INPUT);
}





//************************************MAIN FUNCTION************************************
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
  
//   Serial.print("Percentage Red= ");
//   Serial.println(percentage_red);
//   Serial.print("Percentage Green= ");
//   Serial.println(percentage_green);
//   Serial.print("Percentage Blue= ");
//   Serial.println(percentage_blue);  
//   Serial.print("FC= ");
//   Serial.println(frequency_clear);
   
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
    /*
    Serial.print("Current result: ");
     Serial.println(current_result);
     Serial.print("Count: ");
     Serial.println(count);
     */
  }

  closet_color = current_result; 
  if(closet_color==1) Serial.println("This color is RED"); // red
  if(closet_color==2) Serial.println("This color is ORANGE"); // orange
  if(closet_color==3) Serial.println("This color is YELLOW"); // yellow
  if(closet_color==4) Serial.println("This color is GREEN - Light"); // green
  if(closet_color==5) Serial.println("This color is GREEN - Dark"); // blue
  if(closet_color==6) Serial.println("This color is BLUE - Light"); //purple
  if(closet_color==7) Serial.println("This color is BLUE- Dark"); //purple
  if(closet_color==8) Serial.println("This color is PURPLE - Light"); //pink
  if(closet_color==9) Serial.println("This color is PURPLE - Dark"); //pink
  if(closet_color==10) Serial.println("This color is PINK - Light"); //blue
  if(closet_color==11) Serial.println("This color is PINK - Dark"); // green
  if(closet_color==100) Serial.println("NO COLOR"); // switch RGB LED off
  Serial.println("---");
} 

void controlModule2ServoFilterGate(uint8_t closet_color)
{
  switch(closet_color){
  case 1:
    {
      //Serial.println("This color is RED");
      module2_servo_filter_gate1.write(100);
      module2_servo_filter_gate2.write(180);
      module2_servo_filter_gate3.write(180);
      module2_servo_filter_gate4.write(180);
      break;
    }
  case 2:
    {
      //Serial.println("This color is ORANGE");
      break;
    }
  case 3:
    {
      //Serial.println("This color is YELLOW");
      break;
    }
  case 4:
  case 5:
    {
      //Serial.println("This color is GREEN");
      module2_servo_filter_gate1.write(178);
      module2_servo_filter_gate2.write(100);
      module2_servo_filter_gate3.write(180);
      module2_servo_filter_gate4.write(180);
      break;
    }
  case 6:
  case 7:
    {
      //Serial.println("This color is BLUE");
      module2_servo_filter_gate1.write(178);
      module2_servo_filter_gate2.write(180);
      module2_servo_filter_gate3.write(100);
      module2_servo_filter_gate4.write(180);
      break;
    }
  case 8:
  case 9:
    {
      //Serial.println("This color is PURPLE");
      module2_servo_filter_gate1.write(178);
      module2_servo_filter_gate2.write(180);
      module2_servo_filter_gate3.write(180);
      module2_servo_filter_gate4.write(100);
      break;
    }
  case 10:
  case 11:
    {
      //Serial.println("This color is PINK");
      module2_servo_filter_gate1.write(178);
      module2_servo_filter_gate2.write(180);
      module2_servo_filter_gate3.write(180);
      module2_servo_filter_gate4.write(180);
      break;
    }
  default:
    break;
  }
  //Serial.println("---");
}

//************************************HELPER FUNCTION************************************
//Xem dung luong Ram da dung
int getMemoryFree() {
  extern int __heap_start;
  extern int *__brkval;
  return (int) SP - (__brkval == 0 ? (int) &__heap_start : (int) __brkval);
}



