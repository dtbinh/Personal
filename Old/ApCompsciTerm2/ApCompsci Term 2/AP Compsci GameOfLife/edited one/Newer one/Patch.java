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
	_neighbors = new Neighbors(this);
	update();
    }

    public void update(){
	_neighbors = new Neighbors(this);
	_alive = 0;
        for (Patch p : getNeighbors()){
	    if (getPlabel().equals("x"))
		_alive += 1;
	}
    }

    public int getPxcor(){
	return _pxcor;
    }

    public int getPycor(){
	return _pycor;
    }

    public Grid getMyGrid(){
	return _myGrid;
    }

    public String getPlabel(){
	return _plabel;
    }

     public Patch [] getNeighbors(){
	 return _neighbors.getNeighbors();
     }

    public String setPlabel(String w){
	String ans = _plabel;
	_plabel = w;
	return ans;
    }

    public String toString(){
	return _plabel;
    }

    public int getAlive() {
	return _alive;
    }
}
