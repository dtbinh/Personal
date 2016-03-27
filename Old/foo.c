#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void main() {
  FILE *fp;
  fp = fopen("a.ppm","w");
  int h,i,j,k,l;
  fprintf(fp, "P3\n");
  fprintf(fp, "%d %d]n", 500, 500);
  fprintf(fp, "225\n");
  srand(time(NULL));
  for (h=0; h<500; h++) {
    for (i=0; i<500; i++) {
      j = rand() % 55 + 200;
      k = rand() % 55 + 200;
      l = rand() % 55 + 200;
      fprintf(fp, "%d %d %d ",j,k,l);
    }
  }
}
