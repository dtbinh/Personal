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
	outer:
	for(int i = 0; i < _matrix.length; i++){
	    for (int j = 0; j < _matrix[i].length; j++){
		if (isEmpty(i,j)){
		    ans = false;
		    break outer;
    
		    }
	    }
	}
	return ans;
    }

    public void swapRows(int r1, int r2){
	Object[] temp = matrix[r1];
	_matrix[r1] = _matrix[r2];
	_matrix[r2] = temp;
    }

    public void swapCols(int c1, int c2){
	for(int r = 0; r != size(); r++){
	    set(r,c2,set(r,c1,get(r,c2)));
	}
    }

    //retruns a copy, not the actual row
    public Object[] getRow(int r){
	Object [] ans = new Object[size()];
	for(int x = 0; x < size();x++){
	    ans [x] = _matrix[r][x];
	}
    }
    public Object[] getCol(int c){
	    Object [] ans = new Object[size()];
	    for(int i = 0; i < size(); i++){
		ans[i] = _matrix[i][c];
	    }
	    return ans;
	}


    public Object[] setRow(int r, Object[] newRow){
	Object[] temp = _matrix[r];
	_matrix[r] = newRow;
	return temp;

    }



    public Object[] setCol(int c, Object[] newCol){
	Object[] old = getCol(c);
	for(int i = 0; i < size(); i++){
	    _matrix[i][c] = newCol[i];
	}
	return old;

    }
    
    public void transpose(){
	for(int r = 0; r < size(); r++){
	    for(int c = r + 1; c < size(); c++){
		set(r,c,set(c,r,get(r,c))):
	    }
	}
    }
	    
    public static void main (String [] args){
	Matrix m1 = new Matrix(2);//2x2
	Matrix m2 = new Matrix(); //10 x 10
    }
}