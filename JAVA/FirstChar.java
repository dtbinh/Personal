import java.util.Scanner;
import java.util.ArrayList;
public class FirstChar{
    public String f(ArrayList o){
	String ans = "";
	    for(int i = 0; i < o.size(); i++){
		ans+= o.get(i).charAt(0);
	    }
	return ans;
    }

    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	ArrayList o = new ArrayList(3);
	o.add("Hello");
	o.add("world");
	o.add("goodbye");
	System.out.println(f(o));
    }
}
