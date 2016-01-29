/*
 * ===========================================================================
 *
 *       Filename:  lists.c
 *         Author:  Ming Chen, brianchenming@gmail.com
 *        Created:  12/05/2011 12:08:37 PM
 *
 *    Description:  Linked List. 
 *
 *       Revision:  none
 *
 * ===========================================================================
 */

#include	<stdlib.h>
#include	<stdio.h>

struct List {
    int data;
    struct List *next;
};


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  print_list
 *  Description:  print out the contents of a Linked List
 * ===========================================================================
 */
    void
print_list ( struct List *lp )
{
    printf("List contains: ");
    for (; lp != NULL; lp = lp->next) {
        printf("%d ", lp->data);
    }
    printf("\n");
    
}		/* -----  end of function print_list  ----- */


/* 
 * ===  FUNCTION  ============================================================
 *         Name:  insert_list
 *  Description:  insert a node into a Linked List
 * ===========================================================================
 */
    struct List *
insert_list ( struct List *head, struct List *pnode )
{
    struct List *pcur, *prev;
    prev = NULL;
    for (pcur = head; pcur != NULL && pcur->data < pnode->data; pcur=pcur->next) 
        prev = pcur;
    if (prev == NULL) { 
        pnode->next = head;
        return pnode;
    } else {
        pnode->next = prev->next;
        prev->next = pnode;
        return head;
    }
}		/* -----  end of function insert_list  ----- */

/* 
 * ===  FUNCTION  ============================================================
 *         Name:  main
 *  Description:  
 * ===========================================================================
 */
    int
main ( int argc, char *argv[] )
{ 
    struct List *head;
    struct List l0;
    struct List l1;
    struct List l2;
    struct List l3;
    struct List l4;

    head = &l1;
    l1.data = 1;
    l1.next = &l2;

    l2.data = 2;
    l2.next = NULL;
    printf("At the beginning, ");
    print_list(head);

    // apend list 4
    l4.data = 4;
    l4.next = NULL;
    head = insert_list(head, &l4);
    printf("After inserting 4, ");
    print_list(head);
    
    l3.data = 3;
    l3.next = NULL;
    head = insert_list(head, &l3);
    printf("After inserting 3, ");
    print_list(head);

    l0.data = 0;
    l0.next = NULL;
    head = insert_list(head, &l0);
    printf("After inserting 0, ");
    print_list(head);

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
