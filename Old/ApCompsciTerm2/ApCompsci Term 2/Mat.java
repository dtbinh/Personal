

public class Mat{

    public static void print(int[][] mat){
	for (int i = 0; i < mat.length; i++){
	    for (int j = 0; j < mat[i].length; j++){
		System.out.print(mat[i][j] + " ");
	    }
	    System.out.println();
	}

    }

    public static void print2(int[][] mat){
	for (int [] row: mat){
	    for (int val : row){
		System.out.print(val + " " );
	    }
	    System.out.println();
	}

    }
    public static int sum(int[][] m){
	int ans = 0;
	for (int i = 0; i < m.length; i++)
	    for(int j = 0; j < m[i].length; j++)
		ans += m[i][j];
	return ans;
    }
    public static int sum2(int [][] m){
	int ans = 0;
	for (int i = 0 ; i < m.length; i++){
	    ans += sumRow(i, m);
	}
	return ans;
    }

    public static int sum3(int[][] m){
	int ans = 0;
	for(int[] row: m){
	    for (int n: row){
		ans += n;
	    }
	}
	return ans;
    }


    public static int sumRow(int r, int[][] m){
	int ans = 0;
	for (int n: m[r]){
	    ans += n;
	}
	return ans;
    }

    public static int sumRow2(int r, int[][] m){
	int ans = 0;
	for (int i = 0; i < m[r].length; i++){
	    ans += m[r][i];
	}
	return ans;
    }

    public static int [] copyRows(int r, int [] [] m){
	int [] ans = new int [m[r].length];
	for(int n = 0; n < m[r].length; n++){
	    ans[n] = m[r][n];
	}
	return ans;
    }


    public static void swapRows (int r1, int r2, int [] [] m){
	int [] temp = m[r1];
	m[r1] = m[2];
	m[r2] = temp;
    }


    public boolean isFound( int target, int [] [] m){
	boolean ans = false;
	for(int i = 0; i < m.length; i++){
	    for (int n = 0;n < m[i].length; n++){
		if(m[i][n] == target){
		    ans = true;
		    break; //breaks out of inner loop
		}
		return ans;
	    }
       

	    public static boolean isFound2(int target, int [] [] m){
		    boolean ans = false;
		outer:  // a label
		    for(int i = 0; i < m.length; i++){
			for(int n = 0; n < m[i].length; n++){
			    it (m[i][n] == target){
				ans = true;
				break outer;//breaks out of outer llooop
			    }
			}
		    }
		    return ans;
	    }


    public static void main(String [] args){
	int [][] m1 = new int[3][5];
	int [][] m2 = {{1,2,3},{4,5,6}};
	int [][] m3 = {{1},{1,2},{1,2,3}};
	print(m1);
	print(m2);
	print(m3);
	print2(m1);
	print2(m2);
	print2(m3);
	System.out.println("sum m1 : " + sum(m1));
	System.out.println("sum m2 : " + sum(m2));
	System.out.println("sum m3 : " + sum(m3));
    }





}