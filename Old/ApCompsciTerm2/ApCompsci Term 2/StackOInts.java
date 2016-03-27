
public class StackOInts implements Stack<Integer> {

// 2 stacks: one for all numbers, one for min values
    private LLStack<Integer> _nums, _mins;


    public StackOInts() {
	_nums = new LLStack<Integer>();
	_mins = new LLStack<Integer>();
    }


    public void push( Integer num ) {
	// Always push a number onto nums (aka "main") stack
	_nums.push(num);

	// If the number being pushed is also a "relative" min,
	// push it onto the mins stack
	// ( _mins.peek() will always show the current "relative" min )
	if ( _mins.isEmpty() || num < _mins.peek() )
	    _mins.push(num);
    }


    public Integer pop() {
	// Pop() the first value from the main stack
	Integer foo = _nums.pop();

	// If the number being popped is also a "relative" min,
	// pop it from the mins stack
	if ( foo.equals( _mins.peek() ) )
	    _mins.pop();

	return foo;
    }


    public boolean isEmpty() { return _nums.isEmpty(); }

    public Integer peek()    { return _nums.peek(); }

    public Integer getMin()  { return _mins.peek(); }


    public static void main( String[] args ) {

	StackOInts wendy = new StackOInts();

	Integer[] nums = {9,5,10,42,2,4,1,6};

	for( Integer i : nums ) {
	    wendy.push(i);
	    System.out.println( " getMin() -> " + wendy.getMin() );
	}

	while( !wendy.isEmpty() ) {
	    System.out.println( "wendy.getMin() -> " + wendy.getMin() );
	    System.out.println( "wendy pop() -> " + wendy.pop() );
	}
    }

}//end class StackOInts