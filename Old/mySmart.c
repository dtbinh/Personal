#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>




static void sighandler(int signo){
  if (signo == SIGUSR1){
    printf("Ive been signaled\n");
  }
  else if(signo == SIGSEGV){
    printf("Nice Try\n");
    exit(0);
  }
}



int main(){

  char *a = NULL;
  signal(SIGUSR1, sighandler);
  signal(SIGSEGV, sighandler);
  //*a = 12;  //doing this is usually blocked by a seg fault but th stuff abve handless it with nic try instad of segfault


  
  int i = 0;
  while(1){
    printf("G'day mate ! \t%d\t%d\n", i++, getpid());
    sleep(1);
  }
  
  return 0;
}
