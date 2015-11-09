
import java.util.Comparator;
import latlng.LatLng;

/**
 *Ronald Balchand
 *109806273
 *Assignment #7
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */


public class LngComparator implements Comparator<City>{

    @Override
    public int compare(City o1, City o2) {
        int ans = 0;
        LatLng a = o1.getLocation();
        LatLng b = o2.getLocation();
        Double a1 = a.getLng();
        Double b1 = b.getLng();
        ans = a1.compareTo(b1);
        return ans;
    }
    
}
