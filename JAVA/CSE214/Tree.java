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

public class Tree{
    public TreeNode root;

    /**
     *default constructor for the Tree class
     */
    public Tree(){
	this.root = null;
    }
    /**
     *overridden constructor for the Tree class
     *@param _root the root of the new Tree
     */
    
    public Tree(TreeNode _root){
	this.root = _root;
    }

    /**
     *get method for the root of the current tree
     *@return TreeNode the Root of the Tree
     */
    public TreeNode getRoot(){
	return this.root;
    }

    /**
     *set method for the root of the current tree
     *@param _root the new root for the tree
     */ 
    public void setRoot(TreeNode _root){
	this.root = _root;
    }


    
    /**
     *returns a reference to node if it exists in the tree, null otherwise
     *@return TreeNode the TreeNode found
     *@param name the name of the TreeNode
     */
    public TreeNode findNode(String name){
	TreeNode ans = new TreeNode();
	ans = null;
	if(this.getRoot() == null){
	    ans = null;
	}
	else if(name.equals("root")){
	    ans = this.getRoot();
	}
	else{
	    TreeNode [] array = this.toArray();
	    for(int i = 0; i < array.length; i++){
		if(array[i].getName().equals(name)){
		    ans = array[i];
		}
	    }
	}
	return ans;
    }
       
    /**
     *method that prints all of the nodes in a current tree using pre order traversal
     *@param focusNode the starting node, usually the root
     */	 
    public void printAll(TreeNode focusNode){
	if(focusNode != null){
	    System.out.println(focusNode);
	    this.printAll(focusNode.getLeft());
	    this.printAll(focusNode.getMiddle());
	    this.printAll(focusNode.getRight());
	}
    }

    
    
    /**
     *main toArray method that returns an array ith all of the nodes in the tree in it
     *@return TreeNode[] the array of TreeNodes in the Tree
     */
    public TreeNode[] toArray(){
	TreeNode [] ans = new TreeNode[0];
	if(this.getRoot() == null){
	    ans = null;
	}else{
	    TreeNode focusNode = this.getRoot();
	    TreeNode parentNode = this.getRoot();
	    
	    ans = toArrayHelper(ans, focusNode);
	}
	return ans;
    }

    /**
     *helper method to the toArrayHelper
     *@return TreeNode[] the array with all of the TreeNodes in the current tree
     *@param input the incomplete Treenode Array
     *@param focusNode the current node being focused on
     */ 

    public TreeNode[] toArrayHelper(TreeNode [] input, TreeNode focusNode){
	TreeNode [] ans = input;
	
	if(focusNode == null){
	    return ans;
	}
	if((focusNode != null) && (focusNode.isLeaf() == false)){
	    TreeNode [] temp1 = ans;
	    ans = new TreeNode[ans.length + 1];
	    for(int i1 = 0; i1 < temp1.length; i1++){
		ans[i1] = temp1[i1];
	    }
	    ans[ans.length - 1] = focusNode;
	}
	
	if(focusNode.isLeaf()){
	    TreeNode [] temp = ans;
	    ans = new TreeNode[ans.length + 1];
	    for(int i = 0; i < temp.length; i++){
		ans[i] = temp[i];
	    }
	    ans[ans.length - 1] = focusNode;

	}else{   
	
	    if(focusNode.getLeft() != null){
		ans = toArrayHelper(ans, focusNode.getLeft());
	    }
	    
	    if(focusNode.getMiddle() != null){
		ans = toArrayHelper(ans, focusNode.getMiddle());
	    }
	    if(focusNode.getRight() != null){
		ans = toArrayHelper(ans, focusNode.getRight());
	    }
	}
	    
	    return ans;
    }	
	

    /**
     *reads data from a file and storees in the tree accordingly
     *@param file the name of the file used
     */
    public void readFile(String file){
	BufferedReader br = null;
	try{
	    String sCurrentLine;
	    String filename = "./" + file;
	    br = new BufferedReader(new FileReader(filename));
	    while((sCurrentLine = br.readLine()) != null){
		   String read = sCurrentLine;
		   if(read.equals("root")){
		       TreeNode root = new TreeNode("root", "", "", null, null, null);
		       String rootSelection = br.readLine();
		       String rootMessage = br.readLine();
		       root.setSelection(rootSelection);
		       root.setMessage(rootMessage);
		       this.setRoot(root);
		   }
		   
		   else{
		       String nameNumber = read;
		       String nodeName = nameNumber.substring(0,nameNumber.length() - 1);
		       int numChildren = Integer.parseInt(nameNumber.substring( nameNumber.length() - 1, nameNumber.length()));

		       if(numChildren < 0 || numChildren > 3){
			    System.out.println("File Invalid :P");
			    break;
		       }
			for(int i = 0; i < numChildren; i++){
			    String childName = br.readLine();
			    String childSelection = br.readLine();
			    String childMessage = br.readLine();
			    String newNodeName = nodeName.replaceAll(" ", "");
			    this.addNode(childName, childSelection, childMessage, newNodeName);
			}
		   }
	    }
	}catch (IOException e){
	    System.out.println("Something went wrong");
	}
    }
		
		
		
	    

	
	
    
    /**
     *adds a new node under the node with the given parent label name; returns true of a node is added, false otherwise
     *@param name the name of the node being added
     *@param selection the selection of the node being added
     *@param  message the message of the node being added
     *@param parentName the name of the Parent being added
     *@return boolean, true if the node is added, false if otherwise
     */
    public boolean addNode(String name, String selection, String message, String parentName){
	
	boolean ans = false;
	TreeNode adding = new TreeNode(name, selection, message, null, null, null);
	if(this.getRoot() == null){
	    ans = false;
	}
	else if(this.findNode(parentName) == null){
	    System.out.println("input file is invalid");
	}
	else{
	    TreeNode parent = this.findNode(parentName);
	    String dest = name.substring(name.length() - 1, name.length());
	    if(dest.equals("1")){
		parent.setLeft(adding);
		ans = true;
	    }
	    else if(dest.equals("2")){
		parent.setMiddle(adding);
		ans = true;
	    }
	    else if(dest.equals("3")){
		parent.setRight(adding);
		ans = true;
	    }
	}
	return ans;
    }



