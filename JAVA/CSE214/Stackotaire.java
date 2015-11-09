/**
 *Ronald Balchand
 **109806273
 *Assignment # 3
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */
import java.util.Scanner;

public class Stackotaire{
    private CardStack main;
    private CardStack stock;
    private CardStack waste;
    private CardStack[] tableaus;
    private CardStack[] foundations;
    String values[] = {" ", "A","2","3","4","5","6","7","8","9","10","J","Q","K"};
    char suits[] = {' ', '\u2666', '\u2663','\u2665', '\u2660'}; //1-diamond, 2-club, 3-heart, 4-spade
    private boolean auto;
    
    
    public Stackotaire(){
	this.auto = false;
	this.stock = new CardStack('s');
	this.waste = new CardStack('w');
	this.main = new CardStack('t');
        this.tableaus = new CardStack[7];
	this.foundations = new CardStack[4];
	for(int i = 1; i < 5; i++){
	    for(int j = 1; j < 14; j++){
		Card temp = new Card(i,j,false);
		
		this.main.push(temp);
	    }
	}
	for(int a = 0; a < 7; a++){
	    this.tableaus[a] = new CardStack('t');
	}
	for(int b = 0; b < 4; b++){
	    this.foundations[b] = new CardStack('f');
	}
    }

    
    /**
     *Initialize sets up the game by transferring everything back to the main stack, shuffling and redistributing them
     */

    public void initialize(){
	while(this.stock.size() != 0){
	    Card temp = (Card)this.stock.pop();
	    temp.setFaceUp(false);
	    this.main.push(temp);
	}
	while(this.waste.size() != 0){
	    Card temp1 = (Card)this.waste.pop();
	    temp1.setFaceUp(false);
	    this.main.push(temp1);
	}
	for(int i1 = 0; i1 < 7; i1++){
	    while(this.tableaus[i1].size() != 0){
		Card temp2 = (Card)this.tableaus[i1].pop();
		temp2.setFaceUp(false);
		this.main.push(temp2);
	    }
	}
	for(int i2 = 0; i2 < 4; i2++){
	    while(this.foundations[i2].size() != 0){
		Card temp3 = (Card)this.foundations[i2].pop();
		temp3.setFaceUp(false);
		this.main.push(temp3);
	    }
	}

	this.main.shuffle();
	//Tableaus
    
	
	for(int t1 = 0; t1 < 1; t1++){
	    this.tableaus[0].push(this.main.pop());
	}
	this.tableaus[0].flipUp();
	for(int t2 = 0; t2 < 2; t2++){
	    this.tableaus[1].push(this.main.pop());
	}
	this.tableaus[1].flipUp();
	for(int t3 = 0; t3 < 3; t3++){
	    this.tableaus[2].push(this.main.pop());
	}
	this.tableaus[2].flipUp();
	for(int t4 = 0; t4 < 4; t4++){
	    this.tableaus[3].push(this.main.pop());
	}
	this.tableaus[3].flipUp();
	for(int t5 = 0; t5 < 5; t5++){
	    this.tableaus[4].push(this.main.pop());
	}
	this.tableaus[4].flipUp();
	for(int t6 = 0; t6 < 6; t6++){
	    this.tableaus[5].push(this.main.pop());
	}
	this.tableaus[5].flipUp();
	for(int t7 = 0; t7 < 7; t7++){
	    this.tableaus[6].push(this.main.pop());
	}
	this.tableaus[6].flipUp();
			      
	//stock and waste
	while(main.size() != 0){
	    stock.push(main.pop());
	}
	System.out.println("NEW GAME");
	
    }
	
    /**
     *displays the current state of the game board
     */
    public void displayGameBoard(){
	System.out.println("STACKOTAIRE:\n\n");
	//FOUNDATIONS

	for(int i = 0; i < 4; i++){
	    if(this.foundations[i].isEmpty() == true){
		System.out.print("[F" + (i+1) +"]");
	    }
	    else{
		this.foundations[i].printStack();
	    }
	}

	//STOCK AND WASTE

	if(this.waste.isEmpty() == true){
	    System.out.print("         W1 ");
	}
	if(this.waste.isEmpty() == false){
	    System.out.print("        W1  ");
	    this.waste.printStack();
	    System.out.print(" ");
	}

	this.stock.printStack();
	//TABLEAUS
	System.out.print("  " + this.stock.size() +"\n\n");
	for(int i = 7;i > 0; i--){
	    System.out.print("T" + (i) + "  ");
	    this.tableaus[i-1].printStack();
	    System.out.println();
	}
	System.out.println("\n");
    }

