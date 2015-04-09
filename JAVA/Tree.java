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
			    System.out.println(this.addNode(childName, childSelection, childMessage, newNodeName));
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
	else{
	    TreeNode parent = this.findNode(parentName);
	    if(parent == null) {
		System.out.println("this bne he problem");
	    }
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
     * prints the combination of the whole selection menu; should include item selection, and price
     *@param parentInfo the information about the parent that is used to print from
     */
    /* public void printMenu(String parentInfo){
       if(parentInfo == "root"){
       System.out.println("Menu: ");
	    System.out.printf("Dining" + "%10s" + "Selection" + "%50s" + "Price \n", " ", " ");
	    System.out.println("-----------------------------------------------------------------------------------\n");
	}

	TreeNode focusNode = new TreeNode();
	focusNode = this.findNode(parentInfo);
	if(focusNode != null){
	    if(focusNode.isLeaf()){
		System.out.printf("%-s" + "\n", focusNode.getMessage());
	    }else{
		if(focusNode//
		
    
		}*/


    








    
    public static void main(String [] args){
	Tree a = new Tree();
	/*TreeNode root = new TreeNode("root","0", "root", null, null, null);
	a.setRoot(root);
	TreeNode left = new TreeNode("left", "1", "left", null, null, null);
	TreeNode middle = new TreeNode("middle", "2", "middle", null, null, null);
	TreeNode right = new TreeNode("right", "3", "right", null, null, null);
	TreeNode leftleft = new TreeNode("left2", "4", "left", null, null, null);
	left.setLeft(leftleft);
	root.setLeft(left);
	root.setRight(right);
	root.setMiddle(middle);
	
	//	System.out.println(a.findNode("left").getName());
	TreeNode treeRoot = a.getRoot();
	//	System.out.println(a.findNode("right"));
	//a.printAll(treeRoot);
	//	a.setRoot(left);
	//	TreeNode[] array = new TreeNode[0];
	TreeNode[] array2 = a.toArray();
	for(int i = 0; i < array2.length; i++){
	    System.out.println(array2[i] + " ");
	}
	System.out.println("\n\n\n" + a.findNode("middle4"));
	//TreeNode middlemiddle = new TreeNode("middle", "5", "middle", null, null, null);
	System.out.println(a.addNode("middle2", "sdvcdsvc2", "middle2", "middle"));
	a.printAll(root);

	//a.printMenu("root");
	*/
	a.readFile("sample.txt");
	TreeNode band = a.getRoot();
	a.printAll(band);
	//	String a1 = "root 3";
	//String a2 = a1.substring(0, a1.length() - 2);
	//System.out.println(a2);
	//System.out.println(Integer.parseInt(a1.substring(a1.length() - 1)));
    }
	    
    
}
