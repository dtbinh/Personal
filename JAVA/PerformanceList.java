/**
 *Ronald Balchand
 *#109806273
 * Assignment #2
 * CSE 214 Recitation Section 05
 * Recitation TA: Vyassa Baratham
 * Grading TA : Ke Ma
 * @author
 */

public class PerformanceList{
    private PerformanceNode head;
    private PerformanceNode tail;
    private PerformanceNode cursor;
    private int endTime;
    private int size;
    
    /**
     *default constructor for the PerformanceList
     */
    public PerformanceList(){
	this.head = new PerformanceNode();
        this.head.setPrevious(null);
	this.head.setNext(this.tail);
	this.tail = new PerformanceNode();
	this.tail.setNext(null);
	this.tail.setPrevious(this.head);
	this.cursor = new PerformanceNode();
	this.cursor.setNext(null);
	this.cursor.setPrevious(null);
	this.endTime = 0;
	this.size = 0;
    }

    /**
     *Constructor with parameters to construct a new Performance List
     *@param _head The new header for the Performance Listy
     *@param _tail the new Tail for the new Perfromance List
     *@param _cursor the new Cursor for the new Performance List
     *@param _endTime the new endTime for the new PerformanceList
     *@param _size The amount of Performances there are
     */ 

    public PerformanceList(PerformanceNode _head, PerformanceNode _tail, PerformanceNode _cursor, int _endTime, int _size){
	this.head = _head;
	this.tail = _tail;
	this.cursor = _cursor;
	this.endTime = _endTime;
	this.size = _size;
    }

    public int getSize(){
	return this.size;
    }

    /**
     * adds a new performance to the end of the Performance List
     *@param newPerformance the new Performance to add to the end of the Performance List
     */
    public void addToEnd(PerformanceNode newPerformance){
	if(this.head.getNext() == null){
	    this.head.setNext(newPerformance);
	    this.tail.setPrevious(newPerformance);
	    this.endTime += newPerformance.getDuration();
	    newPerformance.setNext(this.tail);
	   

	    this.cursor.setNext(newPerformance);
	    this.cursor.setPrevious(this.head);
	}
	else{
	    this.tail.getPrevious().setNext(newPerformance);
	    newPerformance.setPrevious(this.tail.getPrevious());
	    this.tail.setPrevious(newPerformance);
	    newPerformance.setNext(this.tail);
	    newPerformance.setTime(newPerformance.getPrevious().getTime() + newPerformance.getPrevious().getDuration());
	    this.endTime += newPerformance.getDuration();
	    
	    this.cursor.setNext(newPerformance);
	    this.cursor.setPrevious(newPerformance.getPrevious());
	}

	this.size++;
    }


    /**
     *Returns a neatly formatted table of all information for all the scheduled performances.
     */    
    public String toString(){
	String ans = "";
	if(this.size > 0){
	    
	    String header = "%1$11s%2$-30s%3$-20s%4$-5s%5$-5s%6$-10s\n";
	    ans += (String.format(header,"Current No. ","Performance Name","Lead Performer Name"," Participants "," Duration "," Start Time ")) + "\n";
	    ans += ("-----------------------------------------------------------------------------------------------------------") + "\n";	
	    
	    PerformanceNode temp = new PerformanceNode();
	    temp = (this.head.getNext());
	    int i = 1;
	    while(temp.getNext() != null){
		ans += ("         " + i + " ");
		ans += ( " " + temp + "\n");
		temp = (temp.getNext());
		i++;
	    }
	}
	    
	if(this.size == 0){
	    ans = "Current Node is Null and Performance List is Empty";
	}
	return ans;
    }
    
    /**
     *adds a new Performance after the current node and the current node becomes the newly added node
     *@param newPerformance the New Performance to add to the Performance List
in the current place
    */
    public void addAfterCurrent(PerformanceNode newPerformance){
	if(this.cursor.getNext().getNext() == this.tail){
	    this.addToEnd(newPerformance);
	}
	if(this.cursor.getNext() == this.head){
	    this.addToEnd(newPerformance);
	}
	else{
	    newPerformance.setNext(this.cursor.getNext().getNext());
	    this.cursor.getNext().getNext().setPrevious(newPerformance);
	    newPerformance.setPrevious(this.cursor.getNext());
	    this.cursor.getNext().setNext(newPerformance);

	    //Reset Times
	    this.resetTime();
	}
	this.size++;
    }


    /**
     * Goes through the list and sets the start times correclty to be used by other methods
     */
    public void resetTime(){
	PerformanceNode temp = new PerformanceNode();
	temp.setNext(this.head.getNext().getNext());
	temp.setPrevious(this.head.getNext());
	while(temp.getNext().getNext() != null){
	    temp.getNext().setTime(temp.getPrevious().getTime() + temp.getPrevious().getDuration());
	    temp.setPrevious(temp.getNext());
	    temp.setNext(temp.getNext().getNext());
	}
    }
	    
    /**
     *Moves the reference of the current node backwards in the list by one position if a node exists before the current one and returns true. If there is no previous node, the current node should remain the same and return false.
     *@return whether true or false whether there is a previous Node and ther cursor was moved
     *@throws NullPointerException whether there is a cursor or not
     */
    public boolean moveCursorBackward() throws NullPointerException{
	if (this.cursor.getNext() == null){
	    throw new NullPointerException("There is no Cursor");
	}

	boolean ans = true;
	
	if(this.cursor.getPrevious() == this.head){
	    ans = false;
	    return ans;
	}
	else{
	    this.cursor.setNext(this.cursor.getPrevious());
	    this.cursor.setPrevious(this.cursor.getPrevious().getPrevious());
	    return ans;
	}
    }

