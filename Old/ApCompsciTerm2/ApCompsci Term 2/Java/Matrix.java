public class Matrix{

    private Object [] [] _matrix;
    private static final int DEFAULT_SIZE = 10;

    //default constructor
    public Matrix (){
	_matrix = new Object[DEFAULT_SIZE][DEFAULT_SIZE];
    }

    //overloaded constructor
    public Matrix(int n){
	_matrix = new Object [n][n];

}

 
//ACCESSOR FUNCTIONS
    public int size(){
	return _matrix.length;
    }


    public Object get(int r, int c){
	return _matrix[r][c];
    }



    public boolean isEmpty(int r, int c){
	return get(r,c) == null;

    }

    public boolean isFull(){
	boolean ans = true;
	for(int i = 0; i < _matrix.length; i++){
	    for (int j = 0; j < _matrix[i].length; j++){
		if (_matrix[i][j] == null) {
			ans = false ;
			break;
		    }
	    }
	}




	    }
    public static void main (String [] args){
	Matrix m1 = new Matrix(2);//2x2
	Matrix m2 = new Matrix(); //10 x 10
	System.out.println(isFull(m1));
	System.out.println(isFull(m2));
}
}