/** 
 *Ronald Balchand
 *109806273
 *Assignment #7
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

import java.util.Scanner;
import latlng.LatLng;
import java.util.ArrayList;
import com.google.code.geocoder.*;
import com.google.code.geocoder.model.*;
import java.util.Comparator;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

 
public class SigmaAirDriver implements Serializable{
    
    public static void main(String [] args)throws Exception{
        SigmaAir a = new SigmaAir();
    
        try{
            FileInputStream file = new FileInputStream("./sigma_air.obj");
            ObjectInputStream fin = new ObjectInputStream(file);
            a = (SigmaAir) fin.readObject();
            fin.close();
        }catch(Exception ex){
            a = new SigmaAir();
            System.out.println("sigma_air.obj not found. Using new Sigma Air\n");            
        }
            
        while(1==1){
            System.out.print("Menu: \n---------\n");
            System.out.print("(A) Add City\n" + "(B) Add Connection\n" +"(C) Load all Cities\n" + "(D) Load all Connections\n" + "(E) Print all Cities\n" + "(F) Print all Connections\n" +"(G) Remove Connection\n" + "(H) Find Shortest Path\n" + "(Q) Quit)\n");
            Scanner scanner = new Scanner(System.in);
        
            String input = "-1"; 
            
            while(((!(input.equals("a"))) && (!(input.equals("b"))) && (!(input.equals("c"))) && (!(input.equals("d"))) && (!(input.equals("e"))) && (!(input.equals("f"))) && (!(input.equals("g"))) && (!(input.equals("h"))) && (!(input.equals("q"))))) {
                System.out.print("Enter a selection: ");
                String notYet = scanner.nextLine();
                String notYet2 = notYet.toLowerCase();
                
                if((!(notYet2.equals("a"))) && ((!(notYet2.equals("b")))) &&(!(notYet2.equals("c"))) && (!(notYet2.equals("d"))) && (!(notYet2.equals("q"))) && (!(notYet2.equals("e"))) && (!(notYet2.equals("f"))) && (!(notYet2.equals("g"))) &&(!(notYet2.equals("h")))){
                    System.out.println("Invalid input");
                }else{
                    input = notYet2;
                }
            }
            
            
            
            if(input.equals("q")){
                try{
                    FileOutputStream file = new FileOutputStream("./sigma_air.obj");
                    ObjectOutputStream fout = new ObjectOutputStream(file);
                    fout.writeObject(a);
                    fout.close();
                    System.out.println("\n Sigma Air is saved into file sigma_air.obj\n Program terminating normally...\n");
                }catch(Exception ex){
                    System.out.println("Problem saving");  
                }
                break;
            }
            
            if(input.equals("a")){
                try{
                    System.out.print("Enter the name of the city: ");
                    String name = scanner.nextLine();
                    a.addCity(name);
                }catch(Exception ex){
                    System.out.println("Something went wrong here");
                }
            }
            
            if(input.equals("b")){
                try{
                    System.out.print("Enter the source city: ");
                    String src = scanner.nextLine();
                    System.out.print("Enter the destination city: ");
                    String dest = scanner.nextLine();
                    a.addConnection(src, dest);
                }catch(Exception ex){
                    System.out.println("Something went wrong here");
                    
                }
            }
            
            if(input.equals("g")){
                try{
                    System.out.print("Enter the source city: ");
                    String src1 = scanner.nextLine();
                    System.out.print("Enter the destination city: ");
                    String dest1 = scanner.nextLine();
                    a.removeConnection(src1, dest1);
                }catch(Exception ex){
                    System.out.println("Something went wrong here");
                }
            
            
            }
            
            if(input.equals("e")){
                System.out.println("Something");
                try{
                    String sort = "-1";
                    System.out.print("\n(EA) Sort Cities by Name \n(EB) Sort Cities by Latitude \n(EC) Sort Cities by Longitude \n(Q) Quit)\n");
                    while((!(sort.equals("ea"))) && (!(sort.equals("eb"))) && (!(sort.equals("ec"))) && (!(sort.equals("q")))){
                        System.out.print("Enter a selection: ");
                        String sort1 = scanner.nextLine();
                        String sort2 = sort1.toLowerCase();
                        
                        if((!(sort2.equals("ea"))) && ((!(sort2.equals("eb")))) &&(!(sort2.equals("ec"))) && (!(sort2.equals("q")))){
                        System.out.println("Invalid Input");
                        }
                        else{
                            sort = sort2;
                        }
                    }
                
                    if(sort.equals("ea")){
                        a.printAllCities("a");

                    }   
                
                    if(sort.equals("eb")){
                        a.printAllCities("b");
                    }
                
                    if(sort.equals("ec")){
                        a.printAllCities("c");
                    }
                
                    if(sort.equals("q")){
                    System.out.println("exiting");
                    }
                }catch (Exception ex){
                    
                }
            }
                    
            
            if(input.equals("c")){
                try{
                    System.out.print("Enter the file to load: ");
                    String name = scanner.nextLine();
                    a.loadAllCities(name);
                }catch(Exception ex){

                }

            }
            
            if(input.equals("d")){
                try{
                    System.out.print("Enter the file to load: ");
                    String name2 = scanner.nextLine();
                    a.loadAllConnections(name2);
                }catch(Exception ex){

                }
            }
            
            if(input.equals("f")){
                try{
                    a.printAllConnections();
                }catch(Exception ex){
                    
                }
            }
        }
    
    }


}