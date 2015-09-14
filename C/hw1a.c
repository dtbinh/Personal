//RONALD BALCHAND
//#109806273
//CSE 130
//HW 1 PART A

#include <stdio.h>

//This program converts degree from Farenheit to Celsius using the following formula
//C = (F - 32)/1.8



int main(){
  float farenheit;
  printf("Enter a number to convert to degrees in celsius: ");
  scanf("%f", &farenheit);
  double farenheit2 = (double)farenheit;

  double celsius = (farenheit2 - 32)/ 1.8; 
  
  printf("%f Farenheit is %f degrees Celsius", farenheit2, celsius);
  return 0;
}
