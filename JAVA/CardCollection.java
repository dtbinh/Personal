ls
//RONALD BALCHAND
//109806273
//CSE 214
//ASSIGNMENT 1 PART B

public class CardCollection{
    private final int MAX_CARDS = 100;
    private BaseballCard[] collection;
    private int index = 1;

    public CardCollection(){
	this.collection = new BaseballCard[100];
    }

    public int size(){
	return this.index - 1;
    }

    public void addCard(baseballCard newCard, int position)throws Exception{
	if(!(position >= 1)) || (!(position <= this.size()) {  
	    
}    
