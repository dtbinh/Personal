//RONALD BALCHAND
//#109806273
//CSE 130
//HW 5 PART A

#include <stdin.h>
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
  int count[100];
  char ans;
  printf("Would you like to use default values (0-100) or input your own offset value(y/n)? ");
  int start = 1;
  int finish = 100;
  scanf("%c ", &ans);
  fflush(stdin);
  if(ans == y){
    int offset;
    printf("\nEnter your own offset value: ");
    scanf(" %d
  



  
