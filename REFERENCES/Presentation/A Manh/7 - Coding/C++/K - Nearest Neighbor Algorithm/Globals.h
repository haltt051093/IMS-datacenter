#ifndef GLOBALS_H
#define GLOBALS_H

#define WHITE 0
#define RED 1
#define ORANGE 2
#define YELLOW 3
#define GREEN_LIGHT 4
#define GREEN_DARK 5
#define BLUE_LIGHT 6
#define BLUE_DARK 7
#define PURPLE_LIGHT 8
#define PURPLE_DARK 9
#define PINK_LIGHT 10 
#define PINK_DARK 11
#define OUT_OF_RANGE 100

#define SAMPLE_SIZE 250 //Kich co cua List of Color Sample
#define K_SIZE 200 //So sample gan nhat duoc chon ra trong giai thuat K-NN
#define ANALYSIS_TABLE_SIZE 12 //Kich thuoc cua Statistical Table (Bang Thong Ke)

#include <stdint.h>


extern uint8_t sample[SAMPLE_SIZE][4];

#endif
