//RONALD BALCHAND
//109806273
//CSE 214
//ASSIGNMENT 1 PART B

public class CardCollection{
    private final int MAX_CARDS = 100;
     BaseballCard[] collection;
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
	}
    }

    public void addCard(BaseballCard newCard){
	
	this.collection[this.size()].setName(newCard.getName());
	this.collection[this.size()].setManufacturer(newCard.getManufacturer());
	this.collection[this.size()].setYear(newCard.getYear());
	this.collection[this.size()].setPrice(newCard.getPrice());
	this.collection[this.size()].setsizeX(newCard.getsizeX());
	this.collection[this.size()].setsizeY(newCard.getsizeY());
	index++;
	
    }
	    
  
    public static void main(String [] args){
	CardCollection a = new CardCollection();
	int[] a3 = {10,20};
	BaseballCard b = new BaseballCard("Darren", "Rob", 3000, 10.0,a3 );
	System.out.println(a.collection[0].getName());
	a.addCard(b);
	int [] a2 = {10,20};
	BaseballCard d = new BaseballCard("Ronald", "Bob", 2000, 10.0, a2);
	a.addCard(d);
	System.out.println(a.collection[1].getName());

    }
		
	    
}    
