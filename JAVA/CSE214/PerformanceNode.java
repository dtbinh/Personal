/**
 *Ronald Balchand
 *109806273
 * Assignment #2
 * CSE 214 Recitation Section 05
 * Recitation TA: Vyassa Baratham
 * Grading TA: Ke Ma
 * @author Ronald
 */

public class PerformanceNode{

    private String performanceName;
    private String leadPerformer;
    private int totalParticipants;
    private int duration;
    private int time;
    private PerformanceNode next;
    private PerformanceNode previous;
    

    /**
     *Default Constructor for the Performance Node with each parameters set to null
     */
    public PerformanceNode(){
	this.performanceName = "";
	this.leadPerformer = "";
	this.totalParticipants = 0;
	this.duration = 0;
	this.time = 0;
	this.next = null;
	this.previous = null;
    }

    /**
     *Constructor for the Performance Node that includes parameters
     *@param _name The name of the Performance
     *@param _leadPerformer The name of the lead Performer
     *@param _totalParticipants The total number of Participants in this Performance
     *@param _duration The duration of the Performace (in minutes)
     *@param _time The start time of the Performance (in minutes)
     *@param _next The next Performance in the Festival 
     *@param _previous The previous Performance in the Festival
     */
    public PerformanceNode(String _name, String _leadPerformer, int _totalParticipants, int _duration, int _time, PerformanceNode _next, PerformanceNode _previous){
	this.performanceName = _name;
	this.leadPerformer = _leadPerformer;
	this.totalParticipants = _totalParticipants;
	this.duration = _duration;
	this.time = _time;
	this.next = _next;
	this.previous = _previous;
    }
    /**
     *returns the name of the Performance
     *@return the name of the Performace as a String
     */
    public String getName(){
	return this.performanceName;
    }
    /**
     *returns the name of the lead Performer of this Performance
     *@return the name of the lead performer as a String
     */
    public String getleadPerformer(){
	return this.leadPerformer;
    }
    /**
     *returns the number of total participants
     *@return the number of total participants as an Integer
     */
    public int gettotalParticipants(){
	return this.totalParticipants;
    }
    /**
     *returns the duration of this Performance in minutes
     *@return the duration as an Integer
     */
    public int getDuration(){
	return this.duration;
    }
    /**
     * returns the time of this performance in minutes
     *@return the time of this performance in minutes  as an Integer
     */
    public int getTime(){
	return this.time;
    }
    /**
     *returns the next Performance Node in this festival
     *@return the next Performance in this festival
     */
    public PerformanceNode getNext(){
	return this.next;
    }

    /**
     *returns the previous Performance Node in this festival
     *@return the previous Performance in this festival
     */

    public PerformanceNode getPrevious(){
	return this.previous;
    }

    /**
     *sets the Name of this Performance to a new Name 
     *@param a A new String for the name of the Performance
     */
    public void setName(String a){
	this.performanceName = a;
    }

    /** 
     *sets the leadPerformer to a new leadPerformer
     *@param a A new String for the new leadPerformer
     */
    public void setLeadPerformer(String a){
	this.leadPerformer = a;
    }

    /**
     *sets the duration of the Performance to a new Value
     *@param a A new Integer for the new value of the duration
     */
    public void setDuration(int a){
	this.duration = a;
    }

    /**
     *sets the total number of Participants to a new value
     *@param a A new integer for the new value of totalParticipants  
     */
    
    public void settotalParticipants(int a){
	this.totalParticipants = a;
    }

    /**
     *sets the starting time of this Performance to a new value
     *@param a A new integer for the new value of time
     */

    public void setTime(int a){
	this.time = a;
    }

    /**
     *sets next to a new Performance
     *@param a A new Performance to point to as the next one
     */

    public void setNext(PerformanceNode a){
	this.next = a;
    }

    /**
     *sets previous to a new Performance
     *@param a A new Perfomance to point to as the previous one
     */
    public void setPrevious(PerformanceNode a){
	this.previous = a;
    }

    public String toString(){
	String ans = "%1$-30s%2$20s%3$13s%4$10s%5$12s\n";
	return String.format(ans, this.getName(),this.getleadPerformer(), this.gettotalParticipants(), this.getDuration(), this.getTime());
    }
}
