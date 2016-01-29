/*
 * ===========================================================================
 *
 *       Filename:  enum.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/05/2011 11:23:25 AM
 *
 *    Description:  Demonstrate the usage of enum
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<stdlib.h>
#include	<stdio.h>

enum POKER_HAND {
    ONE_PAIR = 0,
    TWO_PAIR,
    THREE_OF_A_KIND,
    STRAIGHT,
    FLUSH,
    FULL_HOUSE,
    FOUR_OF_A_KIND,
    STRAIGHT_FLUSH,
    ROYAL_FLUSH,
    FIVE_OF_A_KIND
};

const char *names[] = {
    "One pair",
    "Two pair",
    "Three of a kind",
    "Straight", 
    "Flush", 
    "Full house",
    "Four of a kind",
    "Straight flush",
    "Royal flush",
    "Five of a kind"
};

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  winner
 *  Description:  return the winner between two hands
 * ===========================================================================
 */
    enum POKER_HAND 
winner ( enum POKER_HAND hand1, enum POKER_HAND hand2 )
{
    return hand1 > hand2 ? hand1 : hand2;
}		/* -----  end of function winner  ----- */

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    printf("Winner of '%s' and '%s':\t %s!\n", 
            names[FLUSH], names[FULL_HOUSE], 
            names[winner(FLUSH, FULL_HOUSE)]);

    printf("Winner of '%s' and '%s':\t %s!\n", 
            names[FOUR_OF_A_KIND], names[STRAIGHT_FLUSH], 
            names[winner(FOUR_OF_A_KIND, STRAIGHT_FLUSH)]);
    
    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
