//RONALD BALCHAND
//#109806273
//CSE 130 HW #3
//This Progrram takes the input from the user and generates the hailstone sequence

#include <stdio.h>
#include <stdlib.h>

int main(null){
  while(1 == 1){
    printf("Enter the starting value: ");
    int input;
    scanf("%d", &input);
    fflush(stdin);
 
    if(input < 0){
      printf("\nError: The Hailstone Sequence is not defined for non-positive values.\nDo you wish to continue(y/n)? ");
      char answer;
      scanf(" %c", &answer);
      // fflush(stdin);
      if(answer == 'n'){
	printf("\nGood Bye!");
	break;
      }
    }

    else{
      int n = input;
      int sum = 0;

      
      while(n != 1){
	printf("%d, ", n);
	sum += n;
	
	if((n%2) == 0){
	  n /= 2;
	}
	else{
	  n = (3 * n) + 1;
	}
      }
      printf("1, ");
      
      printf("\nThe sum of this Hailstone Sequence is %d. \nDo you wish to continue (y/n)? ", sum);
      
      char answer2;
      scanf(" %c", &answer2);
      fflush(stdin);

      if(answer2 == 'n'){
	printf("\nGood Bye! \n");
	break;
      }
    }
  }
}
	
