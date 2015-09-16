//RONALD BALCHAND
//#109806273
// CSE 130 LAB 4 Bonus

#include <stdio.h>


int main(void){
  int m, n;
  printf("Enter a value for m: \n");
  scanf ("%d", &m);
  printf("\nm = %d\n\n", m);


  int i = 1;

  while(i <= m){
    
    int j = 1;
    
    while(j <= i){
      printf("*");
      j+= 1;
    }
    
    printf("\n");
    i+= 1;
  }

  return 0;
}


