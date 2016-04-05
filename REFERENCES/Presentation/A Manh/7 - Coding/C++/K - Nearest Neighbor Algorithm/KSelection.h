#ifndef KSelection_H
#define KSelection_H
#include <stdint.h>

class KSelection
{
     public:
          //Cac phuong thuc set va get gia tri
          void setColorName(uint8_t);
          void setDistanceValue(float);
          
          uint8_t getColorName();
          float getDistanceValue();
          
          //Tao contructor va decontructor
          KSelection();
          ~KSelection();
     private:     
          uint8_t colorName;
          float distanceValue;
};
#endif
