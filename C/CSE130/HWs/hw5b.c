//RONALD BALCHAND
//#109806273
//CSE130 HW 5 PART B
//This programm allows the user to specify a certain amount of double values n, enter those n values, and then calculates the sum of the evenly and oddly indexed values in that set of numbers 


#include <stdio.h>
#include <stdlib.h>


void sum(double a[], int n){//finds and prints the even and odd index sum
  double evenSum = 0.0;
  double oddSum = 0.0;
  int i1;
  for(i1 = 0; i1 < n; i1 += 2){
    evenSum += a[i1];
  }
  int i2;
  for(i2 = 1; i2 < n; i2+= 2){
    oddSum += a[i2];
  }

  printf("\nSum of even index = %f\n", evenSum);
  printf("\nSum of odd index = %f\n", oddSum);
}


int main(null){
  int n;
  printf("Enter N: ");
  scanf("%d%*c", &n);
  double numbers[n];



  char line[1024];

  char *a;
  char *b;
  double v;
  int i = 0;

  printf("Enter %d doubles: ", n);

  while(fgets(line, sizeof(line), stdin)){
    a = line;
    for(a = line; ; a = b){
      v = strtod(a, &b);
      if(a == b){
	break;
      }
      //printf("%f",v);
      numbers[i] = v;
      i++;
    }
    break;
  }
  sum(numbers, n);
  
}
