//RONALD BALCHAND
//#109806273
//CSE 130 HW# 2 PART A
//THis program reads the input of two integers, and rounds the first integer up to the next largest multiple of the second integer

#include <stdio.h>

int main(null){
  int i = 0;
  int j = 0;

  printf("Please enter two integers: ");
  scanf("%d %d", &i, &j);

  int next_multiple = i + j - (i%j);

  printf("\n%d has been rounded up to %d, which is the next largest multiple of %d", i, next_multiple, j);
  return 0;
}

  

  
