import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import java.util.Scanner;
import java.util.ArrayList;


public class EnginePractice{
    

    public static String addStringMaker(double a1, double a2, double a3, double a4){
	String ans = "(" + a1 + " + " + a2 + " + " + a3 + " + " + a4 + ")";
	return ans;
    }
    
    public static String multiplyStringMaker(double a1, double a2, double a3, double a4){
	String ans = a1 + " * " + a2 + " * " + a3 + " * " + a4;
	return ans;
    }

    public static ArrayList<String> multiply(double a1, double a2, double a3, double a4){
	ArrayList<String> ans = new ArrayList<String>(5);
	ans.add("(" + a1 + " * " + a2 + " * " + a3 + " * " + a4 + ")");
	ans.add("(" + a1 + " * " + a2 + ")" + " * " + "(" + a3 + " * " + a4 + ")");
	ans.add("(" + a1 + " * " + a2 + " * " + a3 + ")" + " * " + a4);
	ans.add("(" + a1 + " * " + "(" + a2 + " * " + a3 + " * " + " * " + a4 + "))");
	ans.add("(" + a1 + " * " + "(" + a2 + " * " + a3 + ")" + " * " + a4 + ")");
	return ans;
    }
		
    
	

    
    public static void main(String [] args){
	try{
	    Scanner scanner = new Scanner(System.in);
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String infix = "3+2*(4+5)";
	    System.out.println(infix + " = " + engine.eval(infix));
	    System.out.println("Enter 4 numbers and I'll add them all up");
	    double a1 = scanner.nextDouble();
	    double a2 = scanner.nextDouble();
	    double a3 = scanner.nextDouble();
	    double a4 = scanner.nextDouble();
	    String adder = addStringMaker(a1,a2,a3,a4);
	    ArrayList<String> multiplier = multiply(a1,a2,a3,a4);
	    System.out.println(adder + " = " + engine.eval(adder) + "\n");
	    //System.out.println(multiplier + " = " + engine.eval(multiplier));
	    for(int i  = 0; i < 5; i++){
		System.out.println(multiplier.get(i) + " = " + engine.eval(multiplier.get(i)));
	    }
	    scanner.close();
	}
	catch(Exception err){
	    System.out.println("Wrong");
	}
    }
    
    
}
