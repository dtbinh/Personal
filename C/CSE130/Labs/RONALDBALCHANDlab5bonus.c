//RONALD BALCHAND
//#109806273
// CSE 130 LAB # 5
//This program creates a menu with options to navigate and chose from

#include <stdio.h>

int main(){
  int longitude = 0;
  int latitude = 0;

  while(1==1){

    printf("\nWhich way do you want to go?\n1) North \n2) East \n3) South \n4) \
West \n5) Quit\n");

    int input;




    scanf("%d", &input);

    if(input == 1){
      printf("\nYou went up!");
      longitude += 1;
    }else if(input == 2){
      printf("\nYou went right!");
      latitude += 1;
    }else if(input == 3){
      printf("\nYou went down!");
      longitude -= 1;
    }else if(input == 4){
      printf("\nYou went left!");
      latitude +=1;
    }else if(input == 5){
      
      if(longitude >= 0){
	printf("North %d, ", longitude);
      }
      if(longitude < 0){
	printf("South %d, ", longitude * -1);
      }
      if(latitude > 0){
	printf("East %d.\n ", latitude);
      }
      if(latitude < 0){
	printf("West %d.\n ", latitude * -1);
      }
      break;
    }else{
      printf("Input Inalid");
    }
  }
  return 0;
}

