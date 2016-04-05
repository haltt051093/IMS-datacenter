#ifndef COLORDETECTION_H
#define COLORDETECTION_H
#include <math.h>
#include "Globals.h"
#include "KSelection.h"
#include "ColorAnalysisItem.h"
#include "ColorAnalysisTable.h"
#include <stdint.h>

class ColorDetection
{
     public:
          //Cac phuong thuc xu ly chinh thuc
          uint8_t findClosetColor();
        
          //Cac Phuong thuc bo sung, ho tro tinh toan
          int getIndexMaxValue_k_selection(KSelection a[],int size);
    
          //Cac phuong thuc set va get gia tri
          void setPercentageRed(uint8_t);
          void setPercentageGreen(uint8_t);
          void setPercentageBlue(uint8_t);
          void setFrequencyClear(float);
    
          uint8_t getPercentageRed();
          uint8_t getPercentageGreen();
          uint8_t getPercentageBlue();
          float getFrequencyClear ();
    
          //Tao contructor va decontructor
          ColorDetection();
          ColorDetection(uint8_t, uint8_t, uint8_t, float);
          ~ColorDetection();
    
     private: 
          uint8_t percentageRed;
          uint8_t percentageGreen;
          uint8_t percentageBlue;
          float frequencyClear;  
};
#endif
