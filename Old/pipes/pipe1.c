#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>


int main(){
  umask(0000);
  mkfifo("fido",0644);
  
  return 0;
  

}
