/*
 * ===========================================================================
 *
 *       Filename:  struct.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/06/2011 12:26:24 PM
 *
 *    Description:  There are syntax errors in this program. Find them!
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<stdlib.h>
#include	<stdio.h>
#define MAX_NAME 100

struct Student {
    char firstName[MAX_NAME];
    char lastName[MAX_NAME];
    int finalExam;
    int midtermExam;
};

struct Student students[3] = {
    {"Herry", "Porter", 78, 90},
    {"Hermione", "Granger", 100, 100},
    {"Ron", "Weasley", 80, 80}
};


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  print_students
 *  Description:  
 * ===========================================================================
 */
    void
print_students ()
{
    int i;
    printf("\nFIRSTNAME\tLASTNAME\tMIDTERM\tFINAL\n");
    for (i = 0; i < 3; ++i) {
        printf("%-10s\t%-8s\t%7d\t%5d\n", students[i].firstName, 
                students[i].lastName,
                students[i].midtermExam, 
                students[i].finalExam);
    }
}		/* -----  end of function print_students  ----- */

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    int i;
    struct Student bestStu;

    print_students();

    // correct a typo
    students[0].firstName[1] = 'a';
    print_students();
    
    bestStu = students[0];
    for (i = 1; i < 3; ++i) {
        if (students[i].finalExam > bestStu.finalExam) {
            bestStu = students[i];
        }
    }

    printf("Best student: \n");
    printf("%-10s\t%-8s\t%7d\t%5d\n", bestStu.firstName, 
            bestStu.lastName,
            bestStu.midtermExam, 
            bestStu.finalExam);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
