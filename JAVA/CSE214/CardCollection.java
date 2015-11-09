/**
 *Ronald Balchand
 *109806273
 *Homework Assignment # 1
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */
public class CardCollection{
    private final int MAX_CARDS = 100;
    private BaseballCard[] collection;
    private int index = 1;

    /**
     *Construct an instance of the CardCollection class with no BaseballCard objects in it.
     *<dt><b>Postconditions:</b><dd>  This CardCollection has been initialized to an empty list of BaseballCards.
     */

    public CardCollection(){
 this.collection = new BaseballCard[MAX_CARDS];
 for(int i = 0; i < MAX_CARDS; i++){
     this.collection[i] = new BaseballCard();
 }
    }
    
    
    /**
     *Determines the number of items currently in this collection.
     *<dt><b>Preconditions:</b><dd> condition  This CardCollection object has been instantiated
     *@return The number of BaseballCards in this CardCollection
     */
    public int size(){
 return this.index - 1;
    }
       class FullCollectionException extends RuntimeException{
 public FullCollectionException(String message){
     super(message);
 }
    /**
     *Adds a specified card to this CardCollection at a specified location
     *@param newCard  The new BaseballCard object to add to this collection 
     *@param position The position in this CardCollection where newCard will be inserted 
     *<dt><b>Preconditions:</b><dd> condition  This CardCollection object has been instantiated and 1 < position < items_currently_in_list + 1. The number of BaseballCard objects in this Menu is less than MAX_CARDS. 
     *<dt><b>Postconditions:</b><dd>  The new BaseballCard is now stored at the desired position in the CardCollection. All cards that were originally in positions greater than or equal to position are moved back one position. 
     *@throws IllegalArgumentException Indicates that position is not within the valid range
     *@throws FullCollectionException Indicates that there is no more room inside of the CardCollection to store the new BaseballCard object.
     */

    
    public void addCard(BaseballCard newCard, int position)throws IllegalArgumentException, FullCollectionException{
 if((!(position >= 1)) || (!(position <= MAX_CARDS))) {
     throw new IllegalArgumentException("Position input is not within the range");
 }
 if(this.size() == MAX_CARDS){
     throw new FullCollectionException("Card Collection is full");
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
    
    

    /**
     *Works just like addCard(BaseballCard newCard, int position), except adds to the end of the list.
     */
    public void addCard(BaseballCard newCard){
 
 this.addCard(newCard,this.size() + 1);
 this.index++;
 
    }
    
    /**
     *Get the BaseballCard at the given position in this CardCollection object.
     *@param position Positiion of the card to retrieve
     *<dt><b>Preconditions:</b><dd> condition  This CardCollection object has been instantiated and 1 < position < items_currently_in_list.
     *@return The card at the specified position in this Menu object
     *@throws IllegalArgumentException INdicates that position is not within the valid range
     */
    public BaseballCard getCard(int position)throws IllegalArgumentException{
 if(!(position >= 1) || (!(position >= MAX_CARDS))){
     throw new IllegalArgumentException("Position entered is not within the range");
 }
 else{
     return this.collection[position - 1];
 }
    }
    
    
    
    /**
     *Exchange a card from this collection for a card from another collection.
     *@param other The CardCollection we will be trading with
     *@param myPosition  The position within this collection of the card to trade
     *@param theirPosition  The position within the other collection of the card to trade
     *<dt><b>Preconditions:</b><dd> condition  Both CardCollection objects have been instantiated and 1 < myPosition < items_currently_in_this_list and 1 < theirPosition < items_currently_in_other_list
     *@throws IllegalArgumentException Indicates that either position is not within the valid range
     */
    
    
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
    
    
    
    /**
     *Check whether this collection contains the given card
     *@param card The BaseballCard we are looking for
     *<dt><b>Preconditions:</b><dd> condition  This CardCollection and the BaseballCard object have both been instantiated
     *@return True, if this CardCollection contains the card, false otherwise.
     */
    
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

    /**
     *Removes the card from the indicated position from the Collection
     *@param position The position in the CardCollection where the BaseballCard will be removed from.
     *<dt><b>Preconditions:</b><dd> condition  This CardCollection object has been instantiated and 1 < position < items_currently_in_list. 
     *<dt><b>Postconditions:</b><dd>  The card at the desired position in the collection has been removed. All cards that were originally in positions greater than or equal to position are moved forward one position. 
     *@throws IllegalArgumentException Indicates that position is not within the valid range.
     */
    
    
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
    

    /**
     *Prints a neatly formatted table of each item in the collection on its own line with its position number as shown in the sample output.
     *<dt><b>Preconditions:</b><dd> condition   This cardCollection contains the card, false otherwise
     *<dt><b>Postconditions:</b><dd>  A neatly formatted table of each card in the collection on its own line with its position number has been displayed to the user
     */
    
    public String toString(){
 String ans = "";
 for(int i = 1; i <= this.size(); i++){
     ans += (i + String.format("%-2s","") + this.collection[i-1].getName() + String.format("%-18s","")+ this.collection[i-1].getManufacturer() + "\t" + this.collection[i-1].getYear() + "\t" + "$" + this.collection[i-1].getPrice() + "\t" + this.collection[i-1].getsizeX() + "x" + this.collection[i-1].getsizeY() + "\n");
 }
 return ans;
    }
    
    /**
     *Gets the String representation of this CardCollection object, which is a neatly formatted table of each BaseballCard in the CardCollection on its own line with its position number as shown in the sample output.
     *@return The String representation of this CardCollection object 
     */
    public void printAllCards(){
 System.out.println(this);
    }  
    
       }
}
