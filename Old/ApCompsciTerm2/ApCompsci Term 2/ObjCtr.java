// class ObjCtr (Object counter)
// For use with class WordFreq.
// Essentially a wrapper for an Object that contains 
// the freqency of the Object in a dataset 
public class ObjCtr implements Comparable{

    private int _frequency;
    private Object _value;

    public ObjCtr( Object obj, int frequency ) {
        _value = obj;
        _frequency = frequency;
    }

    public ObjCtr( Object obj ) {
        this( obj, 1 ); 
    }

    // mutator methods
    public void inc(){ _frequency++; }

    // accessor methods
    public Object getValue() { return _value; }

    public int getFrequency() { return _frequency; }

    //override compareTo(), to adhere to Comparable requirements
    public int compareTo( Object rightSide ){
        if ( ! (rightSide instanceof ObjCtr ) )
            throw new IllegalArgumentException();
	return getFrequency() - ( (ObjCtr)rightSide ).getFrequency();
    }

    public String toString() {
        return "Obj: " + _value + "\tw freq: " + _frequency;
    }

    public static void main(String[] args){
        ObjCtr hip = new ObjCtr("A");
        ObjCtr hop = new ObjCtr("B");

	System.out.println("Object counters initialized to");        
	System.out.println("hip: " + hip);
	System.out.println("hop: " + hop);

	System.out.println( "hip > hop?" );
        System.out.println( hip.compareTo(hop) );
        hip.inc();
	System.out.println( "now is hip > hop?" );
        System.out.println( hip.compareTo(hop) );
        hop.inc();        
	hop.inc();
	System.out.println( "now is hip > hop?" );
        System.out.println( hip.compareTo(hop) );

	System.out.println("Object counters post-op");        
	System.out.println("hip: " + hip);
	System.out.println("hop: " + hop);

    }
}//end ObjCtr
