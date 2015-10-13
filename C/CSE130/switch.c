/*
 * ===========================================================================
 *
 *       Filename:  switch.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:40:28 PM
 *
 *    Description:  This program demonstrates the swith statment. 
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<stdlib.h>
#include	<stdio.h>

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    int a = 2;

    printf("\n----- The following output is wrong. Why?\n");
    switch(a) {
        case 1:
            printf("a = 1\n");
        case 2:
            printf("a = 2\n");
        case 3:
            printf("a = 3\n");
        default:
            printf("a is not in {1, 2, 3}\n");
    }

    printf("\n----- This is the right output.\n");
    switch(a) {
        case 1:
            printf("a = 1\n");
            break;
        case 2:
            printf("a = 2\n");
            break;
        case 3:
            printf("a = 3\n");
            break;
        default:
            printf("a is not in {1, 2, 3}\n");
    }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