    /**
     *main driver behind the auto Move method. Scans through the board and places thins automatically in the Foundation stacks
     *@return int returns an integer 0 or 1 based onj wheher or not anything was moved
     */
    
    public int render(){
	int ans = 0;
	for(int i = 0; i < 4; i++){
	    if(foundations[i].isEmpty() == true){
		if(this.waste.isEmpty() == false){
		    Card temp1 = (Card)(this.waste.peek());
		    if(temp1.getValue() == 1){
			this.foundations[i].push(this.waste.pop());
			i++;
			ans = 1;
		    }
		}
		
		for(int t = 0; t < 7; t++){
		    if(this.tableaus[t].isEmpty() == true){
			t++;
		    }
		    
		    Card temp2 = (Card)(this.tableaus[t].peek());
		    if(temp2.getValue() == 1){
			this.foundations[i].push(this.tableaus[t].pop());
			if(this.tableaus[t].isEmpty() == false){
			    this.tableaus[t].flipUp();
			}
			i++;
			ans = 1;
		    }
		}
		
	    }

	    else{
		if(this.waste.isEmpty() == false){
		    Card temp3 = (Card)(this.waste.peek());
		    Card temp4 = (Card)(this.foundations[i].peek());
		    if((temp3.getSuit() == temp4.getSuit()) && ((temp3.getValue()) == temp4.getValue() + 1) && (temp3.isRed() == temp4.isRed())){
			this.foundations[i].push(this.waste.pop());
			i++;
			ans = 1;
		    }
		}
		for(int t2 = 0; t2 < 7; t2++){
		    if(this.tableaus[t2].isEmpty() == true){
			t2 += 1;
		    }
		    Card temp5 = (Card)(this.tableaus[t2].peek());
		    Card temp6 = new Card();
		    if(this.foundations[i].isEmpty() == false){
			temp6 = (Card)(this.foundations[i].peek());
		    }
		    if((temp5.getSuit() == temp6.getSuit()) && ((temp5.getValue()) == (temp6.getValue() + 1)) &&(temp5.isRed() == temp6.isRed())){
			this.foundations[i].push(this.tableaus[t2].pop());
			if(this.tableaus[t2].isEmpty() == false){
			    this.tableaus[t2].flipUp();
			}
			i++;
			ans = 1;
		    }
		    
		}
	    }	    
	}
	return ans;
    }
    
    /**
     *Switch for the Auto move method
     */
    public void toggleAuto(){
	if(this.auto == true){
	    this.auto = false;
	}
	else{
	    this.auto = true;
	}
    }

    /**
     *returns the value of the auto move switch
     *@return boolean value, trueif on and false if off
     */

    public boolean getAuto(){
	return this.auto;
    }

    /**
     *activates and carries out the AutoMove function
     */
    public void moveAuto(){
	if(this.checkWin() == true){
	    System.out.println("YAY YOU WIN");
	}
	if(this.getAuto() == true){
	    while(this.render() == 1){
	    }
	}
    }


    /**
     *Removes one card and flips it from the stock to the waste. If the stock is empty, then it recycles the waste stack
     */
    public void Draw(){
	if( (this.stock.isEmpty() == true) && (this.waste.isEmpty() == true)){
	    System.out.println("There are no cards to draw");
	}

	if((this.stock.isEmpty() == true) &&(this.waste.isEmpty() == false)){
	    while(this.waste.isEmpty() == false){
		Card temp = (Card)(this.waste.pop());
		temp.setFaceUp(false);
		this.stock.push(temp);
	    }
	}
	
	if(this.stock.isEmpty() == false){
	    this.waste.push(this.stock.pop());
	}
    }


