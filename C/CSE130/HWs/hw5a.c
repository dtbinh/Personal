//RONALD BALCHAND
//#109806273
//CSE 130
//HW 5 PART A

#include <stdio.h>
#include <stdlib.h>

int counter(int * a, int b, int n){//program returns how many occurrences of b there are in array a
  int ans = 0;
  int i;
  for(i = 0; i < n; i++){
    if(a[i] == b){
      ans++;
    }
  }
  return ans;
}



int * sort(int offset, int lower, int higher, int *a){//made for integer arays ranging 1-100
  int count[100];
  int i3;
  for(i3 = 0; i3 < 100; i3++){
    count[i3] = 0;
  }
  int i;
  for(i = lower; i <= higher; i++){//go through the lower to upper bound
    if(i != 0){
      if(counter(a, i, 100) != 0){//if there are more than 0 of this number in the array entered
	count[i + offset - 1] = counter(a, i, 100);// its respective place in the count array is equal to the number of it in the entered array
      }
    }
    
  }

  int i2;
  for(i2 = 0; i2 < 100; i2++){
    printf("%d, ", count[i2]);
  }
  
  return a;
}


int main(null){
  int first;
  int last;
  printf("Would you like to enter your own offset value(y/n)");
  char ans;
  int offset;
  scanf("%c%*c", &ans);
  if(ans == 'y'){
    printf("\nEnter your offset value: ");
    scanf(" %d%*c",&offset);
    first = 1 - offset;
    last = first + 99;
    printf("\nSorting from %d to %d .\n", first, last);
  }else{
    offset = 0;
    first = 1;
    last = 100;
  }
  printf("\nNow enter the numbers that you would like to sort : ");
  int count[100];
  int numbers [100];
  int i3 = 0;
  while(i3 < 100){
    numbers[i3] = 0;
    i3++;
  }
  
  char line[1024];

  char *a;
  char *b;
  int v;
  int i2 = 0;

  while(fgets(line, sizeof(line), stdin)){
    a = line;
    for(a = line; ; a = b){
      v = strtol(a, &b, 10);
      if(a == b){
	break;
      }
      numbers[i2] = v;
      i2++;
    }
    break;
  }


  printf("\n");
  
  int i1;
  for(i1 = 0; i1 < 100; i1++){
    if(numbers[i1] != 0){
      printf("%d ", numbers[i1]);
    }
  }

  printf("\n\n");

  sort(offset, first, last, numbers);
  

  
  
  
}
