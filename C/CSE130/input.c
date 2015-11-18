#include <stdio.h>



int main(void){

  
  double values[5] ={0.0,0.0,0.0,0.0, 0.0};
  printf("Please enter the 5 values for these calculations: ");
  int i1;
  double average = 0.0;
  for(i1 = 0; i1 < 5; i1++){
    scanf("%f", &values[i1]);
    average += values[i1];
  }
  // average /= 5.0;

  printf("Please enter the 5 values for the delta Ts: \n");
  double deltaT[5] = {0.0,0.0,0.0,0.0, 0.0};
  int i3;
  for(i3 = 0; i3 < 5; i3++){
    scanf("%f",&deltaT[i3]);
  }
	  

  double sum1 = 0;
  int i2;
  printf("\n The average of these numbers is %d", average);
  

  for(i2 = 0; i2 < 5; i2++){
    sum1 += ((values[i2] - average) * ((values[i2] - average)));
  }
  
  double sigmaX = sqrt(sum1/4.0);
  printf("\nSigma X is %f", sigmaX);
  printf("\nEnter the effective diameter of the ball in meters pls: ");
  double deff = 0.0;
  scanf("%f", &deff);
  printf("\nHere are the values of the Vsubx: \n"); 
  double vsubX[5] = {0.0,0.0,0.0,0.0,0.0};
  int i4;
  for(i4 = 0; i4 < 5;  i4++){
    vsubX[i4] = deff/(deltaT[i4]);
    printf("%f ",vsubX[i4]);
  }

  printf("\n");

  double vAverage = 0.0;

  int i5;
  for(i5 = 0; i5 < 5; i5++){
    vAverage += vsubX[i5];
  }

  vAverage /= 5.0;

  printf("\nThis is the V average is: %f", vAverage);

  double sum2 = 0;
  int i6;
  for(i6 = 0; i6 < 5; i6++){
    sum2 += ((vsubX[i6] - vAverage) * (vsubX[i6] - vAverage));
  }

  double sigmaVX = sqrt(sum2/4.0);
  printf("\nTHis is Sigma of V of X is:  %f", sigmaVX);
  

  
  
  return 0;
}
