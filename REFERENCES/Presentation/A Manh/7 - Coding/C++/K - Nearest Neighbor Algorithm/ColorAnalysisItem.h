#ifndef COLORANALYSIS_H
#define COLORANALYSIS_H
#include <stdint.h>
class ColorAnalysisItem
{
     public:
          //Cac phuong thuc set va get gia tri
          void setColorName(uint8_t);
          void setCount(int);
          void setSum(float);
          void setMean(float);
          
          uint8_t getColorName();
          int getCount();
          float getSum();
          float getMean();
          
          //Tao contructor va decontructor      
          ColorAnalysisItem();
          ~ColorAnalysisItem();
     private:
          uint8_t colorName;
          int count;
          float sum;
          float mean; 
};
#endif
