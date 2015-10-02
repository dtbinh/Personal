//RONALD BALCHAND
//#109806273
// CSE 130 LAB 4

#include <stdio.h>


int main(void){
  int m, n;
  printf("Type in m, n on the same line. Let m > n.\n");
  scanf ("%d%d", &m, &n);
  printf("\nm = %d,  n = %d\n\n", m, n);


  int i = 1;

  while(i <= m){
    int j = 1;
    while(j <= n){
      printf("*");
      j += 1;
    }
    printf("\n");
    i+= 1;
  }
  
  return 0;
}
