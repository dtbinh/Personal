/**
 *Ronald Balchand
 *109806273
 *Assignment #5
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

public class TreeNode{
    private String name;
    private String selection;
    private String message;
    private TreeNode left;
    private TreeNode middle;
    private TreeNode right;

    /**
     *Default constructor for the TreeNode Class
     */
    public TreeNode(){
	this.name = "";
	this.selection = "";
	this.message = "";
	this.left = null;
	this.middle = null;
	this.right = null;
    }
    
    
    /**
     *Ovrerridden Constructor for the TreeNode class
     *@param _name the name of the TreeNode being constructed
     *@param _selection the selction of the TreeNode being constructed
     *@param _message the message of the TreeNode being constructed 
     *@param _left the TreeNode left of the TreeNode being constructed
     *@param _middle the TreeNode center forward of the TreeNode being constructed
     *@param _right the TreeNode right of the TreeNode being constructed
     */
    public TreeNode(String _name, String _selection, String _message, TreeNode _left, TreeNode _middle, TreeNode _right){
	this.name = _name;
	this.selection = _selection;
	this.message = _message;
	this.left = _left;
	this.middle = _middle;
	this.right = _right;
    }

    /**
     *get method for the name of the TreeNode
     *@return String the name of the TreeNode
     */
    public String getName(){
	return this.name;
    }

    /**
     *get method for the Selection of the TreeNode
     *@return String the selection of the TreeNode
     */
    public String getSelection(){
	return this.selection;
    }

    /**
     *get method for the message of the TreeNode
     *@return String the message of the TreeNode
     */
    public String getMessage(){
	return this.message;
    }
    /**
     *get method for the left TreeNode
     *@return TreeNode the left TreeNode
     */
    public TreeNode getLeft(){
	return this.left;
    }
    /**
     *get method for the middle TreeNode
     *@return TreeNode the middle TreeNode
     */
    public TreeNode getMiddle(){
	return this.middle;
    }
    /**
     *get method for the right TreeNode
     *@return TreeNode the right TreeNode
     */
    public TreeNode getRight(){
	return this.right;
    }

    /**
     *set method for the name of the TreeNode
     *@param a the new name of the TreeNode
     */
    public void setName(String a){
	this.name = a;
    }

    /**
     *set method for the selection of the TreeNode
     *@param a the new selection of the TreeNode
     */
    public void setSelection(String a){
	this.selection = a;
    }
    /**
     *set method for the message of the TreeNode
     *@param a the new message of the TreeNode
     */
    public void setMessage(String a){
	this.message = a;
    }

    /**
     *set method for the left TreeNode
     *@param a the new TreeNode to be left of the current one
     */
    public void setLeft(TreeNode a){
	this.left = a;
    }

    /**
     *set method for the right TreeNode
     *@param a the new TreeNode to be right of the current one
     */
    public void setRight(TreeNode a){
	this.right = a;
    }

    /**
     *set method for the middle TreeNode
     *@param a the new Treenode to be the new middle
     */
    public void setMiddle(TreeNode a){
	this.middle = a;
    }
    
    /**
     *function to figure out whether a TreeNode is Leaf or not
     *@return boolean true if TreeNode is a Leaf or not
     */
    public boolean isLeaf(){
	TreeNode a = this.getLeft();
	TreeNode b = this.getRight();
	TreeNode c = this.getMiddle();
	if((a == null) && (b == null) && (c == null)){
	    return true;
	}
	else{
	    return false;
	}
    }
    
	    
}
