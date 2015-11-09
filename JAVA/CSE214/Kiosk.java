/**
 *Ronald Balchand
 *109806273
 *Assignment #5
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;
import java.io.File;

public class Kiosk{
    /**
     *the default constructor or the Kiosk class
     */
    public Kiosk(){
    }
	


    public static void main(String [] args){
	Tree mainTree = new Tree();
	Scanner scanner = new Scanner(System.in);
	while(1 == 1){
	    String input = "-1";
	    System.out.println("L) Load a Tree");
	    System.out.println("P) Print menu");
	    System.out.println("S) Start service");
	    System.out.println("Q) Quit");
	    while( (!(input.equals("l"))) && (!(input.equals("p"))) && (!(input.equals("s"))) && (!(input.equals("q")))){
		System.out.print("Choice: ");
		String notYet = scanner.nextLine();
		String notYet2 = notYet.toLowerCase();
		if((!(notYet2.equals("l"))) && (!(notYet2.equals("p"))) && (!(notYet2.equals("s"))) && (!(notYet2.equals("q")))){
		    System.out.println("Invalid Input");
		}else{
		    input = notYet2;
		}
	    }

	    if(input.equals("q")){
		System.out.println("\nKiosk Shutting Down....");
		break;
	    }

	    if(input.equals("l")){
		File newFile = new File("./-1");
		String endFileName = "";
		while(newFile.exists() == false){
		    System.out.print("Enter the name of the file: ");
		    String notYetString = scanner.nextLine();
		    String nYSPath = "./" + notYetString;
		    File notYetFile = new File(nYSPath);
		    if(notYetFile.exists() == false){
			System.out.println("That file is not located in the current directory");
		    }else{
			newFile = notYetFile;
			endFileName = notYetString;
		    }
		}
		mainTree.readFile(endFileName);
		System.out.println("\nMenu has been updated!\n");
	    }

	    if(input.equals("s")){
		if(mainTree.getRoot() == null){
		    System.out.println("The Tree has no nodes and it's Root is null. Try loading nodes from a file.\n");
		}else{
		    mainTree.beginSession();
		}
	    }

	    if(input.equals("p")){
		if(mainTree.getRoot() == null){
		    System.out.println("The Tree has no nodes and it's Root is null. Try loading nodes from a file.\n");
		}else{
		    
		    mainTree.printMenu(mainTree.getRoot().getName());
		}
	    }
	}
    }
	    
	
}
