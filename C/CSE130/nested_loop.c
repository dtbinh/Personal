/*
 * ===========================================================================
 *
 *       Filename:  nested_loop.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:53:58 PM
 *
 *    Description:  This program demostrates nested loop. 
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<stdlib.h>
#include	<stdio.h>

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  
 * =====================================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    int a = 9;
    int i, j;

    printf("\n----- triangle numbers:\n");
    for (i = 1; i <= a; ++i) {
        for (j = 1; j <= i; ++j) {
            printf("%d\t", j);
        }
        printf("\n");
    }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
