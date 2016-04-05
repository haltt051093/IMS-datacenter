#include <cstdlib>
#include <iostream>

#include "Globals.h"
#include "ColorDetection.h"
# include "KSelection.h"
using namespace std;

int main(int argc, char *argv[])
{
    ColorDetection cd(30,28,42,2.0);
    //KSelection a[K_SIZE];
    //a[0].setColorName(0);
    //printf("Color %d \n",a[0].getColorName());
    int a = 255;
    uint8_t b = (uint8_t)a;
    printf("Test unit8: %d \n",b);
    system("PAUSE");
    return EXIT_SUCCESS;
}