    /**
     *Move method for a stack without an index and a stack with one
     *@param String a the name of the stack you are moving from
     *@param String b the name of the stack you are moving to
     *@param int d the number stack of the indexed stack
     */
    public void Move(String a, String b, int d){
	if((a == "waste") && (b == "foundation")){
	    if(this.waste.isEmpty()){
		System.out.println("Error: The Waste stack is empty");
	    }

	    
	    if((this.waste.isEmpty() == false) && (this.foundations[d - 1].isEmpty() == true)){//empty
		Card temp1 = (Card)(this.waste.peek());
		if(temp1.getValue() == 1){//A
		    this.foundations[d - 1].push(this.waste.pop());
		    System.out.println("Card " + temp1 + " was added from " + a + " to " + b + " " + d); 
		}
		else{
		    System.out.println("You cannot add to the empty foundation unless the value is A");
		}
	    }
	    
	    else if((this.waste.isEmpty() == false) &&(this.foundations[d-1].isEmpty() == false)){
		//not empty
		Card temp2 = (Card)(this.waste.peek());//Card you tryna add
		Card temp3 = (Card)(this.foundations[d - 1].peek());//Card on the top of the foundation, 
		if( (temp2.getSuit() == temp3.getSuit()) && (temp2.isRed() == temp3.isRed()) &&((temp2.getValue() - 1) == temp3.getValue())){
		    this.foundations[d - 1].push(this.waste.pop());
		    System.out.println("Card " + temp2 + " was added from " + a + " to " + b + " " + d);
		    
		}
		else{
		    System.out.println("You cannot add that card to that foundation");
		}
	    }
	}


	
	if((a == "waste") && (b == "tableau")){
	    if(this.waste.isEmpty()){
		System.out.println("The Waste Stack is empty");
	    }
	    if((this.waste.isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == true)){// what you moving to empty
		Card temp4 = (Card)(this.waste.peek());//card you adding from waste
		if(temp4.getValue() == 13){
		    this.tableaus[d -1].push(this.waste.pop());
		    System.out.println("Card " + temp4 + " was added from " + a + " to " + b + " " + d);
		    
		}
		else{
		    System.out.println("You cannot place any card other than a King in an empty tableau space");
		}
	    }
	    else if((this.waste.isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == false)){
		Card temp5 = (Card)(this.waste.peek());
		Card temp6 = (Card)(this.tableaus[d-1].peek());
		if( ((temp6.getValue() - 1) == temp5.getValue()) && (temp5.isRed() != temp6.isRed())){
		    this.tableaus[d-1].push(this.waste.pop());
		    this.tableaus[d-1].flipUp();
		    System.out.println("Card " + temp5 + " was added from " + a + " to " + b + " " + d);
		   
		}
		else{
		    System.out.println("You cannot add that card to that tableau");
		}
	    }
	}
    }




