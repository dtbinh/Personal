public class Grid{

    private Patch [][] _grid;
    private int _size;

    public Grid(){
	_grid = new Patch[10][10];
	_size = 10;
	for (int i = 0; i < size();i++){
	    for (int j = 0; j < size();j++)
		_grid[i][j] = new Patch(j,i,this);
	}
    }

    public Grid(int n){
	_grid = new Patch[n][n];
	_size = n;
	for (int i = 0; i < size();i++){
	    for (int j = 0; j < size();j++)
		_grid[i][j] = new Patch(j,i,this);
	}
    }

    public Patch[][] getMatrix(){
	return _grid;
    }

    public int size(){
	return _size;
    }

    public Patch getPatch(int r,int c){
	return _grid[c][r];
    }

    public String toString(){
	String ans = "";
	for (int i = 0; i < size();i++){
	    for (int j = 0; j < size();j++)
		ans += _grid[i][j];
	    ans += "\n";
	}
	return ans;
    }
}
