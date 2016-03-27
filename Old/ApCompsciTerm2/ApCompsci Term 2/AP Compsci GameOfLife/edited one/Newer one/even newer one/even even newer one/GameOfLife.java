import cs1.Keyboard;

public class GameOfLife{

    private Grid _grid;
    private int _size;

    public GameOfLife(){
	_grid = new Grid(10);
	_size = 10;
    }

    public GameOfLife(int n){
	_grid = new Grid(n);
	_size = n;
    }

    public void setup(int alive){
	int n = alive;
	while (n > 0){
	    int x = ((int)(Math.random() * _grid.size()));
	    int y = ((int)(Math.random() * _grid.size()));
	    if (_grid.getPatch(x,y).getPlabel().equals(" ")){
		_grid.getPatch(x,y).setPlabel("x");
		n--;
	    }
        }
    }

    public void play(){
	String input = "";
	int gen1 = 1;
	System.out.print("Enter A Number Of Patches From 1 To " +
			 size() * size() + " To Be Alive: ");
	gen1 = Keyboard.readInt();
	while (gen1 > size() * size() || gen1 < 1){
	    System.out.print("Please Enter A Number From 1 To " +
			     size() * size() + ": ");
	    gen1 = Keyboard.readInt();
	}
	setup(gen1);
	System.out.println();
	while (! input.equals("-1")){
	    System.out.println(toString());
	    System.out.print("Enter Anything To Continue, <-1> To Exit: ");
	    input = Keyboard.readString();
	    updateNeighbors();
	    rules();
        }
	System.out.println();
    }

    public void rules(){
	for (Patch [] r : getMatrix()){
	    for (Patch c : r){
		if (c.getAlive() < 2 || c.getAlive() > 3)
		    c.setPlabel(" ");
		else if (c.getAlive() == 3)
		    c.setPlabel("x");
	    }
	}
    }

    public void updateNeighbors(){
	for (Patch [] r : getMatrix()){
	    for (Patch c : r)
		c.update();
	}
    }

    public int size(){
	return _size;
    }

    public Grid getGrid(){
	return _grid;
    }

    public Patch [][] getMatrix(){
	return _grid.getGrid();
    }

    public String toString(){
	String ans = "";
	for (int i = 0; i < size();i++){
	    for (int j = 0; j < size();j++){
		ans += _grid.getPatch(i,j).getPlabel();
		ans += " ";
	    }
	    ans += "\n";
	}
	return ans;
    }

    public static void main(String [] args){
	GameOfLife Test = new GameOfLife();
	Test.play();
	GameOfLife Test2 = new GameOfLife(20);
	Test2.play();
    }
}
