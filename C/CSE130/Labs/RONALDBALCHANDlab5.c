//RONALD BALCHAND
//#109806273
// CSE 130 LAB # 5
//This program creates a menu with options to navigate and chose from

#include <stdio.h>

int main(){

  while(1==1){

    printf("\nWhich way do you want to go?\n1) North \n2) East \n3) South \n4) West \n5) Quit\n");

    int input;

    scanf("%d", &input);

    if(input == 1){
      printf("\nYou went up!");
    }else if(input == 2){
      printf("\nYou went right!");
    }else if(input == 3){
      printf("\nYou went down!");
    }else if(input == 4){
      printf("\nYou went left!");
    }else if(input == 5){
      break;
    }else{
      printf("Input Inalid");
    }
  }
  return 0;
}
	  
    
