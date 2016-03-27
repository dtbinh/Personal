#include <stdlib.h>
#include <stdio.h>
#include <time.h>






int main(){
  
  srand(time(NULL));
  FILE *fp;
  fp = fopen("image.ppm", "w");
  fprintf(fp, "P3 \n# image.ppm\n500 500 \n255\n");
  int n;
  int m;
  for(n = 0; n<= 250; n++){
    for(m = 0; m<= 250; m++){
      int r = rand() % 255;
      int g = rand() % 255;
      int b = rand() % 255;
      fprintf(fp, "%d %d %d ",r, g, b);
    }
  }
  
  int i1;
  int i2;
  for (i1 = 0; i1<= 250;i1++){
    for (i2 = 0; i2<= 250; i2++){
      int r2 = rand() % 125;
      int g2 = rand() % 125;
      int b2 = rand() % 125;
      fprintf(fp, "%d %d %d ",r2, g2, b2);
    }
  }
  fclose(fp);
  
  

}

