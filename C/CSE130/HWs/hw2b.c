//RONALD BALCHAND
//#109806273
//HW2 PART B
//THIS FILE ALSO INCORPORATES THE EXTRA CREDIT
//This program generates a random number between 1 and 50 inclusive, asks the user to guess it with 3 chances, then prompts the user if they want to continue playing

#include <stdlib.h>
#include <stdio.h>
#include <time.h>


int main(null){

  while(1 == 1){
    srand(time(0));
    printf("\nI am thinking of a number between 1 and 50. Can you guess what it is?");
    
    int random = (rand() % 49) + 1;
    int guess = 0;
    int guesscounter;

    for(guesscounter = 1; guesscounter <= 3; guesscounter++){
      printf("\nPlease enter a guess: ");
      scanf("%d", &guess);
      if(guess == random){
	printf("\nYes, the number I was thinking of was %d. You Win!!!!", random);
	break;
      }
      else{
	printf("Sorry, it isnt %d. ", guess);
	if(guesscounter == 3){
	  printf("\nYou lose!! The number I was thinking of is %d.", random);
	}
      }

    }

    printf("\nWould you like to play another round?(0 for yes, 1 for no): ");
    int round;
    scanf("%d", &round);
    if(round == 1){
      break;
    }

  }

  return 0;
    
   
}
