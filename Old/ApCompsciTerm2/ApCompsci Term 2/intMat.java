public class intMat{



  public static boolean MatLogSearch(int[][] data, int n){ // basic search in quadratic form 
    boolean ans = false;
     for (int i = 0; i < data.length; i++){//standard two for loops designed to visit each spot on the matrices
       for (int j = 0; j < data[i].length; j++){//visiting each place makes it not a linear function
         if (data[i][j] == n)
           ans = true;
         break;
       }
       break;
     }
     return ans;
  }
  
  public static boolean  MatLinSearch1(int[][] data, int n){
      boolean ans = false;
      int row = data.length - 1;
      int col = 0;
      while(row >= 0 && col < data.length){
	  if(data[row][col] == n){
	      ans = true;
	      break;
	  }
	  else if(n > data[row][col] )
	      col++;
	  else 
	      row--;
      }
      return ans;
  }

    public static String MatLinSearch2( int [][] data, int t){
	String ans = "not found";
	int row = 0;
	for(int col = data.length - 1; col>= 0; col--){
	    if(row >= data.length)
		break;
	    else if (data [row][col] == t){
		    ans = "row:" + row + "column: " + col;
		    break;
		}
		else if (data[row][col] < t){
		    //if the rightmost cell is too small, then the other
		    row++;
		    col++;

		}
	
	}
	return ans;
    }
  
  
  
  
  
  public static void main (String [] args){
  
      int [] [] data = {{1,5,7,10}, {4,6,12,15}, {9,10,13,14}, {8,10,20,22}};
      //1  4    9   8
      //5  6    10  10
      //7  12   13  20 
      //10 15   14  22
      System.out.println(MatLinSearch2(data, 12));
      System.out.println(MatLinSearch2(data, 10));
      System.out.println(MatLinSearch2(data, 22));
      System.out.println(MatLinSearch2(data, 8));
      System.out.println(MatLinSearch2(data, -1));
      System.out.println("Now for the Logerithmic Search");
      System.out.println();
      int [] [] data2 = {{1,5,7,10}, {4,6,12,15}, {9,10,13,14}, {8,10,20,22}};
      //1  4    9   8
      //5  6    10  10
      //7  12   13  20 
      //10 15   14  22
      System.out.println(MatLogSearch(data2, 12));
      System.out.println(MatLogSearch(data2, 10));
  }
  
}
  