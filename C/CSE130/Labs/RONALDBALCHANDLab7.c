//RONALD BALCHAND
//#109806273
//CSE 130
//Lab 7
//This program asks the user to input two integer values and returns the average of the two numbers


#include <stdio.h>


//system("clear");

float average(int m, int n){
  float i = (float)m;
  float j = (float)n;
  return ((i + j)/2.0);
}

int main(void){

  int m, n;
  printf("Type in m, n (both positive)\n");
  scanf("%d%d", &m, &n);
  printf("\nm  is %d, and n is %d\n", m, n);

  printf("\nAverage of %d and %d is: %f\n", m, n, average(m, n));
}

  
 
  
