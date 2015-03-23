/**
 *Ronald Balchand
 *109806273
 *Assignment #4
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

import java.util.Scanner;

public class Simulator{
    String inRouteNames[] = {"South P", "West", "SAC","Chapin"};
    String outRouteNames[] = {"South P", "PathMart", "Walmart", "Target"};
    Bus[] innerBuses;
    Bus[] outerBuses;

    
    PassengerQueue[] innerRouteLines;
    PassengerQueue[] outerRouteLines; 

    int numInBuses;
    int numOutBuses;
    int minGroupSize;
    int maxGroupSize;
    double arrivalProb;
    int busCapacity;
    int duration;

    
    int groupsServed;
    int totalTimeWaited;

    

    public Simulator(){}
    /**
     *Overriden Constructor for the Simulator
     *@param _numInBuses the Number of Inner Loop Buses
     *@param _numOutBuses the Number of Outer Loop Buses
     *@param _minGroupSize the Minimum Group Size
     *@param _maxGroupSize the Maximum Group Size
     *@param _arrivalProb the Probabability of a Group of Passengrs lining up for a particular bus Stop
     *@param _busCapacity the Maximum size of each bus
     *@param _duration theamount of minutes the simulation lasts
     */
    public Simulator(int _numInBuses, int _numOutBuses, int _minGroupSize, int _maxGroupSize, double _arrivalProb, int _busCapacity, int _duration){
	this.numInBuses = _numInBuses;
	this.numOutBuses = _numOutBuses;
	this.minGroupSize = _minGroupSize;
	this.maxGroupSize = _maxGroupSize;
	this.arrivalProb = _arrivalProb;
	this.busCapacity = _busCapacity;
	this.duration = _duration;
	this.innerRouteLines = new PassengerQueue[inRouteNames.length];
	this.outerRouteLines = new PassengerQueue[outRouteNames.length];

	for(int i1 = 0; i1 < this.innerRouteLines.length; i1++){
	    this.innerRouteLines[i1] = new PassengerQueue(this.inRouteNames[i1], 0);
	}
	for(int i2 = 0; i2 < this.outerRouteLines.length; i2++){
	    this.outerRouteLines[i2] = new PassengerQueue(this.outRouteNames[i2], 0);
	}

	//Buses
	this.innerBuses = new Bus[this.numInBuses];
	this.outerBuses = new Bus[this.numOutBuses];
	int innerTimeWaiting = 0;
	int innerNextTime = 1;
	for(int i3 = 0; i3 < this.innerBuses.length; i3++){
	    this.innerBuses[i3] = new Bus(this.busCapacity,"Inner",inRouteNames[0], 1,innerTimeWaiting);
	    innerTimeWaiting += 30;
	}

	int outerTimeWaiting = 0;
	int outerNextTime = 1;
	for(int i4 = 0; i4 < this.outerBuses.length; i4++){
	    this.outerBuses[i4] = new Bus(this.busCapacity,"Outer",outRouteNames[0], 1, outerTimeWaiting);
	    outerTimeWaiting += 30;
	}	
    }

    /**
     *get method for he number of Inner Buses
     *@return int the number of Inner Buses
     */
    public int getNumInBuses(){
	return this.numInBuses;
    }

    /**
     *get method for he number of Outer Buses
     *@return int the number of Outer Buses
     */
    public int getNumOutBuses(){
	return this.numOutBuses;
    }

    /**
     *get method for the Probability double
     *@return double the probability indicated by the User
     */
    public double getProb(){
	return this.arrivalProb;
    }

    /**
     *get method for the minimum size of a Passenger Group
     *@return int the minimum Passenger Group Size
     */

    public int getMin(){
	return this.minGroupSize;
    }

    /**
     *get method for the maximum size of a Passenger Group
     *@return int the maximum Passenger Group Size
     */
    public int getMax(){
	return this.maxGroupSize;
    }
    

    /**
     *get method for the number of Groups that successfully reached their destination
     *@return int the number of Passengers that reach their Destination successfully
     */
    public int getGroupsServed(){
	return this.groupsServed;
    }

    /**
     *set method for the number of Groups that successfully reaced their destination
     *@param a the new value for the groupsServed
     */

    public void setGroupsServed(int a){
	this.groupsServed = a;
    }

    /**
     *get method for the total time Waited by all passengers
     *@return the total time waited
     */
    public int getTotalTimeWaited(){
	return this.totalTimeWaited;
    }

    /**
     *set method for the total timeWaited by all passengers
     *@param a the new value for the total time waited
     */
    public void setTotalTimeWaited(int a){
	this.totalTimeWaited = a;
    }

    /**
     *Method that calculates the Average wait time for each passenger
     *@return double the Average Wait time
     */
    
    public double averageWaitTime(){
	double a = (double)this.getGroupsServed();
	double b = (double)this.getTotalTimeWaited();
	return a/b;
    }



    
    
    /**
     *Method that adjusts the time and Positioning for The Bus and interacts with the bus stops
     */
    public void busIncrementer(){
	for(int i1 = 0; i1 < this.innerBuses.length; i1++){
	    
	    if(this.innerBuses[i1].isActive() == false){
		this.innerBuses[i1].setTimeToRest(this.innerBuses[i1].getTimeToRest() - 1);//RESTING BUSES
		System.out.println("In Route Bus " + (i1 + 1) + " waiting at South P for " + this.innerBuses[i1].getTimeToRest() + " minutes. "); 
	    }
	    
	    if(this.innerBuses[i1].isActive() == true){
		if(this.innerBuses[i1].inTransit()){
		    this.innerBuses[i1].setToNextStop(this.innerBuses[i1].getToNextStop() - 1);
		    
		}
		    
		if(this.innerBuses[i1].getToNextStop() > 0){
		    System.out.println("In Route Bus " + (i1 + 1) + " moving towards " + this.innerBuses[i1].getNextStop() + " . Arrives in " + this.innerBuses[i1].getToNextStop() + " minutes.");//MOVING BUSES
		}

		else if(innerBuses[i1].getToNextStop() == 0){
		    String name = this.innerBuses[i1].getNextStop();
		    int num = this.getInnerStopNumber(name);
		    int [] result = this.unloadAndLoad(this.innerBuses[i1],this.innerRouteLines[num]);
		    int dropped = result[0];
		    int pickedUp = result[1];
		    int time = result[2];
		    this.groupsServed += pickedUp;
		    this.totalTimeWaited += time;
		    System.out.print("In Route Bus " + (i1 + 1) +" arrives at " + this.innerBuses[i1].getNextStop() + " .");
		    if(dropped > 0){
			System.out.print("Drops off " + dropped + " passengers. ");
		    }
		    if(pickedUp > 0){
			System.out.print("Picks Up " + pickedUp + " passengers. ");
		    }
		    System.out.println();

		    if(num == 3){
			this.innerBuses[i1].setNextStop(this.inRouteNames[0]);
			this.innerBuses[i1].setToNextStop(20);
		    }
		
		    if(num < 3){
			this.innerBuses[i1].setNextStop(this.inRouteNames[num + 1]);
			this.innerBuses[i1].setToNextStop(20);
		    }
		}
	    }
	}
	
	    

	for(int i2 = 0; i2 < this.outerBuses.length; i2++){
	    if(this.outerBuses[i2].isActive() == false){
		this.outerBuses[i2].setTimeToRest(this.innerBuses[i2].getTimeToRest() - 1);
		System.out.println("Out Route Bus " + (i2 + 1) + " waiting at South P for " + this.outerBuses[i2].getTimeToRest() + " minutes. ");
	    }
	    
	    if(this.outerBuses[i2].isActive() == true){
		if(this.outerBuses[i2].inTransit()){
		    this.outerBuses[i2].setToNextStop(this.outerBuses[i2].getToNextStop() - 1);
		}

		if(this.outerBuses[i2].getToNextStop() > 0){
		    System.out.println("Out Route Bus " + (i2 + 1) + " moving towards " + this.outerBuses[i2].getNextStop() + " . Arrives in " + this.outerBuses[i2].getToNextStop() + " minutes. ");
		}

		else if(outerBuses[i2].getToNextStop() == 0){
		    String name2 = this.outerBuses[i2].getNextStop();
		    int num2 = this.getOuterStopNumber(name2);
		    int [] result2 = this.unloadAndLoad(this.outerBuses[i2], this.outerRouteLines[num2]);
		    int dropped2 = result2[0];
		    int pickedUp2 = result2[1];
		    int time2 = result2[2];
		    this.groupsServed += pickedUp2;
		    this.totalTimeWaited += time2;
		    System.out.print(" Out Route Bus " + (i2 + 1) + " arrives at " + this.outerBuses[i2].getNextStop() + " . ");
		    if(dropped2 > 0){
			System.out.print("Drops off " + dropped2 + " passengers. ");
		    }
		    if(pickedUp2 > 0){
			System.out.print("Picks Up " + pickedUp2 + " passengers. ");
		    }
		    System.out.println();
		    if(num2 == 4){
			this.outerBuses[i2].setNextStop(this.outRouteNames[0]);
			this.outerBuses[i2].setToNextStop(20);
		    }
		    if(num2 < 4){
			this.outerBuses[i2].setNextStop(this.outRouteNames[num2 + 1]);
			this.outerBuses[i2].setToNextStop(20);
		    }
		}
	    }
	}
    }

    

    /**
     *Displays the lines of the Passenger Queues from Inner to Outer
     */

    public void displayLines(){
	for(int i = 0; i < innerRouteLines.length; i++){
	    System.out.println(i + " (" + this.inRouteNames[i] + ") : " + this.innerRouteLines[i]);
	}

	for(int j = 0; j < outerRouteLines.length; j++){
	    System.out.println((j+4) + " (" + this.outRouteNames[j] + ") : " + this.outerRouteLines[j]);
	}
    }
    
    
	     
	 

    /**
     *Method that generates a random passenger Size between the indicated min and max
     *@return int a random Passenger Size between the indicated min and max
     */ 
    public int randomSize(){
	int min = this.getMin();
	int max = this.getMax();
	if(min == max){
	    return min;
	}
	int mid = max - min;
	return (int)((Math.random()*(mid)) + min);
    }

    /**
     *method to get a Random Inner Destination for the Passengers
     *@param current the number of the stop of the Passenger
     *@return String the Destination generated for the Passenger
     */

    public String randomInnerStop(int current){
	String ans = "";
	int max = this.inRouteNames.length - 1;
	int rand = 0;
	if(current == max){//3
	    rand = 0;
	    ans = this.inRouteNames[rand];
	}

	else if(current == 0){//0
	    rand = ((int) Math.random() * max);
	    
	    while((rand == max) || (rand == 0)){
		rand = (int)(Math.random() * max);
	    }
	
	    ans = this.inRouteNames[rand];
	}

	else{
	    int a = (int)(Math.random() * max);
	    if((current + a) == 4){
		a -= 1;
	    }
	    if((current + a) == current){
		a += 1;
	    }
	    rand = current + a;
	    ans = this.inRouteNames[rand];
	}
	return ans;
    }

    /**
     *gets the number stop for an Inner Stop Name
     *@param name the name of the Stop
     *@return int the number stop in the inner loop
     */
    public int getInnerStopNumber(String name){
	int ans = 0;
	for(int i = 0; i < this.inRouteNames.length; i++){
	    if(name == this.innerRouteLines[i].getName()){
		ans = i;
	    }
	}
	return ans;
    }


    /**
     *gets the number stop for an Outer Stop Name
     *@param name the name of the Stop
     *@return int the number stop in the Outer loop
     */
    public int getOuterStopNumber(String name){
	int ans = 0;
	for(int i = 0; i < this.outRouteNames.length; i++){
	    if(name == this.outerRouteLines[i].getName()){
		ans = i;
	    }
	}
	return ans;
    }
    


    /**
     *method to get a Random Outer Destination for the Passengers
     *@param current the number of the current Outer Stop the Passenegrs are at
     *@return the String representing the randomly generated outer position
     */

    public String randomOuterStop(int current){
	String ans = "";
	int rand = 0;
	int max = this.outRouteNames.length - 1;
	if(current == max){
	    rand = 0;
	    ans = this.outRouteNames[rand];
	}
	    
	else if(current == 0){
	    rand = ((int) (Math.random() * max));
	    while((rand == max) || (rand == 0)){
		rand = (int)(Math.random() * max);
	    }
	    ans = this.outRouteNames[rand];
	}
	
	else{
	    int a = (int)(Math.random() * max);
	    if((current + a) == 4){
		a -= 1;
	    }
	    if((current + a) == current){
		a += 1;
	    }
	    rand = current + a;
	    ans = this.outRouteNames[rand];
	}
	return ans;
	
    }
    
    

	

    /**
     *Method to determine whether or not Passengers will arrive at the stop
     *@param a double that represents the indicated arrival probability
     */
    public boolean arrivalProb(double indicate){
	boolean ans = false;
	double rand = Math.random();
	if(rand <= indicate){
	    ans = true;
	}
	return ans;
    }

    /**
     *Method to Assign the Passengers to each of the Stops
     *@param currentMinute the Current minute in the entire simulation
     */
    public void assignPassengers(int currentMinute){
	for(int i1 = 0; i1 < this.innerRouteLines.length; i1++){
	    double _indicate = this.getProb();
	    
	    if(this.arrivalProb(_indicate) == true){
		int passengerSize = this.randomSize();
		String passengerDest = randomInnerStop(i1);
		int timeArrive = currentMinute;
		Passenger dum = new Passenger(passengerSize, passengerDest, timeArrive, 0);
		System.out.println("A group of " + passengerSize + " passengers arrived at " + this.inRouteNames[i1] + " heading to " + passengerDest + ".");
		this.innerRouteLines[i1].enqueue(dum);
	    }
	}

	for(int i2 = 0; i2 < this.outerRouteLines.length; i2++){
	    double _indicate2 = this.getProb();
	    if(this.arrivalProb(_indicate2) == true){
		int passengerSize2 = this.randomSize();
		String passengerDest2 = randomOuterStop(i2);
		int timeArrive2 = currentMinute;
		Passenger dum2 = new Passenger(passengerSize2, passengerDest2, timeArrive2, 0);
		System.out.println("A group of " + passengerSize2 + " passengers arrived at " + this.outRouteNames[i2] + " heading to " + passengerDest2 + ". ");
		this.outerRouteLines[i2].enqueue(dum2);
	    }
	}
    
    }
		
		





		
    

    /**
     *unloads Passengers from the Bus and then loads Passengers from the Bus
     *@param a The Bus that arrived at the Stop
     *@param matchingStop The Stop the Bus is At
     *@return int[] three numbers, amount dropped off, picked up and the amount of time the picked up passengers spent waiting
     */
    public int[] unloadAndLoad(Bus a, PassengerQueue matchingStop){
	String stopName = matchingStop.getName();
	int [] ans = new int[3];
	int drop = 0;
	int[]  pickup = new int[2];
	drop = a.unload(stopName);
	pickup = a.loadEntire(matchingStop);
	ans[0] = drop;
	ans[1] = pickup[0];
	ans[2] = pickup[1];
	return ans;
    }
    
	
    /**
     *Main driver program to run and use all the other methods to simulate the bus loops 
     *@param duration the length of this Simulation
     */

    public double[] simulate(int duration){
	System.out.println();
	double[] ans = new double[2];
	for(int i = 1; i <= duration; i++){
	    System.out.println("Minute " + i);
	    this.assignPassengers(i);
	    //this.busIncrementer();
	    this.displayLines();
	}
	ans[0] = (double)this.getGroupsServed();
	ans[1] = (double)this.averageWaitTime();
	return ans;
    }


    


    

    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	System.out.println("Start");
	while(1==1){
	    System.out.print("Enter the number of In Route Busses: ");
	    int in = scanner.nextInt();
	    System.out.print("Enter the number of Out Route Busses: ");
	    int out = scanner.nextInt();
	    int min = 1;
	    int max = 0;
	    while(min > max){
		System.out.print("Enter the minimum group size of Passengers: ");
		min = scanner.nextInt();
		System.out.print("Enter the maximum group size of Passengers: ");
		max = scanner.nextInt();
		if(min > max){
		    System.out.println("\nYour maximum is smaller then your minimum\n");
		}
	    }   
	    System.out.print("Enter the maximum capacity of each Bus: ");
	    int cap = scanner.nextInt();
	    
	    double prob = 1;
	    while((prob <= 0) || (prob >= 1)){
		System.out.print("Enter the arrival Probability: ");
		prob = scanner.nextDouble();
		if((prob <= 0)||(prob >= 1)){
		    System.out.println("\nThat input is invalid\n");
		}
	    }
	    
	    System.out.print("Enter the duration of the simulation: ");
	    int dur = scanner.nextInt();
	    
	    Simulator a = new Simulator(in, out, min, max, prob, cap, dur);
	    double [] result = a.simulate(dur);
	    
	    System.out.print("Do you Want to run another Simulation (Y/N)? : ");
	    String b = scanner.next();
	    String b2 = b.toLowerCase();
	    if(b == "n"){
		break;
	    }
	}
	
    }
}
       
    
	
