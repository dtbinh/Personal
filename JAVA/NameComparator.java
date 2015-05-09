
import java.util.Comparator;

/**
 *Ronald Balchand
 *109806273
 *Assignment #7
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */



public class NameComparator implements Comparator<City>{

    public int compare(City o1, City o2){
        int ans = 0;
        City a = (City)o1;
        City b = (City)o2;
        ans = (a.getName().compareTo(b.getName()));
        return ans;
    }
    
}
