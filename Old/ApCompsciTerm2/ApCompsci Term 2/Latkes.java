public class Latkes{

    private String [] _stack;
    private int _stackSize;

    //constructor
    public Latkes(int size){
	_stack = new String[size];
	for(int i = 0; i < size - 1;i++){
	    _stack[i] = "";
	}
	_stackSize = size;
    }

    //means of insertion
    public void push(String s){
	if (isEmpty())
	    _stack[++_stackSize] = s;
	else{ 
	    String[] newstack = new String[(_stackSize + 1) * 2];
	    for(int i = 0; i <= _stackSize; i++){
		newstack[i] = _stack[i];
	    }
	    _stack = newstack;
	    stack[++_stackSize] = s;
	}


    }


    //means of removal
    public String pop(){
	_stack[_StackSize--] = null;
}

   



    //check for emptiness
    public boolean isEmpty(){
	boolean ans = true;
	for(int i = 0; i < size - 1; i++){
	    if(_stack[i] != ""){
		ans = false;
		break;
	    }
	}
	return ans;
    }
    




    //check for fullness
    public boolean ifFull(){
	boolean ans = true;
	for(int i = 0; i < size - 1; i++){
	    if(_stack[i] = ""){
		ans = false;
		break;
	    }
	}
	return ans;
    }


    public static String flip (String word){
	int num = word.length();
	Latkes L1 = new Latkes(num);
	for(int i = 0; i < num; i++){
	    L1.push( word.substring(i, i + 1));
	}

	String retStr = "";
	for(int i = 0; i < num; i++){
	    retStr += L1.pop();
	}
	return retStr;
 



    }


    //lisa.stuy.edu/~mykolyk/ap2