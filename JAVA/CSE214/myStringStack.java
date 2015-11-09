//Ronald Balchand
//109806273

public class myStringStack{
    private String[] myStringStack;
    private int topOfStack;
    private int stackSize;


    public myStringStack(){
	this.myStringStack = new String[10];
	this.topOfStack = 0;
	this.stackSize = 10;
    }

    public myStringStack(int size){
	this.myStringStack = new String[size];
	this.topOfStack = 0;
	this.stackSize = size;
    }

    public int getStackSize(){
	return this.stackSize;
    }

    public String peek(){
	return this.myStringStack[topOfStack - 1];
    }

    public void push(String a){
	if(this.topOfStack  == this.stackSize){
	    System.out.println("Sorry but the stack is full");
	}
	else{
	    this.myStringStack[topOfStack] = a;
	    this.topOfStack++;
	}
    }

    public String pop(){
	String a = this.myStringStack[topOfStack - 1];
	this.myStringStack[topOfStack - 1] = null;
	topOfStack--;
	return a;
    }

    public void popAll(){
	if (topOfStack == 0){
	    System.out.println("This is empty faggot");
	}
	else{
	    while(this.topOfStack != 0){
		System.out.println(this.pop());
	    }
	}
    }
    public static void main(String [] args){
	myStringStack a = new myStringStack(5);
	a.push("R");
	a.push("O");
	a.push("N");
	a.push("A");
	a.push("L");
	//	for(int i = 0; i < a.stackSize; i++){
	//  System.out.println(a.peek());
	//}
	//System.out.println(a.pop());
	//	System.out.println(a.peek());
			   
	//a.push("L");
	a.popAll();
	//System.out.println(a.topOfStack);
	
    }
}

			    
