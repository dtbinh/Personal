//RONALD BALCHAND
//109806273
//CSE130
//HOMEWORK 6 PART A
//This program reads information for students in a class from a text file, and then computes the final grade for each student.

#include <stdio.h>
#include <stdlib.h>

typedef struct{//creation of the struct for each student and their components
  char *name;
  int id;
  int assignments[6];
  int midterm;
  int final;
  
}student;


//this function calcualates a students' final grade taking their final grade, midterm grade, an array of their assignments, and the number of assignments 
double finalCalculator(int midterm, int final, int *assignments, int numA){
  double ans;
  double dmid = (double)midterm;
  double dfin = (double)final;

  double midPer = dmid * .3;
  double finalPer = dfin * .3;

  int i;
  int sum = 0;
  for(i = 0; i < numA; i++){
    sum += assignments[i];
    
    printf("heres whats at assignment position %d : %d\n\n",i,assignments[i] );
  }

  printf("The sum: %d\n\n", sum);
  double dsum = (double)sum;

  printf("The sum : %f\n\n", sum);
  double dnum = (double)numA;
  
  double assignAverage = dsum/dnum;
  
  double assignPer = assignAverage * .4;

  printf("grades for each component: %f %f %f\n", dmid, dfin, assignAverage);
  printf("Makeup: %f %f %f",midPer, finalPer, assignPer);

  ans = (assignPer + midPer + finalPer);
  
  return ans;
}



int main(null){
  student a;
  a.name = "Ronald Balchand";
  a.id = 109806273;
  /* int *b;
  b[0] = 90;
  b[1] = 100;*/
  a.assignments[0] = 90;
  a.assignments[1] = 100;
  // a.assignments[0] = 90;
  //a.assignments[1] = 100;
  a.midterm = 80;
  a.final = 100;

  //printf("%d %d", a.assignments[0], a.assignments[1]);
  
  printf("\n\n%f\n", finalCalculator(80, 100, a.assignments, 2));
}
    
