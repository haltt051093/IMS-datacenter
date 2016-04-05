#include "ColorDetection.h"
#include <iostream>


//Hien thuc cac phuong thuc xu ly chinh thuc
uint8_t ColorDetection::findClosetColor()
{
     if(this->frequencyClear < 1.5)
     {
          return OUT_OF_RANGE;                       
     }
     else
     {
          KSelection k_selection[K_SIZE];
          
          //Gan gia tri mac dinh cho tap lua chon K
          for(int i = 0; i < K_SIZE; i++)
          {
               k_selection[i].setColorName((uint8_t)WHITE);//Set mac dinh la 0 - mau trang
               k_selection[i].setDistanceValue(1000.0);//Set mac dinh la 0 - chua tinh toan
               //printf("%d - %f \n",k_selection[i].getColorName(),k_selection[i].getDistanceValue());
          }

          //Lay Mau cho tap k_selection theo kich co K_SIZE
          for(int i = 0; i < SAMPLE_SIZE; i++)
          {
              //Lay index cua phan tu chua gia tri khoang cac lon nhat trong tap k_selection
              int index = getIndexMaxValue_k_selection(k_selection, K_SIZE);

              //Tinh khoang cach den Mau
              float distance = sqrt(pow((sample[i][0] - this->getPercentageRed()),2.0) 
                                  + pow((sample[i][1] - this->getPercentageGreen()),2.0) 
                                  + pow((sample[i][2] - this->percentageBlue),2.0));
              
              //Cap nhat lai gia tri tap k_selection     
              //Kiem tra xem gia tri distance moi tinh toan co be hon GTLN cua tap k_selection hay khong       
              if(distance < k_selection[index].getDistanceValue())
              {                   
                   //Neu co be hon thi cap nhat lai
                   k_selection[index].setColorName((uint8_t)sample[i][3]);
                   k_selection[index].setDistanceValue(distance);
              }
          }
          
          //Tao bang thong ke
          ColorAnalysisTable table;
          table.calAnalysisTable(k_selection, K_SIZE);
          return table.matchColor();
     }
}

//Cac Phuong thuc bo sung, ho tro tinh toan
//--Lay index cua phan tu chua gia tri khoang cac lon nhat trong tap k_selection
int ColorDetection::getIndexMaxValue_k_selection(KSelection a[],int size)//Tim ra phan tu 
{
     float maxValue = a[0].getDistanceValue();
     int index = -1;
     for(int i = 0; i < size; i++)
          {
               if(maxValue <= a[i].getDistanceValue()){
                    maxValue = a[i].getDistanceValue();
                    index = i;
               }
          }
     return index;   
}

//Hien thuc cac phuong thuc get va set
void ColorDetection::setFrequencyClear(float value)
{
  this->frequencyClear = value;                                  
}

void ColorDetection::setPercentageRed(uint8_t value)
{
  this->percentageRed = value;
}

void ColorDetection::setPercentageGreen(uint8_t value)
{
  this->percentageGreen = value;
}

void ColorDetection::setPercentageBlue(uint8_t value)
{
  this->percentageBlue = value;
}

float ColorDetection::getFrequencyClear()
{
  return this->frequencyClear;     
}

uint8_t ColorDetection::getPercentageRed()
{
  return this->percentageRed;
}

uint8_t ColorDetection::getPercentageGreen()
{
  return this->percentageGreen;
}

uint8_t ColorDetection::getPercentageBlue()
{
  return this->percentageBlue;
}

//Hien thuc can contructor va decontructor
ColorDetection::ColorDetection(uint8_t percentageRed, uint8_t percentageGreen, uint8_t percentageBlue, float frequencyClear)
{
      this->percentageRed = percentageRed;
      this->percentageGreen = percentageGreen;
      this->percentageBlue = percentageBlue;
      this->frequencyClear = frequencyClear;
}

ColorDetection::~ColorDetection()
{
                                 
}
