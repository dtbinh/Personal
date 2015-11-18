//RONALD BALCHAND
//#109806273
//CSE 130
//HW 5 PART A
//This program sorts an array of integers entered by the user, using a new method called BucketSort where each integer is counted and the amount corresponds to anothe array where the index corresponds with the amount of times that integer appears in the array. It then manually reassigns the value of each element in the original array so that it becomes sorted.

//This program also includes the bonus to allow the user to enter their own offset value, changing the range of integers in which you can sort


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



void sort(int offset, int lower, int higher, int *a){//Uses the given BucketSort algorithm to sort an array. Takes the array, the lower and upper bounds of the range, and the offset value if any

  
  int count[100];
  int i3;
  for(i3 = 0; i3 < 100; i3++){
    count[i3] = 0;
  }
  int i;
  for(i = lower; i <= higher; i++){
    if(i != 0){
      if(counter(a, i, 100) != 0){
	count[i + offset - 1] = counter(a, i, 100);
      }
    }
    
  }

  int placeKeeper = 0;
  int i4;
  for(i4 = 0; i4 < 100; i4++){
    if(count[i4] != 0){
      
      int countdown;
      int numberToAdd = i4 - offset + 1;

      for(countdown = count[i4]; countdown > 0; countdown--){
	a[placeKeeper] = numberToAdd;
	placeKeeper++;
      }
    }
  }

  int i2;
  for(i2 = 0; i2 < 100; i2++){
    if(a[i2] != 0){
      printf("%d, ", a[i2]);
    }
  }
}


int main(null){
  printf("Bucket Sort: \n");
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
   
  }else{
    offset = 0;
    first = 1;
    last = 100;
    
  }
  printf("\nSorting from %d to %d .\n", first, last);
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

  printf("\n\nSorted Array: ");

  sort(offset, first, last, numbers);
  

  
  
  
}
