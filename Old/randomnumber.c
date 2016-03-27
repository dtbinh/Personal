//Ronald Balchand
//Lesson on random numbers


#include <stdio.h>
#include <stdlib.h>

int randomNumber(int min, int max){

  int result = 0;
  int low = 0;
  int hi = 0;
  if(min < max){
    low = min;
    hi = max + 1; //this is done to include max in output
  }
  else{
    low = max + 1; //thi is done to include max again in the output
    max = min;
  }
  srand(time(NULL));
  result = (rand() % (hi - low)) + low;
  return result;
}



int main(){
  int i = 0;
  int h = 256;
	
  int answer = randomNumber(i,h);
  printf("Randomized number from 0 to 256 : %d", answer);
  return 0;


}
