//RONALD BALCHAND
//#109806273
//CSE130
//ASSIGNMENT 4 PART B
//This program takes acertain number of integers from standard input, and scans the set of numbers to find out how many times each integer occurs in the set.

//This program also contains the bonus section where the statements are printed in descending order

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void sort(int *  a, int n){//parameters: array passed and number of elements inside the array
  int i;
  int j;
  for(i=0;i < n-1; i++){
    for(j = (i+1);j <= n - 1; j++){
      if(a[j] < a[i]){
	int temp = a[i];
	a[i] = a[j];
	a[j] = temp;
      }
    }
  }
}

int found(int * a, int b, int n){//parameters: Array passed, integer to be found, and number of elements inside the array
  int ans = 0;
  int i = 0;
  while(i < n){
    if(a[i] == b){
      ans = 1;
      break;
    }else{
      i++;
    }
  }
  return ans;
}




int main(null){
  printf("Enter your Numbers: ");
  int numbers[100];
  char line[1024];//Where the characters go
  char *a;
  char *b;
  int v;
  int i = 0;

  while (fgets(line, sizeof(line), stdin)) {
    a = line;
    for (a = line; ; a = b) {
      v = strtol(a, &b, 10);
      if (a == b){
	break;
      }
      numbers[i] = v;
      i++;
    }
    break;
  }

  printf("\n");

  int numbers2[100];

  
  sort(numbers, i);//apply sorting method
  int i2;
  int i3 = 0;
  for(i2 = i - 1; i2 >= 0; i2--){
    if((found(numbers2, numbers[i2],i3 )) != 1){
      if(numbers[i2] != 0){
	numbers2[i3] = numbers[i2];
	int count = 0;
	int value = numbers[i2];
	int j = i2;
	while(j >= 0){
	  if(value == numbers[j]){
	    count++;
	  }
	  j--;
	}

	printf("%d occurs %d times\n", value, count);
	i3++;
      }
    }
  }

  printf("\n\n");
      
  
  return 0;
}
  