    /**
     *Move method for a two indexed stacks
     *@param String a the name of the stack you are moving from
     *@param String b the name of the stack you are moving to
     *@param int c the number stack of the indexed stack you are moving from
     *@param int d the number stack of the indexed stack you are moving to
     */
    
    
    public void Move(String a, String b, int c, int d){
	if((a == "tableau") && (b == "foundation")){//TABLEAU TO THE FOUNDATION

	    if(this.tableaus[c - 1].isEmpty()){
		System.out.println("That Table is empty");
	    }

	    if( (this.tableaus[c - 1].isEmpty() == false) && (this.foundations[d - 1].isEmpty() == true)){
		Card temp1 = (Card)(this.tableaus[c - 1].peek());
		if(temp1.getValue() == 1){
		    this.foundations[d - 1].push(this.tableaus[c - 1].pop());
		    System.out.println("Card " + temp1 + " was added from " + a + " " + c + " to " + b + " " + d);
		    if(this.tableaus[c - 1].isEmpty() == false){
			this.tableaus[c - 1].flipUp();
		    }
		}
		else{
		    System.out.println("A card can only be added to a foundation stack is it is type A");
		}
		
	    }

	    else if((this.tableaus[c - 1].isEmpty() == false) && (this.foundations[d - 1].isEmpty() == false)){
		Card temp2 = (Card)(this.tableaus[c - 1].peek());
		Card temp3 = (Card)(this.foundations[d - 1].peek());
		if( (temp2.getSuit() == temp3.getSuit()) && (temp2.getValue() == (temp3.getValue() - 1))){
		    this.foundations[d - 1].push(this.tableaus[c- 1].pop());
		    System.out.println("Card " + temp2 + " was added from " + a + " " + c + " to " + b + " " + d);
		    if(this.tableaus[c - 1].isEmpty() == false){
			this.tableaus[c - 1].flipUp();
		    }
		}
		else{
		    System.out.println("That Card cannot be added to that foundation");
		}
	    }

	}


	if((a == "foundation") && (b == "tableau")){//FOUNDATION TO THE TABLEAU
	    if(this.foundations[c - 1].isEmpty()){
		System.out.println("That Foundation is empty");
	    }

	    if((this.foundations[c - 1].isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == true)){
		Card temp4 = (Card)this.foundations[c - 1].peek();
		if(temp4.getSuit() == 13){
		    this.tableaus[d - 1].push(this.foundations[c - 1].pop());
		    System.out.println("Card " + temp4 + "was added from " + a + " " + c +" to " + b + " " + d);
		}
		else{
		    System.out.println("A card can only be added to an empty tableau if it is of the type K");
		}
	    }

	    else if((this.foundations[c - 1].isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == false)){
		Card temp5 = (Card)(this.foundations[c - 1].peek());
		Card temp6 = (Card)(this.tableaus[d - 1].peek());
		if(((temp6.getValue() - 1) == temp5.getValue()) && (temp5.isRed() != temp6.isRed())){
		    this.tableaus[d - 1].push(this.foundations[c - 1].pop());
		    this.tableaus[d - 1].flipUp();
		    System.out.println("Card " + temp5 + "was added from " + a + " " + c +" to " + b + " " + d);
		}
		else{
		    System.out.println("You cannot add that card to that tableau");
		}
	    }
	}

	if((a == "tableau") && (b == "tableau")){//tableau to TABLEAU
	    if(this.tableaus[c - 1].isEmpty()){
		System.out.println("That tableau you are moving from is already empty");
	    }
	    
	    if((this.tableaus[c - 1].isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == true)){
		Card temp7 = (Card)(this.tableaus[c - 1].peek());
		if(temp7.getValue() == 13){
		    this.tableaus[d - 1].push(this.tableaus[c - 1].pop());
		    System.out.println("Card " + temp7 + "was added from " + a + " " + c +" to " + b + " " + d);
		    if(this.tableaus[c - 1].isEmpty() == false){
			this.tableaus[c - 1].flipUp();
		    }
		}
		else{
		    System.out.println("A card can only be added to an empty tableau if it is of the type K");
		}
	    }

	    else if((this.tableaus[c - 1].isEmpty() == false) && (this.tableaus[d - 1].isEmpty() == false)){
		Card temp8 = (Card)(this.tableaus[c - 1].peek());
		Card temp9 = (Card)(this.tableaus[d - 1].peek());
		if( ((temp9.getValue() - 1) == temp8.getValue()) && (temp8.isRed() != temp9.isRed())){
		    this.tableaus[d - 1].push(this.tableaus[c - 1].pop());
		    System.out.println("Card " + temp8 + " was added from " + a + " " + c + " to " + b + " " + d);
		    if(this.tableaus[c - 1].isEmpty() == false){
			this.tableaus[c - 1].flipUp();
		    }
		}
		else{
		    System.out.println("This card cannot be moved over to that Tableau");
		}
	    }

	}
    }
			
							       
				      
		    
									  
    public boolean checkWin(){
	boolean ans = true;

	if(this.waste.isEmpty() && this.stock.isEmpty()){
	    for(int i = 0; i < 4;i++){
		Card temp = (Card)(this.foundations[i].peek());
		if(temp.getValue() != 13){
		    ans = false;
		}
	    }   
	}

	else{
	    ans = false;
	}
	return ans;
    }

