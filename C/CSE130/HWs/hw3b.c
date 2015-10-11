//RONALD BALCHAND
//#109806273
//CSE 130 HW# 3 PART B
//This program contains the function square() that takes an integer and returns its square, and the function cube() that takes an integer and returns its cube. It also has the functions quartic() and quintic() which return the 4th and fifth powers of an integer


#include <stdio.h>
#include <stdlib.h>
int square(int n){
  return n*n;
}

int cube(int n){
  return n*n*n;
}

int quartic(int n){
  return square(n) * square(n);
}

int quintic(int n){
  return cube(n) * square(n);
}


int main(null){
  while(1==1){
    printf("Enter an integer n: ");
    int n;
    scanf("%d", &n);

    int i = 1;
  
    printf("%-10s       %-6s       %-4s       %-7s       %-7s\n","Integers", "Square", "Cube", "Quartic", "Quintic");
    printf("%-10s       %-6s       %-4s       %-7s       %-7s\n","--------", "------", "----", "-------", "-------");

    for(i = 1; i <= n; i++){
      printf("%8d       %8d       %4d       %7d       %7d\n",i, square(i), cube(i), quartic(i), quintic(i));
    }

    printf("\n\nWould you like to continue (y/n)? ");
    char answer;
    scanf(" %c", &answer);
    if(answer == 'n'){
      printf("\nGood Bye! \n");
      break;
    }
  }
    
  return 0;
}
