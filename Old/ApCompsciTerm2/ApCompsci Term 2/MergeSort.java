//Ronald Balchand
//MKS22X-04
//HW#07


public class MergeSort{
  
  
  
  public static void fill(int [] data){//fills a list with integers in order based on
  for(int i = 0; i < data.length; i++){//the length of the array
    data[i]= i + 1;
  }
}

public static void fillRand(int [] data){// fills a list with random integers based on its size
  for (int i = 0; i < data.length; i++){
    data[i] = (int)(Math.random() * data.length);
  }
}
                    

public static void swap(int pos1, int pos2, int [] data){
  int temp = data[pos1];
  data[pos1] = data[pos2];
  data[pos2] = temp;
}
  
    public static void insertionSort(int [] data){ //insertionsort function
 for (int passes = 1; passes < data.length - 1; passes++){
     for (int i = passes; i > 0; i--){
  if (data[i] < data[i-1])
      swap(i, i+1, data);
  else
      break;
     }
    
 }
    }

    // precondition: assumes lo <= brk <= hi
    //               && elements from x[lo] to x[brk-1] sorted in ascending order
    //               && elements from x[brk] to x[hi-1] sorted in ascending order
    // postcondition: merges two adjacent, sorted regions into one sorted region
    //                ie, region from x[lo] to x[hi-1] sorted
    // eg:
    // merge(0,2,5,x) → [1,2,3,4,5]
    // merge(4,6,9,y) → [6,9,7,8,1,2,3,4,5]
    // merge(0,2,4,y) → [6,7,8,9,1,2,3,4,5]
    // merge(0,4,9,y) → [1,2,3,4,5,6,7,8,9]
    private static void merge( int lo, int brk, int hi, Comparable[] x ) {
 int totRegSize = hi - lo; //store size of subregion containing 2 adj, rel sorted regions
 Comparable[] temp = new Comparable[ totRegSize ]; //create aux array to hold merged data

 int subReg1Pos = lo;
 int subReg2Pos = brk;

 for( int i = 0; i < totRegSize; i++ ) {
     if ( subReg1Pos == brk ) //done w subReg1?
  temp[i] = x[subReg2Pos++];
     else if ( subReg2Pos == hi ) //done w subReg2?
  temp[i] = x[subReg1Pos++];
     else if ( x[subReg1Pos].compareTo( x[subReg2Pos] ) < 0 ) // x[sR1P] < x[sR2P]
  temp[i] = x[subReg1Pos++];
     else // x[sR2P] < x[sR1P]
  temp[i] = x[subReg2Pos++];
 }

 //now copy temp array into corresponding slots of primary array
        for( int i = 0; i < totRegSize; i++ ) {
     x[lo + i] = temp[i];
 }

    }//end merge()


    public static void sort( Comparable[] x ) {
//linear time seems to be the ony constraint i cant gt around for these two
      //however the ideas are in da notebook
	//split array in half
	//keep splitting intil list size ==== 1
	//MERGE them all together
	sort( 0, x.length, x);
    }


    private static void sort( int lo, int hi, Comparable[] x ) {
	int numItems = hi - lo;

	if( numItems <= 1) return;// break for the entire function
	int mid = (hi + lo) / 2;
	sort(lo, mid, x);
	sort(mid, hi, x);
	merge(lo, ,mid, hi, x);
    }
    //


}




