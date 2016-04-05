#include "KSelection.h"



//Hien thuc cac phuong thuc get va set
void KSelection::setColorName(uint8_t value)
{
     this->colorName = value;
}

void KSelection::setDistanceValue(float value)
{
     this->distanceValue = value;   
}

uint8_t KSelection::getColorName()
{
     return this->colorName;   
}

float KSelection::getDistanceValue()
{
     return this->distanceValue;  
}

//Hien thuc can contructor va decontructor
KSelection::KSelection()
{
                        
}

KSelection::~KSelection()
{

}
