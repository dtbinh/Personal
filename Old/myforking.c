#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void parent() {
  int i;
  int status;
  wait(&status);
  for( i = 0; i< 1; i++){
    sleep(1);
    printf("after the split : %d\n", getpid());
    printf("wait returned: %d \n", WEXITSTATUS(status));
    printf("wait returned: %d \n", status);
  }
}




void childs_play(int x) {
  int i;
  for (i = 0; i <x; i++){
    sleep(1);
    printf("I'm the child! my name is : %d \n my parent is: %d \n", getpid(), getppid());
  }
}


int main(){

  int f, f2;
  int x = 5;
  int i = 0;
  int status;
  printf("befre the split\n my name is %d\n",getpid() );
  f = fork();
  if(f == 0)
    childs_play(10);
  else{
    parent();
  }

  f2 = fork();
  if(f2 == 0)
    childs_play(10);
    else{
      parent();
  }

  return 0;

}	   
	   