    /**
     *Moves the reference of the current node forward in the list by one position if a node exists after the current one and returns true. If there is no next node, the current node should remain the same and return false. 
     *@return whether true or false whether there is a previous Node and ther cursor was moved
     *@throws NullPointerException whether there is a cursor or not

     */
    public boolean moveCursorForward() throws NullPointerException{
	if(this.cursor.getNext() == null){
	    throw new NullPointerException("There is no Cursor");
	}
	boolean ans = true;
	if(this.cursor.getNext().getNext() == this.tail){
	    ans = false;
	    return ans;
	}
	else{	
	    this.cursor.setPrevious(this.cursor.getNext());
	    this.cursor.setNext(this.cursor.getNext().getNext());
	    return ans;
	}
    }

    public void displayCurrentPerformance(){
	System.out.println(this.cursor.getNext());
    }

    /**
     *Moves the current node to the given position in the PerformanceList. If the given position doesn't exist in the list, leave the current node where it was and return false. Otherwise, set the current node to the correct position and return true.  
     *@param a The Performance you want to jump to
     *@return Returns true if there is a Performance at the position you wanted to jump to
     */
    public boolean jumpToPosition(int a){
	boolean ans = true;
	if(a > this.size){
	    ans = false;
	    return false;
	}
	else{
	    int i = 0;
	    this.cursor.setNext(this.head);
	    while(i != a){
		this.cursor.setNext(this.cursor.getNext().getNext());
		this.cursor.setPrevious(this.cursor.getNext().getPrevious());
		i++;
	    }
	    return ans;
	}
    }

    /**
     *Removes the current node, if it exists. The current node should now be the node after the one that was just removed. If there is no node after the one that was just removed, the current node should now be the node before the one that was just removed. If the node removed was the only one in the PerformanceList, the current node should now be null.  
     *@return indication as to whether any node was removed or not.
     */
    public boolean removeCurrentNode(){
	boolean ans = true;
	if(this.size == 0){
	    ans = false;
	    return ans;
	}

	if(this.size == 1){
	    this.head.setNext(null);
	    this.cursor.setPrevious(null);
	    this.cursor.setNext(this.head);
	    this.size--;
	    return ans;
	}
	
	if(this.cursor.getPrevious() == null){
	    this.head.setNext(this.cursor.getNext().getNext());
	    this.cursor.getNext().getNext().setPrevious(this.head);
	    this.cursor.setNext(this.head.getNext());
	    this.resetTime();
	    this.size--;
	    return ans;
	}

	if(this.cursor.getNext().getNext() == this.tail){
	    this.tail.setPrevious(this.cursor.getPrevious());
	    this.cursor.setNext(this.cursor.getPrevious());
	    this.cursor.getPrevious().setNext(this.tail);
	    this.cursor.setPrevious(this.cursor.getPrevious().getPrevious());
	    this.resetTime();
	    this.size--;
	    return ans;
	}
	else{
	    this.cursor.getPrevious().setNext(this.cursor.getNext().getNext());
	    this.cursor.getNext().getNext().setPrevious(this.cursor.getPrevious());
	    this.cursor.setNext(this.cursor.getPrevious());
	    this.cursor.setPrevious(this.cursor.getPrevious().getPrevious());
	    this.resetTime();
	    this.size--;
	    return ans;
	}

	
    }
	    
	
	
    

    public static void main(String [] args){
	PerformanceNode a = new PerformanceNode("Hardwell", "Hardwell", 1, 60, 0, null, null);
	PerformanceNode c = new PerformanceNode("Tiesto", "Tiesto", 1, 60, 0, null,null);
	PerformanceNode b = new PerformanceNode("Dimitri Vegas and Like Mike","Like Mike", 2, 60,0,null,null);
	PerformanceNode f = new PerformanceNode("Nicky Romero", "Nicky Romero", 1, 30, 0, null, null);
	PerformanceList h = new PerformanceList();
	h.addToEnd(a);
	System.out.println("\n\n");
	h.addToEnd(c);
      	h.addToEnd(b);
	PerformanceNode d = new PerformanceNode("Avicii", "Avicii", 1, 45, 0, null, null);
	PerformanceList g = new PerformanceList();
	//g.addToEnd(d);
	//System.out.println(g.moveCursorBackward());
	System.out.println(h);
	h.jumpToPosition(2);
	h.addAfterCurrent(d);
	System.out.println(h);
	h.removeCurrentNode();
	System.out.println(h);
	h.moveCursorForward();
	h.removeCurrentNode();
	System.out.println(h);
	h.jumpToPosition(1);
	h.addAfterCurrent(c);
	System.out.println(h);
	h.removeCurrentNode();
	System.out.println(h);
	h.moveCursorForward();
	h.removeCurrentNode();
	System.out.println(h);
	h.displayCurrentPerformance();
	//h.removeCurrentNode();
	System.out.println(h.size);
	h.removeCurrentNode();
	System.out.println(h.size);
	System.out.println(h);
	h.addAfterCurrent(a);
	System.out.println(h);
    }
    
}























