#include <stdio.h>


int isReverse(int a[], int b[], int n){
  int ans;
  int i = 0;
  int j = n - 1;
  
  while(i < n){
    printf("comparing %d with %d\n",a[i],b[j]);
    if(a[i] == b[j]){
      // printf("correct\n");
      ans = 1;
      i++;
      j--;
    }else{
      //printf("not a match\n");
      ans = 0;
      break;
    }
  }
  return ans;

}



int main(void){
  int a[] = {1,6, 3, 4};
  int b[] = {4,3,2,1};
  int n = 4;

  printf("%d", isReverse(a,b,4));
}
