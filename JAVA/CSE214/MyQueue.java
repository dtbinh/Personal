import java.util.Scanner;

public class MyQueue{

    private int[] myQueue;
    private int next;
    private int last;
    private int numberOfElements;


    public MyQueue(){
	this.myQueue = new int [10];
	this.next = 9;
	this.last = 9;
	this.numberOfElements = 0;
    }

    public boolean add(int a){
	if (this.numberOfElements == 10){
	    System.out.println("Sorry but the Queue is Full");
	    return false;
	}

	else{
	    this.myQueue[this.last] = a;
	    this.last--;
	    this.numberOfElements++;
	    System.out.println("Integer " + a + " was added to the end of the queue");
	    return true;
	}
    }

    public int element(){
	return this.myQueue[this.next];
    }

    
    public boolean offer(int a){
	if(this.numberOfElements == 10){
	    System.out.println("Sorry but the queue is Full");
	    return false;
	}

	else{
	    this.myQueue[this.last] = a;
	    this.last--;
	    this.numberOfElements++;
	    System.out.println("Integer " + a + " was added to the end of the queue");
	    return true;
	}
    }



    public int peek(){
	if(this.numberOfElements > 0){
	    return this.myQueue[this.next];
	}
	else{
	    System.out.println("The Queue is empty");
	    return -1;
	}
    }



    public int poll(){
	if(numberOfElements == 0){
	    System.out.println("The Queue is empty");
	    return -1;
	}
	else{
	    int ans = this.myQueue[this.next];
	    this.myQueue[this.next] = -1;
	    this.next--;
	    this.numberOfElements--;
	    return ans;
	}
    }

    public int remove(){
	int ans = this.myQueue[this.next];
	this.myQueue[this.next] = -1;
	this.next--;
	this.numberOfElements--;
	return ans;
    }


    
    

    public void printQueue(){
	for(int i = 0; i < this.myQueue.length; i++){
	    System.out.print(this.myQueue[i] + ", ");
	}
    }


    public static void main(String [] args){
	MyQueue line = new MyQueue();
	line.peek();
	line.add(12);
	line.add(13);
	line.add(56);
	line.add(21);
	line.add(123);
	line.add(213);
	line.add(67);
	line.add(214);
	line.add(678);

	System.out.println(line.poll());
	line.printQueue();
	System.out.println();
	System.out.println(line.poll());
        line.remove();
	line.printQueue();
    }
}
