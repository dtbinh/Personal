/*
 * ===========================================================================
 *
 *       Filename:  int_vs_db.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:08:01 PM
 *
 *    Description:  This program demostrates the differences between int and
 *    double. 
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
    int iv;
    double dv; 

    printf("\n----- int to double is compatible: \n");
    iv = 5;
    dv = iv; 
    printf("int: %d\n", iv);
    printf("double: %f\n", dv);

    printf("\n----- int and double are different in precision: \n");
    iv = iv/2;
    dv = dv/2; 
    printf("int: %d\n", iv);
    printf("double: %f\n", dv);

    printf("\n----- double to int convertion loss precision: \n");
    dv = 2.5; 
    iv = dv; 
    printf("int: %d\n", iv);
    printf("double: %f\n", dv);

    printf("\n----- operator precedence: \n");
    printf("2 + 3 / 2 = %d\n", 2 + 3 / 2);
    printf("(2 + 3) / 2 = %d\n", (2 + 3) / 2);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
