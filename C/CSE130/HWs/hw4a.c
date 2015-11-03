//RONALD BALCHAND
//#109806273
//CSE130
//ASSIGNMENT 4 PART A
//This program contains three lists of 16 Shakespearean inults. It generates three random numbers and compiles a Shakespearean insult sentence, and then asks the user if they wish to be insulted again  
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void){

  char * insult1[] = {"artless", "bawdy", "beslubbering","bootless", "churlish", "cockered", "goatish","impertinent", "infectious", "lumpish", "mannering", "qualling", "froward", "saucy", "spongy", "puny"};
  
  char * insult2[] = {"doghearted", "beetle-headed", "fen-sucked", "dizzy-eyed", "flap-mouthed", "hell-hated", "guts-gripping", "hedge-born", "plume-picked", "reeling-ripe", "ill-nurtured", "onion-eyed", "rude-growing", "idleheaded", "pottle-deep", "pox-marked"};
  
  char * insult3[] = {"lout", "flirt-gill", "flustilarian", "giglet", "gudgeon", "codpiece", "miscreant", "puttock", "lout", "mammet", "pigeon-egg", "lewdster", "harpy", "pignut", "ratsbane", "varlot"};

  while(1==1){
    srand( (unsigned) time(0));
    int random1 = rand() % 16;
    int random2 = rand() % 16;
    int random3 = rand() % 16;

    printf("\nThou %s %s %s!\n", insult1[random1], insult2[random2], insult3[random3]);

    printf("Have you had enough? (y/n): ");
    char ans;
    fflush(stdin);
    scanf(" %c", &ans);
    fflush(stdin);
    if(ans == 'y'){
      break;
    }
  }
  

  
    
  return 0;
}
