//RONALD BALCHAND
//109806273
// HW #8
import java.util.Scanner;
import java.util.ArrayList;
public class BinaryParse{
    
    public static int parseBinary(String a){
	if(a.length() == 1){
	    return Integer.parseInt(a);
	}
	else{
	    return (10 * (Integer.parseInt(a.substring(0,1)))) + parseBinary(a.substring(1));
	}
    }


    public static int parseBinaryHelper(int a, int size){
	if(a == 0){
	    return 0;
	}
	else{
	    return a%10 * (int)Math.pow(2,size) + parseBinaryHelper((int)a/10,size-1);
	}
    }

    public static String[] toStringArray(String a){
	String ans[] = new String[a.length()];
	for(int i = 0; i < a.length(); i++){
	    ans[i] = a.substring(i, i+1);
	}
	return ans;
    }
    public static void stringPermutations(String a){
	String[] b = toStringArray(a);
	ArrayList<String> strings = new ArrayList<String>();
	for(int i  = 0; i < a.length(); i++){
	    strings.add((b[i]));
	}
	ArrayList<ArrayList<String>> ans = permutations(strings);
	for(ArrayList<String> onePerm: ans){
	    for(String e: onePerm){
		System.out.print(e);
	    }
	    System.out.println();
	}
	

    }

    public static ArrayList<ArrayList<String>> permutations(ArrayList<String> a){
	ArrayList<ArrayList<String>> perms = new ArrayList<ArrayList<String>>();
	if(a.isEmpty()){
	    ArrayList<String> onePerm = new ArrayList<String>();
		      perms.add(onePerm);
		      return perms;
	}
	
		for(String oneElem: a){
		    ArrayList<String> b = (ArrayList<String>)(a.clone());
		    b.remove(oneElem);
		    ArrayList<ArrayList<String>> perms2 = permutations(b);
		    for(ArrayList<String> onePerm: perms2){
			onePerm.add((String)oneElem);
			perms.add(onePerm);
		    }
		}
	    return perms;
    }

    public static int largest(int[] array){
	int a = array.length;
	int b = 0;
	return largestHelper(array, a, b, 0);
    }

    public static int largestHelper(int [] arr, int size, int current, int max){
	if (current == size-1){
	    return max;
	}
	else{
	    if(arr[current] > arr[current + 1]){
		max = arr[current];
	    }
	    return largestHelper(arr, size, current+1 , max);
	}
    }

    public static int max(int a, int b){
	if(a > b){
	    return a;
	}
	else{
	    return b;
	}
    }

    public static int count(char[] array, char ch){
	int a  = 0;
	return count(array, ch, 0);
    }
    public static int count(char[] array, char ch, int high){
	if(high == array.length){
	    return 0;
	}
	else if(array[high] == ch){
	    return 1 + count(array, ch, high + 1);
	}
	else{
	    return 0 + count(array, ch, high +1);
	}
    }									
    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	System.out.println("Enter a Binary number:");
	String a = scanner.next();
	System.out.println(parseBinary(a));
	System.out.println("Now enter a String to be permutated:");
	String bruh = scanner.next();
	stringPermutations(bruh);
	System.out.println("Enter a set of 5 numbers and ill find the largest: ");
	int [] array = new int[5];
	for(int i = 0; i < array.length; i++){
	    array[i] = scanner.nextInt();
	}
	System.out.println("The largest one in this set is: " + largest(array));
	System.out.println("Now enter an array of ten characters");
	String b = scanner.next();
	char [] array2 = b.toCharArray();
	System.out.println("Which character would you like to find how many instances thereare of in this array?: ");
	String c = scanner.next();
	char [] array3 = c.toCharArray();
	char ch = array3[0];
	System.out.println(count(array2, ch));
	
			   
	scanner.close();
	
    }	
	
    
}
