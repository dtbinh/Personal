public class Merge{

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
                    

public static void swap(Comparable pos1, Comparable pos2, Comparable [] data){
  Comaprable temp = data[pos1];
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

    
    public static String print(int [] data){
      String ans = "[ ";//creates a visual interpretation of an array known as a String
      for(int i = 0; i < data.length; i++){
        ans = ans + data[i] + ", " + " ";
      }
      return ans + "]";
    }



    public static void merge(int lo, int brk, int hi, Comparable[] x){
    }
















































}