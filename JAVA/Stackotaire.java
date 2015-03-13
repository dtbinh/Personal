/**
 *Ronald Balchand
 **109806273
 *Assignment # 3
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald
 */


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

    


    public void initialize(){
	while(this.stock.size() != 0){
	    this.main.push(this.stock.pop());
	}
	while(this.waste.size() != 0){
	    this.main.push(this.waste.pop());
	}
	for(int i1 = 0; i1 < 7; i1++){
	    while(this.tableaus[i1].size() != 0){
		this.main.push(this.tableaus[i1].pop());
	    }
	}
	for(int i2 = 0; i2 < 4; i2++){
	    while(this.foundations[i2].size() != 0){
		this.main.push(this.foundations[i2].pop());
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
	    System.out.print("        ");
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


    public int render(){
	int ans = 0;
	for(int i = 0; i < 3; i++){
	    if(foundations[i].isEmpty() == true){
		if(this.waste.isEmpty() == false){
		    Card temp1 = (Card)(this.waste.peek());
		    if(temp1.getSuit() == 'A'){
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
    

    public void toggleAuto(){
	if(this.auto == true){
	    this.auto = false;
	}
	else{
	    this.auto = true;
	}
    }

    public boolean getAuto(){
	return this.auto;
    }

    public void moveAuto(){
	if(this.getAuto() == true){
	    while(this.render() == 1){
	    }
	}
    }
    
    public void Draw(){
	if(this.stock.isEmpty() == false){
	    this.waste.push(this.stock.pop());
	}
    }


    public void Move(String a, String b, int c, int d){
    }
	



	
	public static void main(String [] args){
	    Stackotaire a = new Stackotaire();
	    //a.main.printStack();
	    a.initialize();
	    //  a.main.printStack();
	    //      a.tableaus[6].printStack();
	    //System.out.println(a.main.size());
	     a.displayGameBoard();
	     a.toggleAuto();
	     a.moveAuto();
	     a.Draw();
	     //a.Draw();
	     a.displayGameBoard();
	     a.Draw();
	     a.moveAuto();
	     a.displayGameBoard();
	     
	     Card temp = (Card)a.tableaus[3].peek();
	     Card temp2 = (Card)a.tableaus[4].peek();
	     
	     System.out.println(temp.getValue() == temp2.getValue());
	}

    
}















