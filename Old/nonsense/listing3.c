#include <stdio.h>
#include <stdio_ext.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>


typedef void(*sighandler_t) (int);
char c = '\0';

void signal_handler(int signo){
  printf("\n[SHELL] ");
  fflush(stdout);
}


int main(int argc, char *argv[], char *envp[]){
  signal(SIGINT, SIG_IGN);
  signal(SIGINT, signal_handler);
  printf("[SHELL] ");
  while(c != EOF){
    c = fgetc(stdin);
    if(c == '\n'){
      printf("[SHELL]");
    }
  }
  printf("\n");
  return 0;
}
