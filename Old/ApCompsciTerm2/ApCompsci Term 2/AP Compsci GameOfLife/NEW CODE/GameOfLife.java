import cs1.Keyboard;

public class GameOfLife{

    private Grid _grid;
    private int _size;

    public GameOfLife(){
	_grid = new Grid();
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

    public void rules(){
	for (int r = 0;r < size();r++){
	    for (int c = 0;c < size();c++)
	        _grid.getPatch(r,c).update();
	}
	for (int r = 0;r < size();r++){
	    for (int c = 0;c < size();c++){
		if (_grid.getPatch(r,c).getAlive() < 2 || 
		    _grid.getPatch(r,c).getAlive() > 3)
		    _grid.getPatch(r,c).setPlabel(" ");
		else if (_grid.getPatch(r,c).getAlive() == 3)
		    _grid.getPatch(r,c).setPlabel("x");
	    }
	}
    }

    public void play(){
	String input = "";
	int survivors = 1;
	System.out.print("Enter A Number Of Patches From 1 To " +
			 size() * size() + " To Be Alive: ");
	survivors = Keyboard.readInt();
	while (survivors > size() * size() || survivors < 1){
	    System.out.print("Please Enter A Number From 1 To " +
			     size() * size() + ": ");
	    survivors = Keyboard.readInt();
	}
	setup(survivors);
	System.out.println();
	while (! input.equals("-1")){
	    rules();
	    System.out.println(toString());
	    System.out.print("Enter Anything To Continue, <-1> To Exit: ");
	    input = Keyboard.readString();
        }
	System.out.println();
    }

    public int size(){
	return _size;
    }

    public Grid getGrid(){
	return _grid;
    }

    public Patch [][] getMatrix(){
	return _grid.getMatrix();
    }

    public String toString(){
	String ans = " ";
	for (int r = 0; r < size();r++){
	    for (int c = 0; c < size();c++){
		ans += _grid.getPatch(r,c).getPlabel();
		ans += " ";
	    }
	    ans += "\n ";
	}
	return ans;
    }

    public static void main(String [] args){
	GameOfLife Test = new GameOfLife();
	System.out.println(Test.getGrid().getPatch(1,5).getNeighbors());
	Test.play();
	GameOfLife Test2 = new GameOfLife(20);
	Test2.play();
    }
}
