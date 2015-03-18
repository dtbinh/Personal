/**
 *Ronald Balchand
 *109806273
 *Assignment #4
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */



public class Passenger implements Comparable{

    private int size;
    private String destination;
    private int timeArrived;
    private int timeWaiting;

    /**
     *Default constructor for the Passenger class
     */
    
    public Passenger(){
	this.size = 0;
	this.destination = "";
	this.timeArrived = 0;
	this.timeWaiting = 0;
    }


    /**
     *Overrridden Constructor for the Passenger class
     *@param _size The size of the Passenger. size greater than one indicates a group
     *@param _destination The Destination of the Passenger
     *@param _timeArrived The time the Passenger arrived at the Bus Stop
     *@param _timeWaiting the time the Passenger was waiting
     */

    public Passenger(int _size, String _destination, int _timeArrived, int _timeWaiting){

	this.size = _size;
	this.destination = _destination;
	this.timeArrived = _timeArrived;
	this.timeWaiting = _timeWaiting;
    }

    /**
     *Set method for the size 
     *@param _size The new Size of the Passenger 
     */
    public void setSize(int _size){
	this.size = _size;
    }

    /**
     *Set method for the destination
     *@param _destination The new Destination of the Passenger
     */
    public void setDestination(String _destination){
	this.destination = _destination;
    }

    /**
     *Set method for the timeArrived
     *@param _timeArrived The new timeArrived of the Passenger
     */
    public void setTimeArrived(int _timeArrived){
	this.timeArrived =_timeArrived;
    }

    /**
     *Set method for the timeWaiting
     *@param _timeWaiting The new timeWaiting of the Passenger
     */
    public void setTimeWaiting(int _timeWaiting){
	this.timeWaiting = _timeWaiting;
    }
    
    /**
     *get method for the size of the Passenger
     *@return the Size of the Passenger
     */ 
    public int getSize(){
	return this.size;
    }

    /**
     *get method for the destination for the Passenger
     *@return String the destination for the Passenger
     */
    public String getDestination(){
	return this.destination;
    }

    /**
     *get method for the timeArrived for the Passenger
     *@return int the timeArrived for the Passenger
     */
    public int getTimeArrived(){
	return this.timeArrived;
    }

    public String toString(){
	return this.getDestination();
    }



    public boolean equals(Object object){
	if(object instanceof Passenger &&((((Passenger)object).getSize()) == this.getSize())){
	    return true;
	}
	else{
	    return false;
	}
    }
    
	    
    public int compareTo(Object a){
	int ans = 2;
	if(a instanceof Passenger){
	    Passenger c = (Passenger)a;
	    if(this.equals(c)){
		ans = 0;
	    }
	    else if(this.getSize() > c.getSize()){
		ans = 1;
	    }
	    else{
		ans = -1;
	    }
	}
	return ans;
    }
	

    /**
     *get method for the timeWaiting for the Passenger
     *@return int the timeWaiting for the Passenger
     */
    public int getTimeWaiting(){
	return this.timeWaiting;
    }

}




























