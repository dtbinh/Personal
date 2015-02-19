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
    }

    /**
     *Constructor with parameters to construct a new Performance List
     *@param _head The new header for the Performance Listy
     *@param _tail the new Tail for the new Perfromance List
     *@param _cursor the new Cursor for the new Performance List
     *@param _endTime the new endTime for the new PerformanceList
     */ 

    public PerformanceList(PerformanceNode _head, PerformanceNode _tail, PerformanceNode _cursor, int _endTime){
	this.head = _head;
	this.tail = _tail;
	this.cursor = _cursor;
	this.endTime = _endTime;
    }

    /**
     * adds a new performance to the end of the Performance List
     *@param newPerformance the new Performance to add to the end of the Performance List
     */
    public void addToEnd(PerformanceNode newPerformance){
	if (endTime == 0){
	    this.head.setNext(newPerformance);
	    this.tail.setPrevious(newPrevious);
	    this.cursor.setNext(newPerformance);
	    this.endTime += newPerformance.getDuration();
	}
	else{
	    newPerformance.setNext(this.tail);
	    this.tail.setPrevious(newPerformance);
	    this.tail.getPrevious.setNext(newPerformance);
	}
    }

    /**
     *adds a new Performance after the current node and the current node becomes the newly added node
     /*
     *@param newPerformance the New Performance to add to the Performance List
in the current place
    */
    public void addAfterCurrent(PerformanceNode newPerformance){
	

























}
