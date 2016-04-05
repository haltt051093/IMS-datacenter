#include <Servo.h>
Servo s1, s2;
int num1_dong = 145;
int num1_mo = 60;
int num2_mo = 105;
int num2_dong = 20;
void setup()
{
  s1.attach(8); 
  s2.attach(9); 
  s1.write(num1_dong);
  delay(500);
  s2.write(num2_mo);
  delay(500);
}

void loop()
{
//  s2.write(num2_dong);
//  delay(500);
//  s1.write(num1_mo);
//  delay(500);
//  s1.write(num1_dong);
//  delay(500);
//  s2.write(num2_mo);
//  delay(500);  
}
