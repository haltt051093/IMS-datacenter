
int  count = 0;
void setup() {
  Serial.begin(9600);

}


void loop() {
  bool hasBall = false;
  //Kiem tra xem bi con khong
  while(!hasBall)
  {
    byte signal = digitalRead(46);
    Serial.println(signal);
    //if(signal == 0) hasBall = true;  
  }
//  byte signal = digitalRead(45);
// if(signal == 0)
//  {
//    count++;
//  }
//  else
//  {
//    count--;
//  }
  //Serial.print(signal);
 // Serial.print(" ");
  //Serial.println(count);
  
}
