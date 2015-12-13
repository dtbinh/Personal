//RONALD BALCHAND
//109806273
//CSE130
//HOMEWORK 6 PART A
//This program reads information for students in a class from a text file, and then computes the final grade for each student.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
  int numStudents = 0;
  student *students;
  char *filename;
  int currentStudent = 0;
  FILE *filePointer;

  

  printf("Enter Input Filename: ");
  scanf("%s", &filename);
  printf("Enter Number of Assignmment Grades: ");
  scanf(" %d", &numAssignments);
  
  printf("File name: %s", &filename); 
  
  filePointer = fopen(&filename, "r");

  char line[128];


  while(fgets(line, sizeof(line), filePointer)!= NULL){

    int currentChar = 0;
    
    char name[25];
    //get name from the line    
    int spaces = 0;
    int i1 = 0;
    while(spaces < 2){
      if(line[i1] == ' '){
	spaces++;
      }
      i1++;
    }
    strncpy(name, line, i1);
    name[i1] = '\0';
    students[numStudents].name = name;
    //name has been recorded

    currentChar = i1;
    while(line[currentChar] == ' '){
      currentChar++;
    }
    char idArray[9];
    strncpy(idArray, line+currentChar, 9);
    idArray[9] = '\0';
    char *ptr;
    
    int realID = strtol(idArray, &ptr, 10);
    students[numStudents].id = realID; 
    
    currentChar+=9;
    i1 = 0;

    while(line[currentChar] == ' '){
      currentChar++;
    }

    char midterm[4];
    strncpy(midterm, line+currentChar, 4);
    midterm[3] = '\0';
    char *ptr2;

    int realMidterm = strtol(midterm, &ptr2, 10);
    students[numStudents].midterm = realMidterm;
    currentChar+= 4;
    
    while(line[currentChar] == ' '){
      currentChar++;
    }

    char final[4];
    strncpy(final, line+currentChar, 4);
    final[3] = '\0';
    char *ptr3;

    int realFinal = strtol(final, &ptr3, 10);
    students[numStudents].final = realFinal;

    currentChar += 4;
    

    while(line[currentChar] == ' '){
      currentChar++;
    }
    int i2;

    for(i2 = 0; i2 < numAssignments; i2++){
      char temp[4];
      strncpy(temp, line+currentChar, 4);
      temp[3] = '\0';
      char *temptr;

      int grade = strtol(temp, &temptr, 10);
      students[numStudents].assignments[i2] = grade;
      currentChar++;
      while(line[currentChar] == ' '){
	currentChar++;
      }
    }


    //double finalCalculator(int midterm, int final, int *assignments, int numA){
      
    students[numStudents].classGrade = finalCalculator(students[numStudents].midterm, students[numStudents].final, students[numStudents].assignments, numAssignments);
    

    
  

    











    
    printf("\n%d\n",students[numStudents].assignments[3]);

    
    
			
    
    numStudents++;
  }
  
  
  
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
    
