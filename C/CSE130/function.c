/*
 * ===========================================================================
 *
 *       Filename:  function.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/17/2011 10:28:36 PM
 *
 *    Description:  This program demostrates: 
 *    1, call-by-value feature of function
 *    2, scope of variables
 *
 *       Revision:  none
 *
 * ===========================================================================
 */


#include	<stdlib.h>
#include	<stdio.h>


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  increment
 *  Description:  
 * ===========================================================================
 */
    int
increment ( int foo )
{
    foo += 1;       // foo is changed here, but it will not effect foo in main
    return foo;
}		/* -----  end of function increment  ----- */

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    int foo = 3;
    printf("\n----- foo unchanged when passed into function as argument: \n");
    printf("before function call: foo = %d\n", foo);
    increment(foo);
    printf("after function call: foo = %d\n", foo);

    printf("\n----- foo changed when assigned with function return value: \n");
    printf("before function call: foo = %d\n", foo);
    foo = increment(foo);
    printf("after assigned function return value: foo = %d\n", foo);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
