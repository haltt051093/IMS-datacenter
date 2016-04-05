
//************************************DEFINE************************************
/*CONTROL MOTOR*/
#define SPEED_VALUE 255 

#define SPEED_CONTROLLER 13
#define DIR1 12
#define DIR2 11

/*BASE VALUE OF INFRARED PORTS WHEN NON-DETECTION*/
#define BASE_VALUE_IP 1 

#define MODULE_2_IP_CHECK_INPUT 16
#define MODULE_2_IP_CHECK_RIGHT_POSITION 17
#define MODULE_2_IP_CHECK_OUTPUT 18


 /*bASE DIRECTION OF CONVEYOR*/
#define BASE_DIRECTION 1 

//************************************MAIN PROGRAM************************************
int mode = 0; //mode receive from main program
int interval = 2000; //time to finish get product

void setup() {

  Serial.begin(9600);
  pinMode(DIR1, OUTPUT);
  pinMode(DIR2, OUTPUT);
  pinMode(SPEED_CONTROLLER, OUTPUT);
  
//  pinMode(MODULE_2_IP_CHECK_INPUT, INPUT);
  pinMode(MODULE_2_IP_CHECK_RIGHT_POSITION, INPUT);
//  pinMode(MODULE_2_IP_CHECK_OUTPUT, INPUT);

}

void loop() {
 
//  if (Serial.available() > 0) {
//    char cond = Serial.read(); 
//    
//    switch (cond) {
//      case '1': //request ouput
//        if (digitalRead(MODULE_2_IP_CHECK_OUTPUT) != BASE_VALUE_IP) 
//        { //if stack over
//          Serial.println("Lay goi hang ra!");
//        } 
//        else if (digitalRead(MODULE_2_IP_CHECK_INPUT) == BASE_VALUE_IP) 
//        { //if input empty
//          Serial.println("Cho goi hang vao!");
//        } 
//        else 
//        {
//          motorOn(BASE_DIRECTION, SPEED_VALUE); 
//          mode = 1; 
//        }
//        break; 
//        
//      case '2': //request done
//        if (digitalRead(MODULE_2_IP_CHECK_OUTPUT) != BASE_VALUE_IP) { //if stack over
//          Serial.println("Lay goi hang ra!");
//        } else {
//          delay(1500); 
//          motorOn(BASE_DIRECTION, SPEED_VALUE); 
//          mode = 2;
//        } 
//        break; 
//    } 
//  }
//  
//  if (mode == 1 && digitalRead(MODULE_2_IP_CHECK_RIGHT_POSITION) != BASE_VALUE_IP) { //placed on
//    Serial.println("Vao vi tri!");
//    motorOff();
//  }  
//  
//  if (digitalRead(MODULE_2_IP_CHECK_OUTPUT) != BASE_VALUE_IP) { //stack over
//    Serial.println("Lay goi hang ra!");
//    motorOff();
//  }
//  
//  pause();
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

//************************************IR FUNCTION************************************
//void pause(){ //pause and dont get any action when product package didnt get out place
//  boolean flag = true;
//  while (digitalRead(MODULE_2_IP_CHECK_RIGHT_POSITION) != BASE_VALUE_IP && mode == 2) { 
//    flag = false;
//  }
//  if (!flag) {
//    delay(200);
//    flag = true;
//    Serial.println("Goi hang ra khoi vi tri!");
//  }
//}


