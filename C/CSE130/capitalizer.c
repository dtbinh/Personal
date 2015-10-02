//RONALD BALCHAND
//109806273

#include <stdio.h>

int main(void){

  char c;
  while((c = getchar()) != EOF){
    if(c >= 'a' && c <= 'z'){
      putchar(c -'a' +'A');
    }
    else if(c == '\n'){
      putchar(c );
      putchar(c);
    }
    else{
      putchar(c);
    }
  }

  return 0;
}
