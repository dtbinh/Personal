public class Ackermann{


    static long Ackermann(int m, long n){
	if(m==0){
	    return n+1;
	}
	if(n==0){
	    return Ackermann(m-1,1);
	}
	return Ackermann(m-1, Ackermann(m,n-1));
    }

    public static void main(String [] args){
	System.out.println(Ackermann(3,3));
    }
}
