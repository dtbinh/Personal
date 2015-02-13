/**
 *Ronald Balchand
 *109806273
 *Homework Assignment # 1
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */

import java.util.Scanner;

public class CollectionManager{

    private static final String HEADER  = "# " + " Name" + String.format("%-18s","") + "Manufacturer" + "\t" + "Year" + "\t" + "Price"+"\t" + "Size\n";

    /**
     *main console add method that takes all of the inputs from user input and adds them to a collection
     *@param A One of the Colletions you can add to
     *@param B One of the Colections you can add to
     */
    public static  void consoleAdd(CardCollection A, CardCollection B){
	Scanner scanner1 = new Scanner(System.in);
	System.out.print("Enter the collection you wish to add to: ");
	String collection1 = scanner1.next();
	System.out.print("Enter the Name:");
	String name = scanner1.next() + " " + scanner1.next();
	System.out.print("Enter the Manufacturer:");
	String manufacturer = scanner1.next();
	System.out.print("Enter the Year:");
	int year = scanner1.nextInt();
	System.out.print("Enter the Size:");
	int [] size = {scanner1.nextInt(), scanner1.nextInt()};
	System.out.print("Enter the Price:");
	double price = scanner1.nextDouble();
	System.out.print("Enter the Position: ");
	int position = scanner1.nextInt();
	BaseballCard newCard = new BaseballCard(name, manufacturer, year, price, size);
	if(collection1.equals("A")){
	    A.addCard(newCard, position);
	}
	else{
	    B.addCard(newCard, position);
	}
	System.out.println();
	System.out.println("Added " + name + ", " + manufacturer + " " + year + ", " + size[0] + "x" + size[1] + ", $" + price + " at position " + position + " of collection " + collection1 + "\n");
    }
    
    
    /**
     *Helper method to get the desired card from the desired collection
     *@param A One of the possible Collections
     *@param B One of the possible Collections
     */
    public static void consoleGet(CardCollection A, CardCollection B){
	Scanner scanner2 = new Scanner(System.in);
	System.out.print("Enter the collection you want to get the card from:");
	String collection1 = scanner2.next();
	System.out.print("Enter the position of the card to want to get:");
	int position = scanner2.nextInt();
	if(collection1.equals("A")){
	    BaseballCard temp = A.getCard(position);
	    System.out.println(HEADER + position + "  " + temp.getName() + String.format("%-18s","") + temp.getManufacturer() + "\t" + temp.getYear() + "\t" + temp.getPrice() +"\t" + temp.getsizeX() + "x" + temp.getsizeY() + "\n");
	}
	else{
	    BaseballCard temp = B.getCard(position);
	    System.out.println(HEADER + position + "  " + temp.getName() + String.format("%-18s","") + temp.getManufacturer() + "\t" + temp.getYear() + "\t" + temp.getPrice() +"\t" + temp.getsizeX() + "x" + temp.getsizeY() + "\n");
	}
			   
    }


    /**
     * Copies a specific card from one Collection to the end of another
     *@param a - The fist Card Collection
     *@param b - The Card Collection you are copying to
     *@param pos The Place your getting the Card copied from
     *@param result The desired Collectionyou are copying from
     */ 

