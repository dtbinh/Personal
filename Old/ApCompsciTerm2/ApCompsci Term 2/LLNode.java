//Ronald Balchand
//MKS22-Pd#8
//HW#12
public class LLNode {

    private Object _value;
    private LLNode _nextNode;

    // constructor
    public LLNode( Object value, LLNode next ) { 
    _value = value;    // value refers to the "car" we discussed in class earlier, by which it is what is revealed
    _nextNode = next;     // nxt, refers to the "cdr", we discussed, by which it "opens up a door to the next
    
    
    
    }

    // accessor methods
    public Object getValue() {
    return _value;                //BAM
    }

    public LLNode getNext() { 
    return _nextNode;              //BAM
    }

    // mutator methods
    public Object setValue( Object newValue ) { 
    Object temp = _value;
    _value = newValue;
    return temp;               //BOOM
    }

    public LLNode setNext( LLNode newNext ) { 
    LLNode temp = _nextNode;
    _nextNode = newNext;
    return temp;                   //BOOM
       
    }

    // overwrite toString
    public String toString() { 
	return _value.toString();//object, value is an object, and you can call its toString method
	//
    }


    public static void main( String[] args ) {
	LLNode first = new LLNode("fee", null);
	first.setNext(new LLNode("fye", null));
	first.getNext().setNext( new LLNode( "cow", null));
 
	LLNode temp = first;
	while(temp != null){
	    System.out.println(temp);
	    temp = temp.getNext();
	}

	    //     

	    
	    //       task: a) Use methods above to create a linked list of >= 3 nodes
 //       b) After (a), traverse the list to print each node
	
	
    }//end main
    
}//end class LLNode



//LLnode first = new LLnode("fee", null);
//first.setnext(new LLNode("fye", null));
//first.getnext().setnext(  new LLNode( "cow", null));
