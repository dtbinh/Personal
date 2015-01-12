import java.util.Scanner;
import java.util.ArrayList;
    
public class Permutations{

    public static ArrayList<ArrayList<Object>> permutations(ArrayList<Object> a){
	ArrayList<ArrayList<Object>> perms = new ArrayList<ArrayList<Object>>();
	if(a.isEmpty()){
	    ArrayList<Object> onePerm = new ArrayList<Object>();
	    perms.add(onePerm);
	    return perms;
	}

	for(Object oneElem: a){
	    ArrayList<Object> b = (ArrayList<Object>)(a.clone());
	    b.remove(oneElem);
	    ArrayList<ArrayList<Object>> perms2 = permutations(b);
	    for(ArrayList<Object> onePerm: perms2){
		onePerm.add(oneElem);
		perms.add(onePerm);
	    }
	}
	return perms;
    }


	


    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	System.out.println("Enter 4 numbers and I'll give you all the possible orders of the numbers:");
	ArrayList<Object > a = new ArrayList <Object>();
	a.add((Integer)(scanner.nextInt()));
	a.add((Integer)(scanner.nextInt()));
	a.add((Integer)(scanner.nextInt()));
	a.add((Integer)(scanner.nextInt()));
	ArrayList<ArrayList<Object>> perms = permutations(a);
	for(ArrayList<Object> onePerm: perms){
	    for(Object e: onePerm){
		System.out.print(e);
	    }
	    System.out.println();
	}
    }
}
