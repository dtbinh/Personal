/**
 *Ronald Balchand
 *#109806273
 *CSE 214 Section 05
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
	    this.tail.setPrevious(newPerformance);
	    this.head.setNext(newPerformance);
	    newPerformance.setPrevious(this.head);
	    newPerformance.setNext(this.tail);
	    if(this.endTime + newPerformance.getDuration() >= 60){
		this.endTime += (newPerformance.getDuration() + 40);
	    }
	    else{
		this.endTime += newPerformance.getDuration();
	    }
	}
	else{
	    this.tail.setPrevious(newPerformance);
	    newPerformance.setPrevious(this.tail.getPrevious());
	    this.tail.getPrevious().setNext(newPerformance);
	    newPerformance.setNext(this.tail);
	    if(this.endTime + newPerformance.getDuration() >= 60){
		this.endTime += (newPerformance.getDuration() + 40);
	    }
	    else{
		this.endTime += newPerformance.getDuration();
	    }
	}
	this.size++;
    }

	    

	
    public void printAll(){
	this.cursor = (this.head.getNext());
	while(cursor != null){
	    System.out.println(this.cursor);
	    this.cursor = (this.cursor.getNext());
	}
    }
    
    /**
     *adds a new Performance after the current node and the current node becomes the newly added node
     /*
     *@param newPerformance the New Performance to add to the Performance List
in the current place
    */
    //    public void addAfterCurrent(PerformanceNode newPerformance){
	


    public static void main(String [] args){
	PerformanceNode a = new PerformanceNode("Hardwell", "Hardwell", 1, 60, 0, null, null);
	PerformanceNode c = new PerformanceNode("Tiesto", "Tiesto", 1, 60, 0, null,null);
	PerformanceList b = new PerformanceList();
	b.addToEnd(a);
	b.addToEnd(c);
	System.out.println(b.getSize());
	//b.printAll();
	System.out.println(b.head.getNext().getNext());
	//System.out.println(b.tail.getPrevious());
	//System.out.println(b.endTime);
    }
}























