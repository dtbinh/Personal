/**
 *Ronald Balchand
 *#109806273
 * Assignment #2
 * CSE 214 Recitation Section 05
 * Recitation TA: Vyassa Baratham
 * Grading TA : Ke Ma
 * @author
 */
import java.util.Scanner;

public class PerformanceScheduler{



    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	PerformanceList list = new PerformanceList();
	while(1 == 1){
	    System.out.println("MAIN MENU");
	    System.out.println("---------");
	    System.out.println("A) Add to end");
	    System.out.println("B) Move current node backward");
	    System.out.println("C) Display current node");
	    System.out.println("D) Display all nodes");
	    System.out.println("F) Move current node forward");
	    System.out.println("I) Insert after current node");
	    System.out.println("J) Jump to position");
	    System.out.println("R) Remove current node");
	    System.out.println("Q) Exit\n\n");
	    System.out.print("Choose an operation: ");
	    String input = scanner.next();
	    if(input.equals("Q")||input.equals("q")){
		System.out.println("Program terminating normally...");
		break;
	    }

	    if(input.equals(
	}
    }
	
}
