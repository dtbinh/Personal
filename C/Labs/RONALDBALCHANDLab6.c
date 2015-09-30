//RONALD BALCHAND
//#109806273
//CSE 130 LAB 6
//This lab finds the first 8 fibbonacci numbers and prints them as Uppercase Letters
#include <stdio.h>

int main(void){

  while(1==1){
    printf("Pick one of the first 8 Fibonacci characters\n");

    int i = 0;
    int j = 1;
    int counter;
    char first = 'A';
    printf("%c", first);
    for(counter = 0; counter < 7; counter++){
      int next = i + j;
      char temp = 'A';
      printf("%c", temp + next - 1);
      i = j;
      j = next;
    }
    printf("\n");

    char input;
    scanf("%c", &input);

    int value = input - 'A';

    int i2 = 0;
    int j2 = 1;
    int counter2;
    for(counter2 = 0; counter2 < 7; counter2++){
      int next2 = i2 + j2;
      if(next2 == value){
	printf("\n%c is in position %d\n", input, counter2);
	printf("Would you like to play again(Y/N)\n\n");
	char answer;
	scanf("%c", &answer);

	if(answer == 'N'){
	  break;
	}
	i2 = j2;
	j2 = next;
      }

    }
    
    printf("\n%c is not in the sequence.\n", input);

    printf("Would you like to play again(Y/N)\n\n");
    char answer2;
    scanf("%c", &answer2);

    if(answer2 == 'N'){
      break;
    }

  }
    
  return 0;
}
  
  
