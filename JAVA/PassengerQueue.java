/**
 *Ronald Balchand
 *109806273
 *Assignment #4
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */


import java.util.PriorityQueue;

public class PassengerQueue extends PriorityQueue{
    private String name;
    private String type;
    private int size;

    /**
     *Default constructor for the PassengerQueue
     */
    public PassengerQueue(){
	this.name = "";
	this.size = 0;
    }

    /**
     *Overriden constructor for the PassengerQueue class
     *@param a The Name of the Bus Stop
     *@param b the Size of the Bus Stop
     */
    
    public PassengerQueue(String a, int b){
	this.name = a;
	this.size = b;
    }


    /**
     *get method for the name of the Line
     *@return String the name of the Line
     */

    public String getName(){
	return this.name;
    }

    /**
     *iterator for the waiting time of all the Passengers
     */
    public void passengerWait(){
	Passenger [] linePassengers = new Passenger[this.size()];
	for(int i1 = 0; i1 < linePassengers.length; i1++){
	    Passenger temp = (Passenger)this.dequeue();
	    temp.setTimeWaiting(temp.getTimeWaiting() + 1);
	    linePassengers[i1] = temp;
	}

	for(int i2 = 0; i2 < linePassengers.length; i2++){
	    this.enqueue(linePassengers[i2]);
	}
    }

    /**
     *Enqueue method that adds a new group of passengers to the line
     *@param Passenger p the new group of Passenger
     */

    public void enqueue(Passenger p){
	this.add(p);
	this.setSize(this.getSize() + p.getAmount());
    }

    /**
     *dequeue method that removes and returns the next method
     *@return Passenger that was removed from the Queue
     */ 

    public Passenger dequeue(){
	if(this.getSize() == 0){
	    System.out.println("This line is empty");
	    return null;
	}
	else{
	    Passenger temp = (Passenger)this.peek();
	    this.setSize(this.getSize() - temp.getAmount());
	    return (Passenger)this.poll();
	    
	}
    }

    /**
     *Overridden String Method
     *@return String the String form of the Passengers
     */
    public String toString(){
	String ans = "";
	int size = this.size();
	Passenger [] linePassengers = new Passenger[this.size()];
	for(int i1 = 0; i1 < size; i1++){
	    Passenger temp = (Passenger)this.dequeue();
	    ans += temp + ", ";
	    linePassengers[i1] = temp;
	    //this.enqueue(temp);
	}

	for(int i2 = 0; i2 < linePassengers.length; i2++){
	    this.enqueue(linePassengers[i2]);
	    }
	return ans;
    }
    

    /**
     *size method for the Passenger Queue
     *@return int the size of the current PassengerQueue
     */

    public int getSize(){
	return this.size;
    }

    /**
     *set method for the size of the PassengerQueue
     *@param a new integer value for the current size
     */

    public void setSize(int a){
	this.size = a;
    }


    /**
     *isEmpty method for the Passenger Queue
     *@return boolean true if it is empty, false if not
     */
    
    public boolean isEmpty(){
	if(this.getSize() == 0){
	    return true;
	}
	else{
	    return false;
	}
    }   
}



















