#include "ColorAnalysisTable.h"
#include <iostream>

//Hien thuc cac phuong thuc xu ly chinh thuc
void ColorAnalysisTable::initialization() //Neu contructor khong hoat dong thi goi ham nay thay the
{
     for(int i = 0; i < ANALYSIS_TABLE_SIZE; i++)
     {
          this->listItem[i].setColorName((uint8_t)i);
          this->listItem[i].setCount(0);
          this->listItem[i].setSum(0.0);
          this->listItem[i].setMean(0.0);    
     }
     
     this->maxCountValue = 0;        
}
//---Ham nay se thong ke ra So Lan xuat hien, Tong gia tri khoang cach va gia tri trung binh cua moi Mau Sac---
void ColorAnalysisTable::calAnalysisTable(KSelection k_selection[],int size) 
{                
     for(int i = 0; i < ANALYSIS_TABLE_SIZE; i++)
     {
          uint8_t colorName = i;//Lay gia tri goc de so sanh - ten Mau Sac duoc dinh nghia trong file Globals.h
          int count = 0;//Set mac dinh so lan xuat hien trong tap K la 0
          float sum = 0.0;
          float mean = 0.0;
          
          //Vong lap se so sanh gia tri goc voi cac gia tri cua phan tu tiep theo
          for(int j = 0; j < size; j++)
          {
               if(k_selection[j].getColorName() == colorName)//Neu ton tai mot diem co Mau Sac tuong tu
               {
                    count++; //Tang bien dem 1 don vi
                    sum += k_selection[j].getDistanceValue(); //Tinh tong khoang cach                                                 
               }             
          } 
          if(count > 0)
          {  
             mean = sum/count; //Tinh gia tri trung binh
          }
          
          //Cap nhat vao bang thong ke
          this->listItem[i].setCount(count);
          this->listItem[i].setSum(sum);
          this->listItem[i].setMean(mean);
          
          //Cap nhat so lan xuat hien nhieu nhat cua Mau Sac trong AnalysisTable
          if(this->maxCountValue <= count)
          {
               this->maxCountValue = count;                       
          }
          
          /*
              printf("Color %d: \n",this->listItem[i].getColorName());
              printf("Count %d: \n",this->listItem[i].getCount());
              printf("Sum %f: \n",this->listItem[i].getSum());  
              printf("Mean %f: \n",this->listItem[i].getMean());    
              printf("MaxCount %d: \n",this->maxCountValue);  
              printf("\n");           
          */             
     }
}

uint8_t ColorAnalysisTable::matchColor()
{
     //Trong nhung Mau Sac co cung so lan xuat hien nhieu nhat trong tap K, tim ra Mau Sac co Mean nho nhat
     float minMeanResult = 1000.0;
     uint8_t index = 0;
     for(int i = 0; i <= ANALYSIS_TABLE_SIZE; i++)
     {
          if(this->listItem[i].getCount() == this->maxCountValue)
          {
               if(minMeanResult >= this->listItem[i].getMean())
               {
                    minMeanResult = this->listItem[i].getMean();
                    index = (uint8_t)i;                 
               }
          }       
     }
     return index;
     
}


//Cac Phuong thuc bo sung, ho tro tinh toan
//--Tim ra So lan xuat hien nhieu nhat cua mot Mau Sac
int ColorAnalysisTable::findMaxCountInArray(ColorAnalysisItem listItem[],int size)
{
     int maxCount = listItem[0].getCount();
     for(int i = 0; i < size; i++)
     {
          if(maxCount <= listItem[i].getCount())
          {
               maxCount = listItem[0].getCount();
          }
     }
     return maxCount; 
}

//--Tim ra so luong Mau Sac co cung so lan xuat hien nhieu nhat trong bang
int ColorAnalysisTable::findNumOfMaxCount(ColorAnalysisItem listItem[],int size)
{
     int numOfColor = 0;;
     for(int i = 0; i < size; i++)
     {
          if(listItem[i].getCount() == this->maxCountValue)
          {
              numOfColor++;
          }
     }
     return numOfColor;   
}

//Hien thuc can contructor va decontructor
ColorAnalysisTable::ColorAnalysisTable()
{
     this->initialization();                                  
}

ColorAnalysisTable::~ColorAnalysisTable()
{
                                         
}
