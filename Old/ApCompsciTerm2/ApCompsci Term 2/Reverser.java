public class Reverser {

    public static LLNode<T> reverse( LLNode<T> n ) {
	Stack<T> foo = new LLStack<T>();
	while( n.getNext != null ) {

	}
    }

    public static String recPrint( LLNode<Integer> node ) {
	String retStr = "";
	while( node.getNext() != null ) {
	    System.out.println("curr node val: " + node.getValue() );
	    retStr += " " + node.getValue();
	    node = node.getNext();
	}
	retStr += " " + node.getValue();
	return retStr;
    }

    public static void main( String [] args ) {
	LLNode<Integer> head = 
	    new LLNode<Integer>( 1, 
                new LLNode<Integer>(2,
                    new LLNode<Integer>(3, 
                        new LLNode<Integer>(4,
			    new LLNode<Integer>(5, null)))));

	System.out.println( recPrint(head) );
    }

}//end class JohnDoe