    /**
     *Move method for a two indexed stacks with multiple cards
     *@param String a the name of the stack you are moving from
     *@param String b the name of the stack you are moving to
     *@param int c the number stack of the indexed stack you are moving from
     *@param int d the number stack of the indexed stack you are moving to
     *@param int amount the number of cards being transferred
     */

    
	
	
    public void moveN(String a, String b, int c, int d, int amount){
	if(amount == 1){
	    this.Move(a,b,c,d);
	}

	else if( (amount > 1) && (this.tableaus[c - 1].isEmpty() == true)){
	    System.out.println("The Tableau You are Pulling From is Empty");
	}

	else if( amount > (this.tableaus[c - 1].size())){
	    System.out.println("The Amount you are trying to draw from the first Tableau is too high");
	}

	else if( (amount > 1) && (amount <= (this.tableaus[c-1].size())) &&(this.tableaus[c - 1].isEmpty() == false)){


	    if(this.tableaus[d - 1].isEmpty() == true){//need a king to move here
		CardStack temp1 = new CardStack('w');//count here
		Card temp2 = (Card)(this.tableaus[c - 1].peek());
		int counter = amount;

		while(counter > 0 && (temp2.isFaceUp() == true)){
		    temp1.push(this.tableaus[c - 1].pop());
		    counter--;
		    temp2 = (Card)(this.tableaus[c - 1].peek());
		}

		if(temp1.size() < amount){//amount of cards poppped does not fill the array
		    System.out.println("The amount of faceup Cards in the tableau you are trying to move from is less than the number of Cards You are trying to move to");
		    while(temp1.isEmpty() == false){
			this.tableaus[c - 1].push(temp1.pop());
		    }
		}

		else if( ((Card)(temp1.peek())).getValue() != 13){
		    System.out.println("You can only move a King to an empty Tableau");
		    while(temp1.isEmpty() == false){
			this.tableaus[c - 1].push(temp1.pop());
		    }
		}

		else if( ((Card)(temp1.peek())).getValue() == 13){
		    while(temp1.isEmpty() == false){
			this.tableaus[d - 1].push(temp1.pop());
		    }
		    System.out.println("The Cards have been moved to the empty Tableau");
		    if(this.tableaus[c -1].isEmpty() == false){
			this.tableaus[c - 1].flipUp();
		    }
		}
	    }
	    
	    else if(this.tableaus[d - 1].isEmpty() == false){
		CardStack temp3 = new CardStack('w');
		Card temp4 = (Card)(this.tableaus[c - 1].peek());
		int counter2 = amount;

		while((counter2 > 0) && (temp4.isFaceUp() == true)){
		    temp3.push(this.tableaus[c - 1].pop());
		    counter2--;
		    temp4 = (Card)(this.tableaus[c - 1].peek());
		}

		if(temp3.size() < amount){
		    System.out.println("The amount of FaceUp Cards in the Tableau you are pulling from is less han the number of Cards You are trying to move to");
		    while(temp3.isEmpty() == false){
			this.tableaus[c - 1].push(temp3.pop());
		    }
		}

		else{
		    Card temp5 = (Card)(temp3.peek());
		    Card temp6 = (Card)(this.tableaus[d - 1].peek());

		    if(((temp6.getValue() - 1) == temp5.getValue()) && (temp6.isRed() != temp5.isRed())){
			while(temp3.isEmpty() == false){
			    this.tableaus[d - 1].push(temp3.pop());
			}
			System.out.println("The Cards  have been moved to the empty Tableau");
			if( this.tableaus[c - 1].isEmpty() == false){
			    this.tableaus[c - 1].flipUp();
			    
			}

		    }
		    else{
			System.out.println("Those cards cannot be moved there");
			while(temp3.isEmpty() == false){
			    this.tableaus[c - 1].push(temp3.pop());
			}
		    }
		}
	    }
	    
	}


          
    }
    

    
    

    
    
    
    public static void main(String [] args){
	Stackotaire a = new Stackotaire();
	a.initialize();
	Scanner scanner = new Scanner(System.in);

	while(1==1){
	    // a.moveAuto();
	    a.displayGameBoard();
	    System.out.println();
	    //  a.moveAuto();
	    System.out.print("Enter a command: ");
	    String a1 = scanner.nextLine();
	    String a2 = a1.toLowerCase();
	    if(a2.equals("quit")){
		System.out.print("Do You Want to Quit? (Y/N):");
		String q1 = scanner.nextLine();
		String q2 = q1.toLowerCase();
		if(q2.equals("y")){
		    System.out.println("Sorry, You Lose\n\nProgram Terminating Normally . . .");
		    a.moveAuto();
		    break;
		}
		else{
		    System.out.println();
		    }
	    }

	   
	    

	    if(a2.equals("draw")){
		a.Draw();
	    }
	    


	    if(a2.length() > 5){
		if(a2.equals("restart")){
		    System.out.print("Do you want to Start a new Game?(Y/N)");
		    String r1 = scanner.nextLine();
		    String r2 = r1.toLowerCase();
		    if(r2.equals("y")){
			System.out.println("Sorry, You Lose. Starting a New Game\n");
			a.initialize();
			//a.moveAuto();
		    }
		    else{
			System.out.println("Well then, Let's continue\n");
		    }
		}
		
	    
	    
	   
		else if(a2.substring(0,5).equals("moven")){
		    //DESIGN MOVE N
		    if((((a2.substring(6,7)).equals("t")) == false) ||(((a2.substring(9,10)).equals("t")) == false)){
			System.out.println("You can only MoveN between two Tableau:");
		    }
		    else{
			int n1 = Integer.parseInt(a2.substring(7,8));
			int n2 = Integer.parseInt(a2.substring(10,11));
			int	n3 = Integer.parseInt(a2.substring(12,13));
			a.moveN("tableau", "tableau", n1, n2, n3);
			a.moveAuto();
		    }
		    
		    
		}
		
		else if(a2.substring(0,8).equals("automove")){
		    System.out.println("Auto Move Function aid is now on.\nEnter autoMove again to toggle off");
		    a.toggleAuto();
		    a.moveAuto();
		}
		
		
		
		else if(a2.substring(0,5).equals("move ")){
		    //DESIGN MOVE
		    String s1 = a2.substring(5,6);
		    String s2;
		    String i1;
		    String i2;
		    int m1;
		    int m2;
		    if(s1.equals("w")){
			i1 = "waste";
			s2 = a2.substring(7,8);
			if(s2.equals("f")){
			    i2 = "foundation";
			}
			else if(s2.equals("t")){
			    i2 = "tableau";
			}
			else{
			    System.out.println("You cannot move from the waste to what you have entered");
			    break;
			}
			m1 = Integer.parseInt(a2.substring(8,9));
			a.Move(i1,i2,m1);
			a.moveAuto();
		    }
		    
		    else if(s1.equals("t")){
			i1 = "tableau";
			s2 = a2.substring(8,9);
			m1 = Integer.parseInt(a2.substring(6,7));
			if(s2.equals("w")){
			    i2 = "waste";
			    a.Move(i1, i2, m1);
			    a.moveAuto();
			}
			else if(s2.equals("t")){
			    i2 = "tableau";
			    m2 = Integer.parseInt(a2.substring(9,10));
			    a.Move(i1, i2, m1, m2);
			    a.moveAuto();
			}
			
			else if(s2.equals("f")){
			    i2 = "foundation";
			    m2 = Integer.parseInt(a2.substring(9,10));
			    a.Move(i1,i2,m1,m2);
			    a.moveAuto();
			}
			
		    }
		    
		    else if(s1.equals("f")){
			i1 = "foundation";
			s2 = a2.substring(8,9);
			m1 = Integer.parseInt(a2.substring(6,7));
			if(s2.equals("w")){
			    i2 = "waste";
			    a.Move(i1, i2, m1);
			    a.moveAuto();
			}
			else if(s2.equals("t")){
			    i2 = "tableau";
			    m2 = Integer.parseInt(a2.substring(9,10));
			    a.Move(i1,i2,m1,m2);
			    a.moveAuto();
			}
		    }
	    
		    else{
			System.out.println("Incorrect Input");
		    }
		
		}

	    }
	    
		
	}
	
		   
	
	
	
	
    }
    
}














