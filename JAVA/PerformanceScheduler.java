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

	    if(input.equals("A") || input.equals("a")){
		System.out.print("Enter name of Performance: ");
		String name = scanner.nextLine();
		name += scanner.nextLine();
		System.out.print("Enter name of lead performer: ");
		String leader = scanner.nextLine();
		System.out.print("Enter the total participants: ");
		int total = scanner.nextInt();
		System.out.print("Enter the duration of the performance: ");
		int duration = scanner.nextInt();
		PerformanceNode newNode = new PerformanceNode(name, leader, total, duration, 0, null, null);
		list.addToEnd(newNode);
		System.out.println("\nNew performance " + name + " is added to the end of the list. \n" );
	    }

	    if(input.equals("D") ||input.equals("d")){
		System.out.println("Schedule:\n");
		System.out.println(list);
	    }

	    if(input.equals("I") || input.equals("i")){
		System.out.print("Enter name of Performance: ");
		String name = scanner.nextLine();
		name += scanner.nextLine();
		System.out.print("Enter name of lead performer: ");
		String leader = scanner.nextLine();
		System.out.print("Enter the total participants: ");
		int total = scanner.nextInt();
		System.out.print("Enter the duration of the performance: ");
		int duration = scanner.nextInt();
		PerformanceNode newNode = new PerformanceNode(name, leader, total, duration, 0, null, null);
		list.addAfterCurrent(newNode);
		System.out.println("\nNew performance " + name + " is added after the current Performance. \n" );
	    }

	    if(input.equals("B")||input.equals("b")){
		list.moveCursorBackward();
		System.out.println("Cursor has been moved Backwards.");
	    }

	    if(input.equals("C")||input.equals("c")){
		list.displayCurrentPerformance();
	    }
	    if(input.equals("F") || input.equals("f")){
		list.moveCursorForward();
		System.out.println("Cursor has been moved Forwards. ");
	    }
	}	
    }   
	    
	
    
    
}
