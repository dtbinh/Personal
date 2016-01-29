/*
 * ===========================================================================
 *
 *       Filename:  printf.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/06/2011 01:05:32 PM
 *
 *    Description:  Demonstrate format descriptors for printf and scanf. 
 *
 *       Revision:  none
 *
 * ===========================================================================
 */


#include	<stdio.h>
#include	<stdlib.h>

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
    double d;

    // adjust to right with width being 6
    for (i = 0; i < 10; ++i) {
        printf("%6d|", i);
    }
    printf("\n");

    // adjust to left with width being 6
    for (i = 0; i < 10; ++i) {
        printf("%-6d|", i);
    }
    printf("\n");

    // adjust to right, width is 6, padding with 0, lead by a blank
    for (i = 0; i < 10; ++i) {
        printf("% 06d|", i);
    }
    printf("\n");

    // adjust to right,  width is 6, one decimals
    for (i = 0; i < 10; ++i) {
        printf("% 6.1lf|", (d = i));
    }
    printf("\n");

    // adjust to left,  width is 6, two decimals
    for (i = 0; i < 10; ++i) {
        printf("%-6.2lf|", (d = i));
    }
    printf("\n");
    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
