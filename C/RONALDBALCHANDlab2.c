//RONALD BALCHAND
//109806273
//CSE 130, LAB 2
//LAB 2 SAMPLE PROGRAM
//learn how to program in c

#include <stdio.h>

int main(void){//this is the main program
  
  printf("These lines are printed by \n");
  printf("the lab2.c program \n");

  int coins = 0;
  printf("How many coins do you have? ");
  scanf("%d", &coins);
  printf("You have %d coins\n", coins);

  int n = 0;
  printf("Enter a number n:  ");
  scanf("%d", &n);

  int i = 0;
  int sum = 0;
  while(i <= n){
    sum = sum + i;
    i = i + 1;
  }

  printf("\nThe sum of all numbers from 1 to %d is %d", n, sum);

  return 0;
}
   
