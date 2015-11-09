import java.util.Scanner;
public class RecursionExercise{


    public static int sumDigits(int n){
	if((n % 10) < 1){
	    return n;
	}
	else{
	    return ((n%10) + sumDigits(n/10));
	}
    }

    public static int largest(int [] a){
	int max = a[0];
	int c = a.length;
	int current = 0;
	return largestHelper(max, a, current, c);
    }

    public static int largestHelper(int max, int [] array, int h, int d){
	if(!(h < d)){
	    return max;
	}
	else{
	    return largestHelper(maxx(max, array[h]), array, h+1, d);
	}
    }

    public static int maxx(int a, int b){
	if(a > b){
	    return a;
	}
	else{
	    return b;
	}
    }


    public static int numCaps(String a){
	if(a.length() < 1){
	    return 0;
	}
       		
	else if(Character.isUpperCase(a.charAt(0))){
	    return 1 + numCaps(a.substring(1));
	}
	else{
	    return 0 + numCaps(a.substring(1));
	}

    }
    

    public static void main(String [] args){
	System.out.print("Enter an integer and ill give you the sum of its digits: ");
	Scanner scanner = new Scanner(System.in);
	int a = scanner.nextInt();
	System.out.println("Sum of the digits in " + a + " is " +sumDigits(a));
	System.out.println("Please enter a set of 5 digits and I'll return the largest one: ");
	int [] array = new int[5];
	for(int i = 0; i < 5; i++){
	    array[i] = scanner.nextInt();
	}
	System.out.println("The largest integer in this set is " + largest(array));
	System.out.println("Enter a String ans ill tell yo how many Capital Letters there are: ");
	String b = scanner.next();
	System.out.println("The number of Capital letters in " + b + " is " + numCaps(b));
	
	
    }













}
