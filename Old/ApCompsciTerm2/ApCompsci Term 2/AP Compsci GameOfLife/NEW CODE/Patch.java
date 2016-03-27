public class Patch{

    private int _pxcor,_pycor;
    private Grid _myGrid;
    private String _plabel;
    private Neighbors _neighbors;
    private int _alive;

    public Patch(int x,int y,Grid g){
	_plabel = " ";
	_myGrid = g;
	_pxcor = x;
	_pycor = y;
	_alive = 0;
	_neighbors = new Neighbors(this);
    }

    public int getPxcor(){
	return _pxcor;
    }

    public int getPycor(){
	return _pycor;
    }

    public Grid getGrid(){
	return _myGrid;
    }

    public String getPlabel(){
	return _plabel;
    }

    public Neighbors getNeighbors(){
	return _neighbors;
    }

    public int getAlive(){
	return _alive;
    }

    public String setPlabel(String word){
	String oldValue = getPlabel();
	_plabel = word;
	return oldValue;
    }

    public int update(){
	int ans = 0;
	for (int i = 0;i < _neighbors.size();i++){
	    if (_neighbors.getNeighbors().get(i).getPlabel().equals("x"))
		ans += 1;
	}
	_alive = ans;
	return ans;
    }

    public String toString(){
	return _plabel;
    }
}
