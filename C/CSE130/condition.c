/*
 * ===========================================================================
 *
 *       Filename:  condition.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:46:06 PM
 *
 *    Description:  This program demonstrates conditional statments and while
 *    loop. 
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
    int a = 1; 
    int b = 2; 

    while (a < 4) {
        if (a < b) {
            printf("\n----- a=%d is smaller than b=%d.\n", a, b);
        } else if (a == b) {
            printf("\n----- a=%d is the same as b=%d.\n", a, b);
        } else {
            printf("\n----- a=%d is larger than b=%d.\n", a, b);
        }
        ++a;
    }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
