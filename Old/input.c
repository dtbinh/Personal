#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(){

  int i;
  char line[256];
  char line2[256];


  //printf("enter something: (scanf):");
  //scanf("%s", line);
  //scanf(%d, line);
  //printf("you enterred%s\n" , line);


   printf("ENter something and an int(scanf):");
   scanf("%d %s",&i, line);
   printf("you entered: %d and %s\n", i, line); 


  //FGETS - first parameter 
  //second parameter is the size of what needss to be gotten. It will read that many bytes and put it online 
  //last parameter is where youre getting the info from....takes a file pointer(FILE *) instead of a file descriptor

  //flush and purge can clear the file buffer p-rventing fgets from reading the new line

   //fpurge(stdin);
   
   
   printf("Put something(fgets): ");
   fgets(line, sizeof(line), stdin);
   *strchr(line, '\n') = 0;
   //strchr returns a pointer to the null 0
   //   line[strlen(line) -1] = 0;
   printf("you printed :%s0\n", line);
   
   
   
   
   return 0;
   
   
}
	     
