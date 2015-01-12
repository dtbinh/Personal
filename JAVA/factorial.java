
//RONALD BALCHAND
//109806273

import java.util.Scanner;

public class Factorial{
    public static int recursiveFactorial(int n){
	if(n == 0){
	    return 1;
	}
	else {
	    return n * (recursiveFactorial(n-1));
	}
    }

    public static int iterativeFactorial(int n){
	int ans = 1;
	for(int i = n; i > 0; i--){
	    ans *= i;
	}
	return ans;
    }

    public static void reverseDisplay(String value){
	if(value.length() > 0){
	    System.out.print(value.charAt(value.length() - 1));
	    reverseDisplay(value.substring(0, value.length()-1));
	    
	}
	
    }

    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	System.out.println("Enter a number and ill compute the factorial");
	int n = scanner.nextInt();
	System.out.println("Factorial of " + n + ": " + recursiveFactorial(n));
	System.out.println("Factorial of " + n + ": " + iterativeFactorial(n));
	reverseDisplay("break");
	
	
    }
}
