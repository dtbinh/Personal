//RONALD BALCHAND
//#109806273

//CSE 130
//LAB 10
//This Program allows you to enter up to 30 students with their names and ID numbers, then allowing you to sort them by either ID numbers or by their names
#include<stdlib.h>
#include<stdio.h>
#define MAXNAME 10
#define IDNUMBER 9
#define MAXSTUDENTS 30


void read_in(char *s){
  int c, i = 0;
  while((c = getchar()) !=EOF && c!='\n'){
    s[i++] = c;
  }
  s[i] = '\0';
}


int main(){
  char names[MAXSTUDENTS][MAXNAME];
  char ids[MAXSTUDENTS][IDNUMBER];
  while(1==1){
    printf("\n1) Add students\n2) Sort by ID\n3) Sort by Name\n4) Quit\n Choose an option: ");
    
    char choice;
    scanf("%c ", &choice);
    
    if(choice == '1'){
      printf("\nEnter a name: ");
      /*int i= 0;
      while(names[i] == '\0'){
	i++;
      }
      read_in(names[i]);
      }*/
    }
  }
  return 0;
}
