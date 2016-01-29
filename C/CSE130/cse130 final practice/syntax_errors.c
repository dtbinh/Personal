// gradeBook.c
// CSE 130 Fall 2011, Homework 6, Main Program, Last Modified December 5, 2011
// G. C.

// This program asks the user to enter the name of a text file that
// contains grades for every student in a course.  The program then
// arranges the student's records in alphabetical order by last name
// and calculates each student's grade with the following weights:
// HW 40%, Midterm 30%, Final 30%.  The grades are then printed out
// in a neat tabular format.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_CLASS_SIZE 200

#define MAX_NAME 25

typedef struct student
{
    char firstName[MAX_NAME]; // First name of student
    char lastName[MAX_NAME];  // Last name of student
    char fullName[2.0*MAX_NAME + 1];  // Name of student
    int id;             // Student ID
    int midterm;        // Midterm grade
    int final;          // Final Exam grade
    int homework[6];    // Grades for up to 6 homework assignments
    double grade;       // Grade for the course
} student_type;

double computeAverage(int midterm, int final, int hw[], int num); // FUNCTION #1
void printClass(student_type class[], int classSize, int num); // FUNCTION #2


// The array of student structures "gClass" is an external global variable
// because the sorting functions in the module "selectionSort" needs access
// to this array to sort it.
student gClass[MAX_CLASS_SIZE]; // Size of the class is capped
                                    // at 200 students

int main (void)
{
    FILE *ifp; // File Declaration

    char fileName[80]; // Name of file requested by the user
    int numOfHomeworks; // Number of homework assignments
    int classSize = 0; // Variable denoting the size of the class:
                       // is increased by 1 every time a student's
                       // record is read
    int hw; // Control variable for the for loop that reads the homework
            // grades from the file

    // Prompt the user to input the filename the data will be read from
    // and store it in the string variable "fileName"
    printf("Enter Input Filename: ");
    scanf("%s", fileName);

    // Prompt the user to enter the number of homework grades, store the
    // user input in the integer variable "numOfHomeworks", and check to
    // make sure it is less than or equal to 6.  If numOfHomeworks > 6,
    // then the program exits.
    printf("Enter Number of Assignment Grades: ");
    scanf("%d", &numOfHomeworks);

    if (numOfHomeworks > 6)
    {
        printf("ERROR: cannot support more than 6 homework grades.  Exiting.\n");
        return 1;
    }

    // Open the file specified by "fileName".  If this is not possible, print an error
    // message and close the file.
    ifp = fopen(fileName, "r");
    if (ifp == NULL)
    {
        printf("ERROR: Cannot access file.  Exiting.\n");
        return 1;
    }

    // Read the information off the file

    // Add loop condition here
    while (1) // File required 1st character to be \n, otherwise
                                // the 1st character of text is cut off. *****
    {   
        // Read the current student's first name and store it in the current
        // student's "firstName" and store the corresponding integer in the
        // variable "c".        
        fscanf(ifp, "%s", gClass[classSize].firstName);

        // If the variable "c" is equal to 0, then the end of the file has been
        // reached.
        if (strlen(gClass[classSize].firstName) == 0)
        {    break;    }

        // Likewise, read the current student's last name and store it in the
        // current student's "lastName".
        fscanf(ifp, "%s", gClass[classSize].lastName);

        // Copy the current student's first name to the current student's
        // "fullName".
        strncpy(gClass[classSize].fullName, gClass[classSize].firstName);

        // Add a space to the current student's "fullName".
        strcat(gClass[classSize].fullName, " ");
        strcat(gClass[classSize].fullName, gClass[classSize].lastName);

        // Read the current student's ID number and store it in the current
        // student's "id".
        fscanf(ifp, "%d", &gClass[classSize].id);

        // Read the current student's midterm grade and store it in the current
        // student's "midterm".
        fscanf(ifp, "%d", &gClass[classSize].midterm);

        // Read the current student's final exam grade and store it in the
        // current student's "final".
        fscanf(ifp, "%d", &gClass[classSize].final);

        // Read the current student's HW grades and store them in the current
        // student's "homework[]".
        for (hw = 0; hw < numOfHomeworks; hw++)
        {    fscanf(ifp, "%d", &gClass[classSize].homework[hw]);    }

        // Calculate the current student's course grade
        gClass[classSize].grade = computeAverage(
                gClass[classSize].midterm, 
                gClass[classSize].final,
                gClass[classSize].homework, numOfHomeworks);

        // Increment the variable "classSize"
        classSize++;
    }
    // Close the file specified by "fname".
    fclose(ifp);

    // Sort the students in alphabetical order by last name.
    sortStudents(gClass, classSize);

    // Print the records.
    printClass(gClass, classSize, numOfHomeworks);

    return 0;  // END OF PROGRAM
}

