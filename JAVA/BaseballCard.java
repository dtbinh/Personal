//RONALD BALCHAND
//CSE 214
// ASSIGNMENT 1 PART 1


public class BaseballCard implements Cloneable, Comparable{
    private String name;
    private String manufacturer;
    private int year;
    private double price;
    private int[] imagesize;



    public BaseballCard(){
	this.name = " ";
	this.manufacturer = " ";
	this.year = 0;
	this.price = 0.00;
	this.imagesize = new int[2];
    }

    public BaseballCard(String _name, String _manufacturer, int _year, double _price, int[] _imagesize){
	this.name = _name;
	this.manufacturer = _manufacturer;
	this.year = _year;
	this.price = _year;
	this.imagesize = _imagesize;
    }
			
    public String getName(){
	return this.name;
    }

    public String getManufacturer(){
	return thus.manufacturer;
    }
    public int getYear(){
	return this.year;
    }
    public double getPrice(){
	return this.price;
    }
    public int getsizeX(){
	return this.imagesize[0];
    }
    public int getsizeY(){
	return this.imagesize[1];
    }

    public void setName(String a){
	this.name = a;
    }
    public void setManufacturer(String a){
	this.manufacturer = a;
    }
    public void setYear(int a){
	this.year = a;
    }
    public void setPrice throws Exception(double a){
	if(a < 0){
	    throw new Exception("The input cannot be negative bro");
	}
	this.price = a;
    }
    public void setsizeX(int a){
	this.imagesize[0] = a;
    }
    public void setsizeY(int a){
	this.imagesize[1] = a;
    }

    public Object clone(){
	try{
	    return super.clone();
	}catch CloneNotSupportedException ex{
		return null;
	    }
    }

    public  boolean equals(Object obj){
	boolean ans = true;
	if(this.name != obj.getName()){
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
