/*
 * ===========================================================================
 *
 *       Filename:  function_call.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/02/2011 04:05:54 PM
 *
 *    Description:  Demo differences between call-by-value and call-by-reference
 *
 *       Revision:  none
 *
 * ===========================================================================
 */


#include	<stdlib.h>
#include	<stdio.h>


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  func_value
 *  Description:  call by value
 * ===========================================================================
 */
    void
func_value ( int a )
{
    ++a;
}		/* -----  end of function func_value  ----- */


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  func_ref
 *  Description:  call by reference
 * ===========================================================================
 */
    void
func_ref ( int *pa )
{
    ++*pa;
}		/* -----  end of function func_ref  ----- */


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  func_array
 *  Description:  call by array
 * ===========================================================================
 */
    void
func_array ( int a[] )
{
    ++a[0];
}		/* -----  end of function func_array  ----- */

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    int a, b;
    int array[2];

    a = b = 1;
    array[0] = 1;

    printf("before call by value: a = %d\n", a);
    func_value(a);
    printf("after call by value: a = %d\n", a);
    printf("----------------------------------------------\n\n");

    printf("before call by reference: b = %d\n", b);
    func_ref(&b);
    printf("after call by reference: b = %d\n", b);
    printf("----------------------------------------------\n\n");

    printf("before call by array: array[0] = %d\n", array[0]);
    func_array(array);
    printf("after call by array: array[0] = %d\n", array[0]);
    printf("----------------------------------------------\n\n");


    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
