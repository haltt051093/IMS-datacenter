#include "ColorAnalysisItem.h"

//Hien thuc cac phuong thuc get va set
void ColorAnalysisItem::setColorName(uint8_t value)
{
     this->colorName = value;                            
}

void ColorAnalysisItem::setCount(int value)
{
     this->count = value;                                 
}

void ColorAnalysisItem::setSum(float value)
{
     this->sum = value;                            
}

void ColorAnalysisItem::setMean (float value)
{
     this->mean = value;                          
}
       
uint8_t ColorAnalysisItem::getColorName()
{
    return this->colorName;   
}

int ColorAnalysisItem::getCount()
{
    return this->count;
}

float ColorAnalysisItem::getSum()
{
    return this->sum;     
}

float ColorAnalysisItem::getMean()
{
    return this->mean;    
}

//Hien thuc can contructor va decontructor
ColorAnalysisItem::ColorAnalysisItem()
{
     this->colorName = 0;
     this->count = 0;
     this->sum = 0.0;
     this->mean = 0.0;                                    
}

ColorAnalysisItem::~ColorAnalysisItem()
{
                                       
}
