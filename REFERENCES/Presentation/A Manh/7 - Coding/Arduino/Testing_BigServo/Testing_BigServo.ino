/*SERVO*/

#include <Servo.h>
int dong = 10;
int mo = 90;
Servo sv;

void setup()
{
  Serial.begin(9600);
  sv.attach(53);
  sv.write(dong);
}

void loop()
{
   int a = sv.read();
   Serial.print("Goc cua servo hien tai: ");
   Serial.println(a);
   sv.write(mo);
   delay(2000);
   sv.write(dong);
   delay(2000);
}
