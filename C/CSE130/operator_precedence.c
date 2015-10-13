/*
 * ===========================================================================
 *
 *       Filename:  operator_precedence.c
 *         Author:  Ming Chen, mchen@cs.stonybrook.edu
 *        Created:  10/18/2011 04:08:09 PM
 *
 *    Description:  This program domonstrate operator precedences
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
    int a;
    int b;

    printf("\n----- '*' and '/' have high precedence than '+' and '-': \n");
    printf("2 + 2 * 2 = %d\n", 2 + 2 * 2);
    printf("1 + 4 / 2 = %d\n", 1 + 4 / 2);
    printf("\n----- However, parenthesis can change precedence: \n");
    printf("(2 + 2) * 2 = %d\n", (2 + 2) * 2);
    printf("(1 + 4) / 2 = %d\n", (1 + 4) / 2);

    printf("\n----- '++i' VS. 'i++', and their precedences over '/': \n");
    a = 2; b = 5;
    printf("Let a = %d, b = %d\n", a, b); 
    printf("b++ / a = %d\n", b++ / a); 
    printf("++b / a = %d\n", ++b / a); 
    printf("After that, we have a = %d, b = %d\n", a, b); 

    printf("\n----- Unary '-' has high precedence: \n");
    a = 2; b = 5;
    printf("Let a = %d, b = %d\n", a, b); 
    printf("a - -b / 2 = %d\n", a - -b / 2);
    printf("a - (-b) / 2 = %d\n", a - (-b) / 2);
    printf("a + -b / 2 = %d\n", a + -b / 2);
    

    printf("\n----- '=' has low precedence: \n");
    a = 2; b = 5;
    printf("Let a = %d, b = %d\n", a, b); 
    printf("The value of 'a = b + 1' is %d\n", a = b + 1);
    printf("Thereafter, a = %d\n", a);
    printf("The value of '(a = b) + 1' is %d\n", (a = b) + 1);
    printf("Thereafter, a = %d\n", a);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
