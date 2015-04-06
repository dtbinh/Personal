/**
 *Ronald Balchand
 *109806273
 *Assignment #5
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

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
	ans = this.getRoot();
	if(ans != null){
	    if(ans.getName() == name){
		return ans;x
	    }

	}
	else{
	    ans = null;
	}
	    

	
	
    
    /**
     *adds a new node under the node with the given parent label name; returns true of a node is added, false otherwise
     *@param name the name of the node being added
     *@param selection the selection of the node being added
     *@param  message the message of the node being added
     *@param parentName the name of the Parent being added
     *@return boolean, true if the node is added, fasle if otherwise
     */
    /*
    public boolean addNode(String name, String selection,  String message, String parentName){
	boolean ans = false;
	TreeNode newNode = new TreeNode(name, selection, message, null, null, null);
	if(this.getRoot() == null){
	    this.setRoot(newNode);
	    ans = true;

	}else{
	    TreeNode focusNode = root;
	    
	    //TreeNode parent;

	    while(true){ 
		if(focusNode.getName() == parentName){
		    String as = selection
*/		
		
	    
		
	
    
}
