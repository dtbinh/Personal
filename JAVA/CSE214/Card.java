/**
 *Ronald Balchand
 *109806273
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassaq Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */

public class Card{
    private int suit;
    private int value;
    private boolean isFaceUp;

    String values[] = {" ", "A","2","3","4","5","6","7","8","9","10","J","Q","K"};
    char suits[] = {' ', '\u2666', '\u2663','\u2665', '\u2660'}; //1-diamond, 2-club, 3-heart, 4-spade
	

    /**
     *Empty Constructor for the Card
     */

    public Card(){
	this.suit = 0;
	this.value = 0;
	this.isFaceUp = false;
    }

    /**
     *overrridden constructor for the card Class
     *@param _suit suit int to be assigned to the card
     *@param _value value int to be assigned to the card
     *@param _isFaceUp boolean value to be assigned to the card whether it is face up or down
     */
    public Card(int _suit, int _value, boolean _isFaceUp){
	this.suit = _suit;
	this.value = _value;
	this.isFaceUp = _isFaceUp;
    }

    /**
     *get method for the suit
     *@return an integer for the suit
     */
    public int getSuit(){
	return this.suit;
    }
    /**
     *get method for the value
     *@return an integer representing the value
     */
    public int getValue(){
	return this.value;
    }
    /**
     *set method for the suit
     *@param a the integer representing the suit you wish to change to
     */
    public void setSuit(int a){
	this.suit = a;
    }
    /**
     *set method for the value
     *@param a the integer representing the value you wish to change to
     */
    public void setValue(int a){
	this.value = a;
    }
    /**
     *boolean method to determine whether the card is face up
     *@return the boolean true or false whether the card is face up
     */
    public boolean isFaceUp(){
	return isFaceUp;
    }
    /**
     *method to set the card faceup 
     *@param boolean faceUp to set the card faceUp
     */
    public void setFaceUp(boolean faceUp){
	this.isFaceUp = faceUp;
    }

    /**
     *method to determine whether the card is red or not
     *@return boolean, false if black, true if red
     */
    public boolean isRed(){
	if((this.suit % 2) == 0){
	    return false;
	}
	else{
	    return true;
	}
    }


    /**
     *toString method for the Card class
     *@return the Card in the form of the String
     */
    public String toString(){
	return " [" + values[this.getValue()] + suits[this.getSuit()] + "] ";
    }

    /*public static void main(String [] args){
	Card a = new Card(2,9,true);
	System.out.println(a);
	System.out.println(a.isRed());
    }
    */
}
