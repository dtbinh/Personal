//RONALD BALCHAND
//STONYBROOK UNIVERSITY
//109806273
//CSE 114
//FINAL PROJECT
//24GAME

import java.util.Scanner;
import java.util.ArrayList;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

public class TwentyFourGame{

    public static ArrayList<ArrayList<Double>> permutations(ArrayList<Double> a){
	ArrayList<ArrayList<Double>> perms = new ArrayList<ArrayList<Double>>();
	if(a.isEmpty()){
	    ArrayList<Double> onePerm = new ArrayList<Double>();
	    perms.add(onePerm);
	    return perms;
	}

	for(Object oneElem: a){
	    ArrayList<Double> b = (ArrayList<Double>)(a.clone());
	    b.remove(oneElem);
	    ArrayList<ArrayList<Double>> perms2 = permutations(b);
	    for(ArrayList<Double> onePerm: perms2){
		onePerm.add((Double)oneElem);
		perms.add(onePerm);
	    }
	}
	return perms;
    }





    public static void outerParenthesis(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
   	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "(";
			    ans += a.get(i).get(0) + operator1[c1] + a.get(i).get(1) + operator2[c2] + a.get(i).get(2) + operator3[c3] + a.get(i).get(3) + ") ";
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }


    public static void innerParenthesis(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "(";
			     ans += a.get(i).get(0) + operator1[c1] + a.get(i).get(1) + ") " + operator2[c2] + " ( " + a.get(i).get(2) + operator3[c3] + a.get(i).get(3) + ") ";
			     if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }



    

    public static void threeFirst(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "( ";
			    ans += a.get(i).get(0) + operator1[c1] + a.get(i).get(1)  + operator2[c2]  + a.get(i).get(2) + " ) " + operator3[c3] + a.get(i).get(3);
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }

    
    public static void threeSecond(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = " ";
			    ans += a.get(i).get(0) + operator1[c1] + " ( " + a.get(i).get(1)  + operator2[c2]  + a.get(i).get(2) + operator3[c3] + a.get(i).get(3) + ")" ;
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }

    public static void onlyInner(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "";
			    ans += a.get(i).get(0) + operator1[c1]  + "(" +  a.get(i).get(1)   + operator2[c2]  + a.get(i).get(2) + ")" + operator3[c3] + a.get(i).get(3) ;
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }


    public static void firstOnly(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "(";
			    ans += a.get(i).get(0) + operator1[c1]   +  a.get(i).get(1) + ")"   + operator2[c2]  + a.get(i).get(2) + operator3[c3] + a.get(i).get(3) ;
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }


    public static void lastOnly(ArrayList<ArrayList<Double>> a){
	try{
	    ScriptEngineManager manager = new ScriptEngineManager();
	    ScriptEngine engine = manager.getEngineByName("JavaScript");
	    String [] operator1 = {" + "," - ", " * "," / "};
	    String [] operator2 = {" + "," - ", " * "," / "};
	    String [] operator3 = {" + "," - ", " * "," / "};
	    for(int c1 = 0; c1 < operator1.length; c1++){
		for(int c2 = 0; c2 < operator2.length; c2++){
		    for(int c3 = 0; c3 < operator3.length;c3++){
			for(int i = 0; i < a.size(); i++){
			    String ans = "";
			    ans += a.get(i).get(0) + operator1[c1]   +  a.get(i).get(1)   + operator2[c2]  + "(" + a.get(i).get(2) + operator3[c3] + a.get(i).get(3) + ")";
			    if(((Double)engine.eval(ans) > 23.99) && ((Double)engine.eval(ans) < 24.11)){
				System.out.print( ans + " = " + engine.eval(ans));
				System.out.println();
				break;
			    }
			}
		    }
		}
	    }
	}catch(Exception err){
	    System.out.println("Wrong");
	}
	System.out.println("\n\n");
    }
    
    
	
    
    
	

    
	
	

    
    public static void main(String [] args){
	Scanner scanner = new Scanner(System.in);
	System.out.println("Enter 4 numbers:");
	ArrayList<ArrayList<Double>> inputs = new ArrayList<ArrayList<Double>>();
	int i = 0;
	//String a = "8.0/(3.0-8.0/3.0)";
	while(1 == 1){
	    ArrayList<Double> a = new ArrayList <Double>();
	    a.add((Double)(scanner.nextDouble()));
	    a.add((Double)(scanner.nextDouble()));
	    a.add((Double)(scanner.nextDouble()));
	    a.add((Double)(scanner.nextDouble()));
	    inputs.add(a);
	    ArrayList<ArrayList<Double>> perms = permutations(inputs.get(i));
	    outerParenthesis(perms);
	    innerParenthesis(perms);
	    threeFirst(perms);
	    threeSecond(perms);
	    onlyInner(perms);
	    firstOnly(perms);
	    lastOnly(perms);
	    i++;
	    System.out.println("\n\nIf there arent any solutions printed above then the numbers you input cannot equal 24 in any way:\n You can try and enter four more numbers and my magical machine will try again:\n\n" );
	}
	
       
    }
}


