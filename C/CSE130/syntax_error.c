/*
 * ===========================================================================
 *
 *       Filename:  syntax_error.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:58:51 PM
 *
 *    Description:  This program has two syntax errors. Find them! Moreover, how
 *    to introduce runtime error into this program? 
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
    int a = 10;
    int i, j;

    printf("\n----- primes smaller than %d:\n", a);
    for (i = 2; i < a; ++i) { 
        for (j = 2; j * j <= i; ++j) 
            if ((i % j) == 0) break 
        if (j * j > i) printf("%d\t" i);
    }
    printf("\n");

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
