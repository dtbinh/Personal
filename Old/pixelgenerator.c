//Ronald Balchand
//The point of this is to generate  a random pixel
//will be three numbers between the number 0 and 255



#include <stdio.h>
#include <stdlib.h>
#include <time.h>


int randomNumber(int min, int max){

  int result = 0;
  int low = 0;
  int hi = 0;
  if(min < max){
    low = min;
    hi = max + 1; //this is done to include max in output
  }
  else{
    low = max + 1; //this is done to include max again in the output
    max = min;
  }
  srand(time(NULL));
  result = (rand() % (hi - low)) + low;
  return result;
}



int gen_rand(void)
/* returns random number in range of 0 to 99 */
{
  int n;
  n = random();  /* n is random number in range of 0 - 99 */
  return(n);
}


int main(){
  
  int r = randomNumber(0, 255);
  srand(time(NULL));
  int g = randomNumber(0, 255);
  srand(time(NULL));
  int b = randomNumber(0, 255);

  printf("pixelgenerated : %d %d %d ", r, g, b);
}

