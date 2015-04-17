import java.util.Stack;

/**
 *Ronald Balchand
 **109806273
 *Assignment # 3
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */

public class CardStack extends Stack{
    private char stackType;
        

    /**
     *Constructor for CardStack
     *@param type the type for stack this card Stack is going to be
     */
    public CardStack(char type){
	super();
	this.stackType = type;
    }

    /**
     *push method for this Card Stack
     *@param newCard the new card to be added to the top of this list
     */
    public void push(Card newCard){
	super.push(newCard);
    }


    //    public Card peek(){
    //}

    public void flipUp(){
	Card temp = (Card)this.pop();
	temp.setFaceUp(true);
	this.push(temp);
    }
    /**
     *pop - Removes the Card that is on top of the list
     *@return the card that is on top of the list
     */ 


    
    /**
     *returns an indicator to whether the stack is empty or not
     *@return boolean as to whether the stack is empty or not
     */
    public boolean isEmpty(){
	return this.empty();
    }

    /**
     *returns the number of cards in the deck
     *@return the number of cards in the stack
     */
    public int size(){
	return super.size();
    }

    /**
     *prints all of the cards in the stack
     */

    public void printStack(){
	if(this.stackType == 's'){
	    System.out.print(" [XX] ");
	}
	if(this.stackType == 'w'){
	    System.out.print(this.peek());
	}
	if(this.stackType == 't'){
	    if(this.isEmpty() == true){
		System.out.print("{  }");
	    }
	    else{
	    
		Card[] tempArray = new Card[this.size()];
		
		
		for(int i1 = 0; i1 < tempArray.length; i1++){
		    Card temp = (Card)this.pop();
		    tempArray[i1] = temp;
		}
		
		//System.out.println(tempArray[2]);
		for(int i2 = tempArray.length - 1; i2 >= 0; i2--){
		    if(tempArray[i2].isFaceUp() == false){
			System.out.print(" [XX] ");
		    }
		    if(tempArray[i2].isFaceUp() == true){
			System.out.print(tempArray[i2]);
		    }
		}
		
		for(int i3 = tempArray.length - 1; i3 >= 0; i3--){
		    this.push(tempArray[i3]);
		}
	    }
	}

	    
	if(this.stackType == 'f'){
	    System.out.print(this.peek());
	}
    }
    
    public void shuffle(){
	Card[] temp1 = new Card[this.size()];
	for(int i = 0; i < temp1.length; i++){
	    temp1[i] = (Card)this.pop();
	}
	int n = temp1.length;
	for(int j = 0; j < n; j++){
	    int change = j + (int)(Math.random()*(n - j));
	    Card temp = temp1[j];
	    temp1[j] = temp1[change];
	    temp1[change] = temp;
	}
	for(int h = temp1.length - 1;h >= 0; h--){
	    this.push(temp1[h]);
	}
    }


    public static void main(String [] args){
	Card a = new Card(1,1,false);
	Card b = new Card(2,2,false);
	Card c = new Card(3,3,false);
	Card d = new Card(4,4,false);
	CardStack stack = new CardStack('t');
	stack.push(a);
	stack.push(b);
	stack.push(c);
	stack.push(d);
	/*System.out.println(stack.pop());
	System.out.println(stack.pop());
	System.out.println(stack.pop());
	System.out.println(stack.pop());
	*/
	stack.printStack();
	//stack.shuffle();
	System.out.println();
	//stack.printStack();
	
	stack.flipUp();
	stack.printStack();
    }
}
