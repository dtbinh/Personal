#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>



int main(){

  while(1) {
  int i;
  char input[256];
  char inputCd[256];
  printf("enter something to see if it works:");
  fgets(input, sizeof(input), stdin);
  if (strcmp(input, "exit\n") == 0){
    break; 
  }
  if (strcmp(input, "cd\n") == 0){
    fgets(inputCd, size


  }
  return 0;

}
