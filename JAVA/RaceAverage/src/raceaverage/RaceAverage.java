//RONALD BALCHAND
//347-870-4315
//ronaldbalchand@gmail.com

package raceaverage;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * This class takes a list of strings all formatted similarly and computes the 
 * average number of minutes it takes for each boat to cross the finish line 
 * @author Ronald
 */
public class RaceAverage {
    
    /**
     * This function takes an arraylist of strings representing set arrival 
     * times and returns the rounded value for the average number of minutes
     * of all the set times. The set value for 0 time is Day 1 at 8:00 A.M
     * @param list
     * @return 
     */
    public static int avgMinutes(ArrayList<String> list){
        double ans = 0.0;//before rounding the value must be of the double type
        double amount = 0;
        for(int i = 0; i < list.size(); i++){
            double temp = 0.0;//Starting value for each time(to be added at the end of calculating
            String completeTime = list.get(i);//COMPLETE TIME CONTAINS ALL THE DATA
            int dayFactor = Integer.parseInt(completeTime.substring(14));//retreves the day as an integer from the string
            temp += (((dayFactor - 1) * 24) * 60);//handles if dayFactor is greater than 1, as well as ignoring if it is 1. Converted to minutes
            int hours = Integer.parseInt(completeTime.substring(0, 2));//These are the integer values returned from the string
            if(hours == 12){
                hours = 0;
            }
            int minutes = Integer.parseInt(completeTime.substring(3, 5));//When adding them to the total do poper conversions
            //MATH FOR ADDING HOURS AND MINUTES OF THE DAY 
            if((completeTime.substring(6,8)).equals("AM")){
                //TIME PRESENTED, HOURS AND MINUTES ARE IN THE AM
                if(dayFactor == 1){
                    //IT IS DAY 1, THE SAME DAY IN THE AM
                    temp += ((hours - 8) * 60);
                }else{
                    //IT IS NOT DAY 1, BUT IN THE AM
                    temp += ((hours - 8) * 60);
                }
            }else{
                //TIME PRESENTED, HOURS AND MINUTES ARE IN THE PM
                if(dayFactor == 1){
                    //IT IS DAY 1, THE SAME DAY IN THE PM
                    temp += ((hours + 4) * 60);
                }else{
                    //IT IS NOT DAY 1, BUT IN THE PM    
                    temp += ((hours + 4) * 60);
                }
            }
            temp += minutes;//Minutes value are independent of AM/PM or Day
            ans += temp;
            amount += 1.0;
        }
        ans = ans / amount; 
        ans += .5;
        //TO BE SURE OF ROUNDING JUST ADD .5 BEFORE TYPECASTING
        return (int)ans;
    }
    
    
     public static void main(String [] args){
        Scanner scanner = new Scanner(System.in);//SETUP FOR INPUT TO THE FILE
        ArrayList<String> list = new ArrayList();
        //The input will be placed in an arraylist of Strings
        
        System.out.println("Sailboat Race From Rhode Island to Bermuda");
        System.out.println("Please enter each arrival time, separated by commas, but do not add a space after each comma: ");
        
        String fullString = scanner.nextLine();
        while(fullString.length() > 14){//STOPPING CASE IN WHICH THE STRING IS EMPTY, OR SMALLER THAN THE SIZE OF ONE ENTRY
            //FIRST WE NEED TO PARSE THROUGH THE STRING
            //THERE ARE TWO POSSIBLE SIZES FOR THE STRING, 15 AND 16
            //CHECK TO SEE WHERE THE COMMA SEPARATING ITEMS IS
           
            if(fullString.length() == 15){//SPECIAL CASE FOR THE FINAL VARIABLE
                list.add(fullString.substring(0, 15));//ADD THE FINAL STRING
                break;//THE END OF THE LIST HAS BEEN REACHED
            }
            String indexString = "";
            int endPoint = 0;
            //NOW TOP CHECK THE SIZE OF THE STRING
            if(fullString.substring(15, 16).equals(",")){//COMMA IS THERE WHEN LENGTH IS 15
                //IF TRUE THE STRING IS THE SMALLER SIZE
                endPoint = 15;//THE DESIRED STRING WILL END AT THIS POINT
            }else{
                //ELSE THE STRING IS THE LARGER SIZE
                endPoint = 16;//THE DESIRED STRING WILL END AT THIS POINT
            }
            
            indexString = fullString.substring(0, endPoint);//STRING STORED HERE
            list.add(indexString);//STRING ADDED
            fullString = fullString.substring(endPoint + 1);//REMOVES COMMA FROM THE STRING AS WELL
           
        }
        //ALL THE STRINGS HAVE BEEN ADDED TO THE LIST
        //COMPUTE AND PRINTOUT
        System.out.print("Resulting average number of minutes for each boat:  ");
        System.out.println(avgMinutes(list));
        
    }
    
}
   
