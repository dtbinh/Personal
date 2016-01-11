// lab13.c
// CSE 130, Lab 13.
// Sample program for studying bubble sort.

#include <stdio.h>

void bubbleSort(int A[], int N){
  int i, j,k, temp;
  printf ("\n\nArray A before sorting: "); // Print array A
  for (k = 0; k < N; k++)
    { printf(" %d", A[k]); }
  printf("\n\n");





  
  // Sorting starts
  for( i = 0; i < N-1; i++ )   // N is the size.
    // We need N-1 passes.
    {
      // <-- Initialize swap
      for( j = 1; j < N - i; j++ )

	{
	  if( A[ j - 1 ] > A[ j ] )

	    {  temp = A[j - 1];    
	      A[j - 1] = A[ j ];
	      A[ j ] = temp;
	    }
	} 

      printf ("Array A after pass %d: ", i+1);
      for (j = 0; j < N; j++)
	{ printf(" %d", A[j]); }
      printf("\n");

      //break;

    } 
  
}

int main (void){
  int A[6] = {6, 5, 4, 3, 2, 1 }, k, N = 6;
  
  bubbleSort(A,N);
  
  printf("\n\n");
  return 0;
}

