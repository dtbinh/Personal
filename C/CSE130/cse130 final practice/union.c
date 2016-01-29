/*
 * ===========================================================================
 *
 *       Filename:  union.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/05/2011 11:40:21 AM
 *
 *    Description:  Union example
 *
 *       Revision:  none
 *
 * ===========================================================================
 */


#include	<stdlib.h>
#include	<stdio.h>

union Grade {
    char Letter;
    double GPA; 
};

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    union Grade grade;
    printf("sizeof(union Grade): %d\n", sizeof(union Grade));

    printf("sizeof(grade.Letter): %d\n", sizeof(grade.Letter));
    printf("sizeof(grade.GPA): %d\n", sizeof(grade.GPA));

    grade.Letter = 'A';
    printf("My grade letter: %c\n", grade.Letter);
    grade.GPA = 3.9;
    printf("My GPA: %.2lf\n", grade.GPA);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
