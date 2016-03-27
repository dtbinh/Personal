#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


int main(){
  
  int f;
  int s;
  char ** command2;
  
  command2 = (char **) calloc(4, sizeof(char *));// it is a char double pointer, and 4 slots the size of (char*)
  //creattion of a 2d array(command2) with 4 slots meant to fit (char*) 
  for(f = 0; f<4; f++){
    command2[f] = (char *) calloc(100, 1);
    //each slot contains space for 100 char*
  }
  
  strncpy(command2[0], "emacs", 100);//makes the first slot "emacs " the siz of 100 to make sure it is filled
  strncpy(command2[1], "newFile.c", 100);//same here wih th "-nm"
  // command2[1] = 0;
  command2[2] = 0; //null
  
  
  f = fork();
  if(f == 0){
    execvp(command2[0], command2); // th first arguement of execvp is th // pointer to the file name associated with the 
  }
  else{
    wait(&s);
    printf("Done \n");
  }
  return 0;
} 
