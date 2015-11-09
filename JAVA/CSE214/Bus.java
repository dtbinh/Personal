/**
 *Ronald Balchand
 *109806273
 *Assignment #4
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

public class Bus extends PassengerQueue{
    private int maxSize;
    private String type;
    private String nextStop;
    private int toNextStop;
    private int timeToRest;
    private boolean returning;



    /**
     *Default Constructor
     */
    public Bus(){
	this.maxSize = 0;
	this.type = "";
	this.nextStop = "";
	this.toNextStop = 0;
	this.timeToRest = 0;
	this.returning = false;
    }
    /**
     *Overriden Constructor
     *@param _maxSize the maximum size that the bus can hold
     *@param _type The type of the Bus, Inner or Outer
     *@param _nextStop The nextStop on the Bus
     *@param _toNextStop the time till the next stop on the Bus
     *@param _timeToRest the Time to Rest That he bus cannot be operable during
     *@param _returning the boolean value of whether the Bus is returning to South P or not 
     */
    public Bus(int _maxSize,String _type, String _nextStop, int _toNextStop, int _timeToRest, boolean _returning){

	this.maxSize = _maxSize;
	this.type = _type;
	this.nextStop = _nextStop;
	this.toNextStop = _toNextStop;
	this.timeToRest = _timeToRest;
	this.returning = _returning;
    }

    /**
     *get method for the boolean value returing
     *@return boolean true if returning false if not
     */
    public boolean getReturning(){
	return this.returning;
    }

    /**
     *set method for the returning method
     *@param a the new boolean value for returning
     */
    public void setReturning(boolean a){
	this.returning = a;
    }	


    /**
     *get method for the maximum size
     *@return int the Maximum size of the Bus
     */

    public int getMax(){
	return this.maxSize;
    }

    /**
     *get method for the type of the Bus
     *@return String the type of Bus 
     */
    public String getType(){
	return this.type;
    }

    /**
     *get method for the nextStop for the bus
     *@return String the name of the next stop for the bus
     */
    public String getNextStop(){
	return this.nextStop;
    }

    /**
     *get method for the time till the next Stop for the Bus
     *@return int the time till the Next Stop
     */
    public int getToNextStop(){
	return this.toNextStop;
    }

    /**
     *get method for the time to rest for the Bus
     *@return int the time that the bus has to rest
     */
    public int getTimeToRest(){
	return this.timeToRest;
    }

    /**
     *set method for the maxSize of the BUs
     *@param a the new Max Size for the Bus
     */
    public void setMax(int a){
	this.maxSize = a;
    }

    /**
     *Set method for the type of the Bus
     *@param a the new type of the Bus
     */
    public void setType(String a){
	this.type = a;
    }

    /**
     *Set method for the nextStop for the Bus
     *@param a the new name of the next stop for the Bus
     */
    public void setNextStop(String a){
	this.nextStop = a;
    }

    /**
     *Set method for the time to till the next Bus
     *@param a the new time till the next Stop
     */

    public void setToNextStop(int a){
	this.toNextStop = a;
    }

    /**
     *Set method for the time to rest for the bus
     *@param a the new time for the bus to rest
     */

    public void setTimeToRest(int a){
	this.timeToRest = a;
    }

    public boolean inTransit(){
	int a = this.getToNextStop();
	if (a == 0){
	    return false;
	}
	else{
	    return true;
	}
    }

    /**
     *Single load method for a single Group Passenger onto the bus if it meet the parameters
     *@param a the Passenger to be loaded onto the bus

     */
    public void load(Passenger a){
	if(a.getAmount() + this.getSize() <= this.getMax()){
	    this.enqueue(a);
	}
    }

    /**
     *load method onto the bus
     *@param the Passenger Line loading from
     *@return int[] the Amount of Passengers loaded onto the bus and the amount of time those passengers spent waiting, and then the amount of Groups Served
     */


    public int[] loadEntire(PassengerQueue line){
	int[] ans = {0,0,0};
	String type = this.getType();
	
	if(this.getSize() == this.getMax()){
	    return ans;
	}

	else{
	    int total = line.getSize();
	    Passenger [] linePassengers = new Passenger[line.size()];
	    int i = 0;
	    int amountAdded = 0;
	    while(line.getSize() > 0 && (i < total)){
		Passenger temp = (Passenger)line.dequeue();
		
		String s = temp.innerOrOuter();
		String s2 = temp.getDestination();
		int passengerSize = temp.getAmount();
		
		if(((type == s)||(s2 == "South P")) &&(passengerSize + this.getSize() <= this.getMax())){
		    ans[0] += temp.getAmount();
		    ans[1] += temp.getTimeWaiting();
		    ans[2] += 1;
		    this.load(temp);
		    
		}
		else{
		    linePassengers[i] = temp;
		    i++;
		    amountAdded++;
		}
	    }


	    
	    for(int k = 0; k < amountAdded; k++){
		line.enqueue(linePassengers[k]);
	    }
	    return ans;
	}
    }




    

    /**
     *unloads and Passsengers that have reached their stop
     *@param dest the name of the destination the bus has arrived at
     *@return int[] the number of Passengers unloaded from the bus and the amount of time they spent waiting
     */

    public int[] unload(String dest){
	int[] ans = {0,0};
	if(this.getSize() == 0){
	    //System.out.println("The Bus Is Empty");
	    return ans;
	}

	else{

	    Passenger [] busPassengers = new Passenger [this.size()];
	    int i = 0;
	    int amountAdded = 0;
	    while(this.getSize() != 0){
		Passenger temp = (Passenger)this.poll();
		String s = temp.getDestination();
		if(s == dest){
		    ans[0] += temp.getAmount();
		    ans[1] += temp.getTimeWaiting();
		    this.setSize(this.getSize() - temp.getAmount());
		}

		else{
		    this.setSize(this.getSize() - temp.getAmount());
		    busPassengers[i] = temp;
		    i++;
		    amountAdded++;
		}
	    }

	    for(int k = 0; k < amountAdded; k++){
		this.enqueue(busPassengers[k]);
	    }
	    
	    return ans;
	}
    }


    /**
     *isActive a boolean functiuon that returns whether or not a Bus is active
     *@return boolean whether the bus is resting or not
     */
    public boolean isActive(){
	if (this.getTimeToRest() == 0){
	    return true;
	}
	else{
	    return false;
	}
    }
}

		
