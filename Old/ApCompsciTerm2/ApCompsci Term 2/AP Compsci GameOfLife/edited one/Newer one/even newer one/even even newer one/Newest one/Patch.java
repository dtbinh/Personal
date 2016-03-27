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

    public void update(){
	int alive = 0;
	Neighbors n = new Neighbors(this);
        for (Patch p : n.getNeighbors()){
	    if (getPlabel().equals("x"))
		alive += 1;
	}
	_alive = alive;
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
