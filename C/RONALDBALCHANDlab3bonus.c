//RONALD BALCHAND
//CSE 130, Lab 3
//#109806273

#include <stdio.h>
int main (void){
  int i;             // Indentation is important
  int j;
  // for readability
  printf("Type in starting value for i: \n");
  scanf("%d", &i);
  
  printf("Enter a number to increment by \n");
  
  int sum = 0;
  
  scanf("%d", &j);
  while (i <= 100)
    {
      
      printf(" %d", i);
      sum += i;
      i += j;
    }
  printf(".\n");
  
  printf("Sum = %d\n", sum);

  int square = sum * sum;
  int cubed  = sum * square;

  printf("Square of the total: %d\n", square);
  printf("Cube of the total: %d\n", cubed);
  
  return 0;
}
