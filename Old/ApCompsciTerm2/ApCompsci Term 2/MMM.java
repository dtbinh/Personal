//Ronald Balchand

public class MMM{


  
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


    public static double mean(int [] data){
 double sum = 0;
 double ans = 0;
 for(int i = 0; i < data.length; i++){//goes through the array and creates a sum of all the integers 
      sum += data[i];
 }
 ans =  sum /= data.length;//then divides by the # of indexes
 return ans;//returning a double as the answer
    }
    
    
    public static String mode(int [] data) {
      String ans = " No Mode";
      int maxValue = -1;
      int maxCount = -1;// first one that will run in logarithmic time
      for(int i = 0; i < data.length; i++){//the first for loop is to establish a comparison point. 
        int counter = 0;// where the second for loop runs through the rest of the array
        for(int j = 0; j < data.length; j++){
          if(data[j] == data[i]) // comparing and
            counter++;//adding to counter whenever another index if found to contain the same integer. 
        }
        if (counter > maxCount) {// a maxcount is established, and it is maintain throughout the entire function
          maxCount = counter;// only when the counter from a currnt run is higher than the maxcounter, does the counter get overitten
          maxValue = data[i];// this is only when the maxvalue is overitten
        }
      }
      if (maxValue != -1){
        ans = "Mode is " + maxValue;
      }
      return ans;// and then returned at the end
    }
     
    
    public static double median(int [] data){
      double ans = 0;
      insertionSort(data);
      int center = data.length/2;// once sorted, the middle element can be established
      if(data.length % 2 == 1) {// odd # of elements, in which it   
        ans = data[center];//would return the middle  
      }
      else{
        ans = (data[center - 1] + data[center]) / 2;// even number, indicating that it needs to be the average of the two enter ones
      }
      return ans;
    }
    
    public static String print(int [] data){
      String ans = "";//creates a visual interpretation of an array known as a String
      for(int i = 0; i < data.length; i++){
        ans = ans + data[i] + " ";
      }
      return ans;
    }
     
      

    public static void main(String [] args){
 int [] ten = new int [10];
 int [] tenRand = new int [10];
 int [] hundred = new int [100];
 int [] hundredRand = new int [100];
 fill(ten);
 fillRand(tenRand);
 fill(hundred);
 fillRand(hundredRand);
 System.out.println(System.currentTimeMillis());
 System.out.println("Array Ten in order" + print(ten));
 System.out.println("mean of ten:  " + mean(ten));
 System.out.println("median of ten:  " + median(ten));
System.out.println("Array Hundred in order" + print(hundred));
System.out.println("mean of hundred:  " + mean(hundred));
 System.out.println("median of hundred:  " + median(hundred));
System.out.println("Array of ten random numbers from 1 to 10:  " +  print(tenRand));
System.out.println ("mean of tenRand:   " + mean(tenRand));
System.out.println ("mode of tenRand:  " + mode(tenRand));
 System.out.println("median of ten:  " + median(tenRand));
System.out.println("Array of a hundred Random numbers from 1 to 100: " + print(hundredRand));
System.out.println("mean of hundredRand with log function:   " + mean(hundredRand));
System.out.println("mode of hundredRand:   " + mode(hundredRand));
 System.out.println("median of ten:  " + median(hundredRand));




    }

}