    /**
     *initiates ordering service; starting from the root of the tree and prompts users for inputs; choose the branch of the tree that the user is interested in. Print the order and the price when a leaf is reached.
     */
    public void beginSession(){
	boolean chosen = true;
	Scanner scanner = new Scanner(System.in);
	String ans = "";
	System.out.println("Help Session Starting ...");
	TreeNode focusNode = this.getRoot();
	int counter = 0;
	while(focusNode.isLeaf() == false){
	    System.out.println("\n" + focusNode.getMessage());
	    int numItem = 1;
	    if(focusNode.getLeft() != null){
		System.out.println(numItem  + " " +focusNode.getLeft().getSelection());
		numItem += 1;
	    }
	    if(focusNode.getMiddle() != null){
		System.out.println(numItem + " " + focusNode.getMiddle().getSelection());
		numItem += 1;
	    }
	    if(focusNode.getRight() != null){
		System.out.println(numItem + " " + focusNode.getRight().getSelection());
		numItem += 1;
	    }
	    System.out.println("0 Exit Session");
	    int choice = -1;
	    try{
		while(choice < 0 || choice > numItem){
		    
		    System.out.print("Choice: ");
		    choice = scanner.nextInt();
		    if(choice < 0 || choice > numItem){
			System.out.println("Not in range");
		    }
		}
	    }catch(Exception exception){
		System.out.println("Please enter an integer choice: ");
	    }
	

	    if(choice == 0){
		chosen = false;
		System.out.println("\nExiting Session...");
		break;
	    }else{
		counter++;
	    
		if(focusNode.getName() != "root"){
		    ans += focusNode.getSelection() + "mark";
		}
		
		if((choice == 1) && (choice <= numItem)){
		    focusNode = focusNode.getLeft();
		}
		if((choice == 2) && (choice <= numItem)){
		    focusNode = focusNode.getMiddle();
		}
		if((choice == 3) && (choice <= numItem)){
		    focusNode = focusNode.getRight();
		}
	    }
	}
	if(chosen == true){
	    ans += focusNode.getSelection() + "mark";
	    ans += focusNode.getMessage();
	    String [] answers = ans.split("mark");
	    String summary = "The order at " + answers[0] + ": ";
	    String options = "";
	    for(int i = 1; i < answers.length - 1; i++){
		options += answers[i];
		if(i != answers.length - 2){
		    options += ", ";
		}
		if(i == answers.length - 2){
		    options += " ";
		}
	    }
	    options += " has been sent to the kitchen. ";
	    String price = "Total amount would be " + answers[answers.length - 1] + ". ";
	    String finish = summary + options + price;	
	    
	    System.out.println("\n" + finish);    
	}
    }
    /**
     * prints the combination of the whole selection menu; should include item selection, and price
     *@param parentInfo the information about the parent that is used to print from
     */
	
	
    public void printMenu(String parentInfo){
	if(parentInfo == "root"){
	    System.out.println("Menu: ");
	    System.out.printf("Dining" + "%10s" + "Selection" + "%50s" + "Price \n", " ", " ");
	    System.out.println("-----------------------------------------------------------------------------------\n"); 
	}
	TreeNode focusNode = this.findNode(parentInfo);
	if(focusNode.getLeft() != null){
	    String header = focusNode.getLeft().getSelection();
	    String ans = "";
	    printMenuHelper(header, focusNode, focusNode.getLeft(), ans);
	}
	if(focusNode.getMiddle() != null){
	    String header1 = focusNode.getMiddle().getSelection();
	    String ans1 = "";
	    printMenuHelper(header1, focusNode, focusNode.getMiddle(), ans1);
	}
	if(focusNode.getRight() != null){
	    String header2 = focusNode.getRight().getSelection();
	    String ans2 = "";
	    printMenuHelper(header2, focusNode, focusNode.getRight(), ans2);
	}
	System.out.println("\n");
	
    }


    /**
     *The helper method for the print menu method
     *@param header the first node of the location
     *@param parent the parent node to keep track of the node
     *@param current the main search node
     *@param printOut the thing that is being printed out
     */
    public void printMenuHelper(String header, TreeNode parent, TreeNode current, String printOut){
	if(current.isLeaf() == true){
	    String finalSelect = current.getSelection();
	    String price = current.getMessage();
	    System.out.printf("%-16s"+ "%-1s" + "%-1s" +  "%-10s" , header, printOut, ", ", finalSelect);
	    System.out.printf("%35s" + "\n", price);
	}
	
	else{
	    String currentSelect = current.getSelection();
	    if(current.getSelection().equals(header)){
		currentSelect = "";
	    }
	    if(!(currentSelect.equals(""))){
		    printOut += ", " + currentSelect;
		
	    }
	    if(current.getLeft() != null){
		printMenuHelper(header, current, current.getLeft(), printOut);
	    }
	    if(current.getMiddle() != null){
		printMenuHelper(header, current, current.getMiddle(), printOut);
	    }
	    if(current.getRight() != null){
		printMenuHelper(header, current, current.getRight(), printOut);
	    }
	}
    }   
	    
}		      
		      
