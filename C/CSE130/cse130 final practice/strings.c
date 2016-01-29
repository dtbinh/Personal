/*
 * ===========================================================================
 *
 *       Filename:  strings.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/05/2011 11:51:28 AM
 *
 *    Description:  String operations.
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<string.h>
#include	<stdlib.h>
#include	<stdio.h>

#define MAX_STR_LEN 100

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    char str1[MAX_STR_LEN] = "hillo";
    char str2[MAX_STR_LEN] = "world";
    char str3[MAX_STR_LEN];
    char *p;

    printf("Length of '%s': %d\n", str1, strlen(str1));
    strcpy(str3, str1);     // copy 'hello'
    strcat(str3, " ");      // append blank
    strcat(str3, str2);     // append 'world' 
    printf("Length of '%s': %d\n", str3, strlen(str3));
    p = strchr(str3, 'i');  // search for 'i'
    *p = 'e';               // fix the typo
    printf("Length of '%s': %d\n", str3, strlen(str3));

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