/**
 * FUNCTION #1
 *
 * computeAverage - This function computes the average grade of each student.
 *                  
 * Parameters: midterm - the student's midterm grade
 *             final - the student's final exam grade
 *             homework[] - the student's homework grades
 *             numOfHomeworks - the number of homework assignments
 *
 * Returns: the final grade of each student
 */
// BEGINNING OF CODE FOR THE FUNCTION
// "computeAverage(int midterm, int final, int homework[], int numOfHomeworks)"
double computeAverage(int midterm, int final, int homework[], int numOfHomeworks)
{
    double hwWeight; // Weight of homework assignments
    int hwTotal = 0; // Running total of the homework grades
    int i; // Loop control variable
    double grade; // the student's grade

    double midtermWeight = midterm * (0.30); // Weight of the midterm
    double finalWeight = final * (0.30); // Weight of the final

    // Compute the total of the homework grades.
    for (i = 0; i < numOfHomeworks; i++)
    {    hwTotal += homework[i];    }

    // Compute the average of the homework grades and then multiply by 0.40 to obtain
    // the "hwWeight"
    hwWeight = (0.40) * (((double)hwTotal) / numOfHomeworks);

    // Compute the final grade by adding "hwWeight", "midtermWeight", and "finalWeight"
    grade = hwWeight + midtermWeight + finalWeight;

    // The maximum possible grade is 100
    if (grade > 100.0)
    {    return 100.0;    }
    else
    {    return grade;    }
}
// END OF FUNCTION "computeAverage(int midterm, int final, int homework[], int numOfHomeworks)"

/**
 * FUNCTION #2
 *
 * printClass - This function prints a table containing all the data for each student in the class.
 *
 * Parameters: class - the class whose data is being printed
 *             classSize - the number of students in the class
 */
// BEGINNING OF CODE FOR THE FUNCTION
// "printClass(student_type class[], int classSize, int numOfHomeworks)"
void printClass(student_type class[], int classSize, int numOfHomeworks)
{
    int i; // Outer loop control variable
    int j; // Inner loop control variable

    // Print the heading
    printf("\n          Name                ID     Exams        Assignments       Grade \n");
    printf("------------------------- --------- ------- ----------------------- ------\n");

    // For each student...
    for (i = 0; i < classSize; i++)
    {
        // ...print the student's full name,...
        printf("%-25s ", class[i].fullName);

        // ...print the student's ID number,...
        printf("%09d ", class[i].id);

        // ...print the student's midterm grade,...
        printf("%3d ", class[i].midterm);

        // ...print the student's final exam grade,...
        printf("%3d ", class[i].final);

        // ...print each of the student's homework grades,...
        for (j = 0; j < 6; j++)
        {
            if (j < numOfHomeworks)
            {    printf("%3d ", class[i].homework[j]);    }
            else
            {    printf("    ");    }
        }

        // ...print the student's grade for the course,...
        printf("%6.2lf ", class[i].grade);

        // ... and print a new line character to go on to the next student.
        printf("\n");
    }
    return;
}
// END OF FUNCTION "printClass(student_type class[], int classSize, int numOfHomeworks)"
