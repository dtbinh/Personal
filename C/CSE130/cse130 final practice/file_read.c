/*
 * ===========================================================================
 *
 *       Filename:  file_read.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/05/2011 11:03:57 AM
 *
 *    Description:  Read a file until EOF. Sum up all numbers in the file. 
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
    if (argc != 2) {
        fprintf(stderr, "usage: file_read  filename\n");
        return EXIT_FAILURE;
    }

    FILE *fp; 
    int sum = 0; 
    int temp = 0;
    int n = 0;

    if ((fp = fopen(argv[1], "r")) == NULL) {
        fprintf(stderr, "unable to read %s\n", argv[1]);
        return EXIT_FAILURE;
    }

    for (n = 0; fscanf(fp, "%d", &temp) != EOF; ++n) {
        sum += temp;
    }

    printf("The sum of all %d numbers in '%s' is %d.\n", n, argv[1], sum);

    fclose(fp);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
