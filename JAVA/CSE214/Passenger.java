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

    private int amount;
    private String destination;
    private int timeArrived;
    private int timeWaiting;
    final String [] stops = {"South P", "West", "SAC","Chapin","South P", "PathMart", "Walmart", "Target"};
	
    /**
     *Default constructor for the Passenger class
     */
    
    public Passenger(){
	this.amount = 0;
	this.destination = "";
	this.timeArrived = 0;
	this.timeWaiting = 0;
    }


    /**
     *Overrridden Constructor for the Passenger class
     *@param _amount The amount of the Passenger. size greater than one indicates a group
     *@param _destination The Destination of the Passenger
     *@param _timeArrived The time the Passenger arrived at the Bus Stop
     *@param _timeWaiting the time the Passenger was waiting
     */

    public Passenger(int _amount, String _destination, int _timeArrived, int _timeWaiting){

	this.amount = _amount;
	this.destination = _destination;
	this.timeArrived = _timeArrived;
	this.timeWaiting = _timeWaiting;
    }

    /**
     *Set method for the size 
     *@param _amount The new Size of the Passenger 
     */
    public void setAmount(int _amount){
	this.amount = _amount;
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
    public int getAmount(){
	return this.amount;
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

    

    /**
     *gets the number of the stop the Passenger group is Going to in a list of all the stops, including inner and outer
     *@return int the number of the Stop that the Passenger is going to
     */
    public int getNumDest(){
	String stop = this.getDestination();
	int ans = 0;
	for(int i = 0; i < this.stops.length; i++){
	    if(stop == this.stops[i]){
		ans = i;
	    }
	}
	return ans;
    }
    

    /**
     *returns a String indicating whether or not a Passenger is headed towards an outer Loop or Inner Loop Stop
     *@return String Inner or Outer Destination
     */
    public String innerOrOuter(){
	String ans = "";
	int dest = this.getNumDest();
	if(dest <= 3){
	    ans = "Inner";
	}
	else{
	    ans = "Outer";
	}
	return ans;
    }

    /**
     *Overidden toString method 
     *@return String the String form of the Passenger
     */
    public String toString(){
	return "[ " + this.getAmount() + ", " + this.getNumDest() + " (" + this.getDestination() + ") , " + this.getTimeArrived() + "]";
    }


    /**
     *Overridden equals method for Passenger
     *@param object the object that the current Passenger is being compared to  
     *@return boolean true if the object is equal to the current one
     */ 
    public boolean equals(Object object){
	if(object instanceof Passenger &&((((Passenger)object).getAmount()) == this.getAmount()) &&((((Passenger)object).getDestination()) == this.getDestination())){
	    return true;
	}
	else{
	    return false;
	}
    }
    
    /**
     *Overridden compareTo method for the passenger class
     *@param a the object the current Passenger is being compared to
     *@return int the value of the return of the compareTo method
     */	    
    public int compareTo(Object a){
	int ans = 2;
	if(a instanceof Passenger){
	    Passenger c = (Passenger)a;
	    if(this.equals(c)){
		ans = 0;
	    }
	    else if(this.getAmount() > c.getAmount()){
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




























