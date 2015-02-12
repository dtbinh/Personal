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
		this.collection[i-1].setPrice(temp.getPrice());
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
	
	this.addCard(newCard,this.size() + 1);
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



    public void trade(CardCollection other, int myPosition, int theirPosition)throws IllegalArgumentException{
	if((!(myPosition >= 1) && (myPosition < MAX_CARDS)) || ((!(theirPosition >= 1) && (theirPosition < MAX_CARDS)))){
	    throw new IllegalArgumentException("Position entered is not within the required range");
	}

	else{
	    BaseballCard temp = new BaseballCard();
	    temp.setName(this.collection[myPosition - 1].getName());
	    temp.setManufacturer(this.collection[myPosition - 1].getManufacturer());
	    temp.setYear(this.collection[myPosition - 1].getYear());
	    temp.setPrice(this.collection[myPosition - 1].getPrice());
	    temp.setsizeX(this.collection[myPosition - 1].getsizeX());
	    temp.setsizeY(this.collection[myPosition - 1].getsizeY());
	
	    this.collection[myPosition - 1].setName(other.collection[theirPosition - 1].getName());
	    this.collection[myPosition - 1].setManufacturer(other.collection[theirPosition - 1].getName());
	    this.collection[myPosition - 1].setYear(other.collection[theirPosition - 1].getYear());
	    this.collection[myPosition - 1].setPrice(other.collection[theirPosition - 1].getPrice());
	    this.collection[myPosition - 1].setsizeX(other.collection[theirPosition - 1].getsizeX());
	    this.collection[myPosition - 1].setsizeY(other.collection[theirPosition - 1].getsizeY());

	    other.collection[theirPosition - 1].setName(temp.getName());
	    other.collection[theirPosition - 1].setManufacturer(temp.getName());
	    other.collection[theirPosition - 1].setPrice(temp.getPrice());
	    other.collection[theirPosition - 1].setYear(temp.getYear());
	    other.collection[theirPosition - 1].setsizeX(temp.getsizeX());
	    other.collection[theirPosition - 1].setsizeY(temp.getsizeY());
	}
    }


    

    public boolean exists(BaseballCard card){
	boolean ans = false;
	for(int i = 0; i < this.size()+1; i++){
	    if((this.collection[i].getName() == card.getName()) && (this.collection[i].getManufacturer() == card.getManufacturer()) && (this.collection[i].getYear() == card.getYear()) && (this.collection[i].getPrice() == card.getPrice()) && (this.collection[i].getsizeX() == card.getsizeX()) && (this.collection[i].getsizeY() == card.getsizeY())){
		ans = true;
		break;
	    }
	}
	return ans;
    }

    public void removeCard(int position)throws IllegalArgumentException{
	if(! ( (position >=1) && (position <= MAX_CARDS))){
	    throw new IllegalArgumentException("Position entered is out of range");
	}

	else{
	    BaseballCard empty = new BaseballCard();
	    this.collection[position - 1].setName(empty.getName());
	    this.collection[position - 1].setManufacturer(empty.getManufacturer());
	    this.collection[position - 1].setYear(empty.getYear());
	    this.collection[position - 1].setPrice(empty.getPrice());
	    this.collection[position - 1].setsizeX(empty.getsizeX());
	    this.collection[position - 1].setsizeY(empty.getsizeY());
	    
	    for(int i = position - 1; i <= this.size(); i++){
		BaseballCard temp = new BaseballCard();
		temp.setName(this.collection[i].getName());
		temp.setManufacturer(this.collection[i].getManufacturer());
		temp.setYear(this.collection[i].getYear());
		temp.setPrice(this.collection[i].getPrice());
		temp.setsizeX(this.collection[i].getsizeX());
		temp.setsizeY(this.collection[i].getsizeY());
		
		this.collection[i].setName(this.collection[i + 1].getName());
		this.collection[i].setManufacturer(this.collection[i+ 1].getManufacturer());
		this.collection[i].setYear(this.collection[i+1].getYear());
		this.collection[i].setPrice(this.collection[i+1].getPrice());
		this.collection[i].setsizeX(this.collection[i+1].getsizeX());
		this.collection[i].setsizeY(this.collection[i+1].getsizeY());

		this.collection[i+1].setName(temp.getName());
		this.collection[i+1].setManufacturer(temp.getManufacturer());
		this.collection[i+1].setYear(temp.getYear());
		this.collection[i+1].setPrice(temp.getPrice());
		this.collection[i+1].setsizeX(temp.getsizeX());
		this.collection[i+1].setsizeY(temp.getsizeY());
	    }
	}
	this.index--;
    }



    public String toString(){
	String ans = "";
	for(int i = 1; i <= this.size(); i++){
	    ans += (i + String.format("%-2s","") + this.collection[i-1].getName() + String.format("%-18s","")+ this.collection[i-1].getManufacturer() + "\t" + this.collection[i-1].getYear() + "\t" + "$" + this.collection[i-1].getPrice() + "\t" + this.collection[i-1].getsizeX() + "x" + this.collection[i-1].getsizeY() + "\n");
	}
	return ans;
    }
		
    public void printAllCards(){
	System.out.println(this);
    }

    
		
    
	    
  
    public static void main(String [] args){
	CardCollection a = new CardCollection();
	int[] a3 = {10,20};
	BaseballCard b = new BaseballCard("Darren", "Rob", 2001, 10.0,a3 );
	System.out.println(a.collection[0].getName());
	a.addCard(b,1);
	int [] a2 = {10,20};
	BaseballCard d = new BaseballCard("Ronald", "Bob", 2000, 10.0, a2);
	a.addCard(d,2);
	int [] a6 = {30,40};
	BaseballCard c = new BaseballCard("Adrian","ali", 2003, 20.0,a6);
	a.addCard(c,1);
	for(int i = 0; i < a.size(); i++){
	    System.out.print(a.collection[i].getName() + "\t");
	}

	System.out.println();
	a.removeCard(1);

	for(int j = 0; j < a.size(); j++){
	    System.out.print(a.collection[j].getName() + "\t");
	}
	System.out.println(a.exists(b) + "\n\n");

	CardCollection t = new CardCollection();
	t.addCard(d);
	t.trade(a,1,2);

	a.printAllCards();
	

    }
		
	    
}    
