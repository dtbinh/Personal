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


int main(null){
  printf("Enter the range of the numbers you wish to sort: ");
  int range;
  scanf("%d", &range);
  
  int count[range];
  
  char ans;
  printf("Would you like to use default start (1) or input your own offset value(y/n)? ");
  int start;
  int finish;
  
  scanf(" %c", &ans);
  fflush(stdin);
  if(ans == 'y'){//user wants an output
    int offset;
    printf("\nEnter your own offset value: ");
    scanf(" %d", &offset);
    fflush(stdin);
    start = (1 - offset);
  }else{
    start = 1;
  }

  finish = start + range - 1; 
  printf("\nYour range will be from %d - %d", start, finish);

  int i1;
  for(i1 = 0; i1 < range;i1++){
    count[i1] = 0;
  }

  printf("\nNow Enter the set of numbers you wish to sort\n: "); 
  
  
}
    
  



  
