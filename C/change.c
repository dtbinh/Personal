#include <stdio.h>

int main(void){

  int remainder;
  int originalAmount;
  int numQuarters;
  int numDimes;
  int numNickels;
  int numPennies;


  printf("enter an amount of change:  ");
  scanf("%d", &originalAmount);
  numQuarters = originalAmount / 25;
  remainder = originalAmount % 25;
  numDimes = remainder / 10;
  remainder = remainder % 10;
  numNickels = remainder / 5;
  remainder = remainder % 5;
  numPennies = remainder;

  printf("Quarters = %d \nDimes = %d \nNickels = %d \nPennies = %d\n", numQuarters, numDimes, numNickels, numPennies);

  return 0;
}
