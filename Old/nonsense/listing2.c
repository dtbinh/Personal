#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main (int argc, char *arg[], char *nvp[]){
  char c ='\0';
  printf("\n[MY_SHELL] ");
  while(c!= EOF){
    c = fgetc(stdin);
    if(c == '\n'){
      printf("[MY_SHELL] ");
    }
  }
  printf("\n");
  return 0;
}
