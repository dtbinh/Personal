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

  double classGrade;
  
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
  }

  double dsum = (double)sum;
  double dnum = (double)numA;
  
  double assignAverage = dsum/dnum;
  
  double assignPer = assignAverage * .4;

  ans = (assignPer + midPer + finalPer);
  
  return ans;
}



int main(null){
  int numAssignments;
  int maxStudents = 200;
  student *students;
  char *filename;
  int currentStudent = 0;


  printf("Enter Input Filename: ");
  scanf("%s", &filename);
  printf("Enter Number of Assignmment Grades: ");
  scanf(" %d", &numAssignments);
  
  
  
  /*  student a;
  a.name = "Ronald Balchand";
  a.id = 109806273;
  a.assignments[0] = 90;
  a.assignments[1] = 100;
  a.midterm = 80;
  a.final = 100;

  //printf("%d %d", a.assignments[0], a.assignments[1]);
  
  printf("\n\n%.2f\n", finalCalculator(a.midterm, a.final, a.assignments, 2));
  */
}
    