    public static void copy(CardCollection a, CardCollection b, int pos, String result){
	Scanner scanner4 = new Scanner(System.in);
	int[] size1 = {a.getCard(pos).getsizeX(), a.getCard(pos).getsizeY()};
	BaseballCard temp = new BaseballCard(a.getCard(pos).getName(), a.getCard(pos).getName(), a.getCard(pos).getYear(), a.getCard(pos).getPrice(), size1);
	b.addCard(temp);
	System.out.println("copied " + temp.getName() + ", " + temp.getManufacturer() + " " + temp.getYear() + ", " + temp.getsizeX() + "x" + temp.getsizeY() + ", $" + temp.getPrice() + " into position " + pos + " of collection " + result + "\n");
    }
  




    
    public static void main(String [] args){
	System.out.print("Main menu: \n\n");
	System.out.print("A) Add Card\nC) Copy\nE) Update price\nG) Get Card\nL) Locate Card\nN) Update name\nP) Print All Cards\nR) Remove Card\nS) Size\nT) Trade\nV) Value of collections\nQ) Quit\n\n");
	CardCollection A = new CardCollection();
	CardCollection B = new CardCollection();
	while(1==1){
	    System.out.print("Choose an operation:");
	    Scanner scanner = new Scanner(System.in);
	    String input = scanner.next();
	    System.out.println();
	    if(input.equals("A") || input.equals("a")){
		consoleAdd(A,B);
	    }
	    else if(input.equals("G") || input.equals("g")){
		consoleGet(A,B);
	    }
	    else if(input.equals("Q") || input.equals("q")){
		System.out.println("Program ending...");
		break;
	    }
	    
	    else if(input.equals("P") || input.equals("p")){
		System.out.println("Collection A: \n\n" + HEADER);
		A.printAllCards();
		System.out.println("\n" + "Collection B: \n\n" + HEADER);
		B.printAllCards();
	    }

	    else if(input.equals("S") || input.equals("s")){
		System.out.println("Collection A has " + A.size() + " cards. Collection B has " + B.size() + " cards.");
	    }

	    else if(input.equals("C") || input.equals("c")){
		System.out.print("Enter the collection to copy from: ");
		String c3 = scanner.next();
		System.out.print("Enter the position of the card to copy: ");
		int copyPos = scanner.nextInt();
		System.out.print("Enter the collection to copy to: ");
		String c4 = scanner.next();
		if((c3.equals("A")) &&(c4.equals("B"))){
		    copy(A,B,copyPos,"B");
		}
		else if((c3.equals("B")) && (c4.equals("A"))){
		    copy(B,A,copyPos, "A");
		}
		else if((c3.equals("A")) && (c4.equals("A"))){
		    copy(A,A,copyPos, "A");
		}
		else{
		    copy(B,B,copyPos, "B");
		}
	    }
	    else if(input.equals("N") || input.equals("n")){
		System.out.print("Enter the Collection: ");
		String c5 = scanner.next();
		System.out.print("Enter the position");
		int pos = scanner.nextInt();
		System.out.print("Enter the new Name");
		String name2 = scanner.next();

		if(c5.equals("A")){
		    A.getCard(pos).setName(name2);
		}
		else{
		    B.getCard(pos).setName(name2);
		}
	    }

	    else if(input.equals("E")){
		System.out.print("Enter the collection: ");
		String c6 = scanner.next();
		System.out.print("Enter the position: ");
		int pos2 = scanner.nextInt();
		System.out.print("Enter the new Price: ");
		double price2 = scanner.nextDouble();

		if(c6.equals("A") || input.equals("a")){
		    A.getCard(pos2).setPrice(price2);
		}
		else{
		    B.getCard(pos2).setPrice(price2);
		}
		System.out.println("Price changed of card " + pos2 + " in collection " + c6 + "to the price of $" + price2);
	    }

	    else if(input.equals("T") || input.equals("t")){
		System.out.println("Enter the position of the card to trade from collection A: ");
		int pos1 = scanner.nextInt();
		System.out.println("Enter the position of the card to trade from collection B:");
		int pos2 = scanner.nextInt();
		A.trade(B,pos1,pos2);
		System.out.println("Cards from Collection A and B from positions " + pos1 + " and " + pos2 + "traded");
	    }

	    else if(input.equals("R") || input.equals("r")){
		System.out.println("Enter the Collection to remove from:");
		String c7 = scanner.next();
		System.out.println("Enter the position to remove: ");
		int pos3 = scanner.nextInt();
		if (c7.equals("A")){
		    A.removeCard(pos3);
		}
		else{
		    B.removeCard(pos3);
		}
	    }

	    else if(input.equals("V") || input.equals("v")){
		double ans1 = 0.0;
		double ans2 = 0.0;
		for(int i = 1; i <= A.size(); i++){
		    ans1 += (A.getCard(i)).getPrice();
		}

		for(int j = 1; j <= B.size(); j++){
		    ans2 += (B.getCard(j)).getPrice();
		}
		System.out.println("The totalvalue of  collection A is $" + ans1 + ". The total value of collection B is $" + ans2);
	    }

	    else if(input.equals("L") || input.equals("l")){
		System.out.print("Enter the name: ");
		String name3 = scanner.next() + " " + scanner.next();
		System.out.print("Enter the manufacturer: ");
		String manu3 = scanner.next();
		System.out.print("Enter the year: ");
		int year2 = scanner.nextInt();
		System.out.print("Enter the size: ");
		int [] size3 = {scanner.nextInt(), scanner.nextInt()};
		System.out.print("Enter the price: ");
		double price3 = scanner.nextInt();
		BaseballCard temp = new BaseballCard(name3, manu3,year2,price3, size3);
		if(A.exists(temp)){
		    System.out.print("The card is in collection A. ");
		}
		else if(!(A.exists(temp))){
		    System.out.print("The card is npot in collection A");
		}
		else if(B.exists(temp)){
		    System.out.print("The card is in collection B");
		}
		else{
		    System.out.print("The card is not in collection B");
		}
	    }
	}
		    
    }
    
}
