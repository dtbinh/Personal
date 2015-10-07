//RONALD BALCHAND
//#109806273
//CSE 130
//Lab 7
//This program asks the user to input two integer values and returns the average of the two numbers
//This bonus checks to see if the resulting average is a prime number or not

#include <stdio.h>


//system("clear");

int average(int m, int n){
  return ((n + m)/2);
}

int isPrime(int result){//returns 1 if the number is prime, and 0 if it is not
  int i = 2;
  int isprime = 1;

  while((isprime = 1) && (i < result)){
    
    if((result % i == 0)){
      isprime = 0;
      break;
    }
    
    i++;
  }
  return isprime;
}
	  

int main(void){

  int m, n;
  printf("Type in m, n (both positive)\n");
  scanf("%d%d", &m, &n);
  printf("\nm  is %d, and n is %d\n", m, n);
  int avg = average(m, n);

  printf("\nTruncated Average of %d and %d is: %d\n", m, n, avg);

  int primeFunc = isPrime(avg);
  if(primeFunc == 0){
    printf("The truncated average of the two numbers is not prime.\n");
  }else{
    printf("The truncated average of the two numbers is prime.\n");
  }
  return 0;
}
