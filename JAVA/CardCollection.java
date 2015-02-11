//RONALD BALCHAND
//109806273
//CSE 214
//ASSIGNMENT 1 PART B

public class CardCollection{
    private final int MAX_CARDS = 100;
    private BaseballCard[] collection;
    private int index = 1;

    public CardCollection(){
	this.collection = new BaseballCard[MAX_CARDS];
	for(int i = 0; i < MAX_CARDS; i++){
	    this.collection[i] = new BaseballCard();
	}
    }

    public int size(){
	return this.index - 1;
    }

    public void addCard(BaseballCard newCard, int position)throws IllegalArgumentException{
	if((!(position >= 1)) || (!(position <= MAX_CARDS))) {
	    throw new IllegalArgumentException("Position input is not within the range");
      	}
	if(this.size() == MAX_CARDS){
	    throw new IllegalArgumentException("Card Collection is full");
	}
	
	else{
	    for(int i  = this.size(); i >= position; i--){
		BaseballCard temp = new BaseballCard();
		temp.setName(this.collection[i].getName());
		temp.setManufacturer(this.collection[i].getManufacturer());
		temp.setYear(this.collection[i].getYear());
		temp.setPrice(this.collection[i].getPrice());
		temp.setsizeX(this.collection[i].getsizeX());
		temp.setsizeY(this.collection[i].getsizeY());
		
		
		this.collection[i].setName(this.collection[i-1].getName());
		this.collection[i].setManufacturer(this.collection[i-1].getManufacturer());
		this.collection[i].setYear(this.collection[i-1].getYear());
		this.collection[i].setPrice(this.collection[i-1].getPrice());
		this.collection[i].setsizeX(this.collection[i-1].getsizeX());
		this.collection[i].setsizeY(this.collection[i-1].getsizeY());

		this.collection[i-1].setName(temp.getName());
		this.collection[i-1].setManufacturer(temp.getManufacturer());
		this.collection[i-1].setYear(temp.getYear());
		this.collection[i-1].setPrice(temp.getYear());
		this.collection[i-1].setsizeX(temp.getsizeX());
		this.collection[i-1].setsizeY(temp.getsizeY());
	    }	    
	    
	    this.collection[position - 1].setName(newCard.getName());
	    this.collection[position - 1].setYear(newCard.getYear());
	    this.collection[position - 1].setManufacturer(newCard.getManufacturer());
	    this.collection[position - 1].setPrice(newCard.getPrice());
	    this.collection[position - 1].setsizeX(newCard.getsizeX());
	    this.collection[position - 1].setsizeY(newCard.getsizeY());
	    this.index++;
	}
    }


    public void addCard(BaseballCard newCard){
	
	this.addCard(newCard,this.size());
	this.index++;
	
    }

    public BaseballCard getCard(int position)throws IllegalArgumentException{
	if(!(position >= 1) || (!(position >= MAX_CARDS))){
	    throw new IllegalArgumentException("Position entered is not within the range");
	}
	else{
	    return this.collection[position - 1];
	}
    }

    public boolean exists(BaseballCard card){
	boolean ans = false;
	for(int i = 0; i <= this.size(); i++){
	    if(this.collection[i].getName == card.getName()) && (this.collection[i].getYear() == card.getYear()) && (this.collection[i].get 
    
	    
  
    public static void main(String [] args){
	CardCollection a = new CardCollection();
	int[] a3 = {10,20};
	BaseballCard b = new BaseballCard("Darren", "Rob", 3000, 10.0,a3 );
	System.out.println(a.collection[0].getName());
	a.addCard(b,1);
	int [] a2 = {10,20};
	BaseballCard d = new BaseballCard("Ronald", "Bob", 2000, 10.0, a2);
	a.addCard(d,2);
	int [] a6 = {30,40};
	BaseballCard c = new BaseballCard("Adrian","ali", 4000, 20.0,a6);
	a.addCard(c,1);
	for(int i = 0; i < a.size(); i++){
	    System.out.println(a.collection[i].getName() + "\t");
	}
	

    }
		
	    
}    
