#ifndef COLORANALYSISTable_H
#define COLORANALYSISTable_H
#include "Globals.h"
#include "KSelection.h"
#include "ColorAnalysisItem.h"


class ColorAnalysisTable
{
     public:
          //Cac phuong thuc xu ly chinh thuc
          void initialization();
          void calAnalysisTable(KSelection[], int);
          uint8_t matchColor();
          
          //Cac Phuong thuc bo sung, ho tro tinh toan
          int findMaxCountInArray(ColorAnalysisItem[],int);
          int findNumOfMaxCount(ColorAnalysisItem[],int);
          //Tao contructor va decontructor
          ColorAnalysisTable();
          ~ColorAnalysisTable();
     private:
          ColorAnalysisItem listItem[ANALYSIS_TABLE_SIZE];
          int maxCountValue;//So lan xuat hien nhieu nhat cua mot mau     
};
#endif
