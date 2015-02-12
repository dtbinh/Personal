/**
 * Ronald Balchand
 * 109806273
 * Assignment # 1
 * CSE 214 Recitation Secion 05
 * Recitation TA: Vyassa Baratham 
 * Grading TA: Ke Ma
 * @author Ronald
 */
public class BaseballCard implements Cloneable{
    private String name;
    private String manufacturer;
    private int year;
    private double price;
    private int[] imagesize;


    /**
     Creates a new BaseballCard object ith all blank parameters
    */
    public BaseballCard(){
	this.name = " ";
	this.manufacturer = " ";
	this.year = 0;
	this.price = 0.00;
	this.imagesize = new int[2];
    }

    /**
     *Creates a new BaseballCard object using given values as an Overloaded constructor
     *@param _name The name of the Player onthe Baseball Card
     *@param _manufacturer The name of the manufacturer of the Baseball Card 
     *@param _year The year that the Baseball card was published
     *@param _price The price of the card
     *@param _imagesize The size of the image on the card
     */
    public BaseballCard(String _name, String _manufacturer, int _year,
			double _price, int[] _imagesize){
	this.name = _name;
	this.manufacturer = _manufacturer;
	this.year = _year;
	this.price = _price;
	this.imagesize = _imagesize;
    }

    /**
     *Receives the name of a particular BaseballCard
     *@return the name of the BaseballCard as a String
     */
    public String getName(){
	return this.name;
    }

    /**
     *Receives the Manufacturer of a particular BaseballCard
     *@return the Manufacturer of a BaseballCard as a String
     */
    
    public String getManufacturer(){
	return this.manufacturer;
    }
    /**
     * Receives the Year of a particular BaseballCard
     *@returns the year of a BaseballCard as an Integer
     */
    public int getYear(){
	return this.year;
    }
    /**
     *Receives the Price of a particular BaseballCard
     *@returns the Price of a BaseballCard as a Double
     */
    public double getPrice(){
	return this.price;
    }
    /**
     *Receives the X vector of the size of a particular BaseballCard
     *@returns the x vector of the size of a BaseballCard as an Integer
     */
    
    public int getsizeX(){
	return this.imagesize[0];
    }
    /**
     *Receives the Y vector of the size of a particular BaseballCard
     *@returns the y vectorof a BaseballCard as an Integer
     */
    
    public int getsizeY(){
	return this.imagesize[1];
    }
    /**
     *Changes the old Name into a new name
     *@param a New Name
     */
    public void setName(String a){
	this.name = a;
    }
    /**
     *Changes the old Manufacturer into a new Manufacturer
     *@param a New Manufacturer
     */
    
    public void setManufacturer(String a){
	this.manufacturer = a;
    }
    /**
     *Changes the old Year into a new Year
     *@param a New Year
     */
    
    public void setYear(int a){
	this.year = a;
    }

    /**
     *Changes the old Price into a new Price
     *@param a New Price
     *@throws IllegalArgumentException The input parameter must be positive
     */
    
    public void setPrice(double a)throws IllegalArgumentException{
	if(a < 0){
	    throw new IllegalArgumentException("The input cannot be negative");
	}
	
	this.price = a;
	
    }

    /**
     *Changes the old X part of the size into a new X size
     *@param a New size for X
     */
    public void setsizeX(int a){
	this.imagesize[0] = a;
   
    }
    /**
     *Changes the old Y part of the size into a new Y size
     *@param a New size for Y
     */

    public void setsizeY(int a){
	this.imagesize[1] = a;
    }

    /**
     *Copies all data from a particular BaseballCard into a new BaseballCard reference
     *Changing the original won't change the copy
     *@return a copy of a BaseballCard as an **Object**
     */
    public Object clone()throws CloneNotSupportedException{
	try{
	    return super.clone();
	}catch (CloneNotSupportedException ex){
	    throw ex;
	}
    }
    /**
     * Compares a particular object with a BaseballCard object: checks for logical equivalence
     *@param obj the object to be compared with the current BaseballCard
     *@return true if logically equivalent, false otherwise
     */
    
    public  boolean equals(Object a){
	boolean ans = true;
	BaseballCard obj = (BaseballCard)a;
	if(this.name != (obj.getName())){
	    ans = false;
	}
	if(this.manufacturer != obj.getName()){
	    ans = false;
	}
	if(this.price != obj.getPrice()){
	    ans = false;
	}
	if(this.year != obj.getYear()){
	    ans = false;
	}
	if(this.getsizeX() != obj.getsizeX()){
	    ans = false;
	}
	if(this.getsizeY() != obj.getsizeY()){
	    ans = false;
	}
	return ans;
    }
		
}
