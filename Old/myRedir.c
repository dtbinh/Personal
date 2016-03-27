#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main(){

  int fd;
  int fd1;
  int fd2;
  int f;
  char ** command2;

  fd = open("output", O_WRONLY| O_TRUNC | O_CREAT, 0664);

  fd1 = dup( STDOUT_FILENO);

  printf("before th redirection\n");

  dup2( fd, STDOUT_FILENO);

  printf("after redirction \n");
  printf("whatver this is, it should be in the ne file\n");

  //return to normal
  dup2(fd1, STDOUT_FILENO);


  printf("this is whats in the file\n");




  command2 = (char**) calloc(4, sizeof(char*));
  for (f = 0; f<4; f++){
    command2[f] = (char*) calloc(100, 1);
  }
  
  strncpy(command2[0], "cat", 100);
  strncpy(command2[1], "output", 100);
  command2[2] = 0;

  fd2 = fork();
  if (fd2 == 0){
    execvp(command2[0], command2);
  }
  else{
    wait(1);
    printf("Done\n");
  }

  return 0;
}
