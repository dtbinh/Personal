import java.util.ArrayList;

public class Neighbors{

    private ArrayList<Patch> _neighbors;
    private Patch _patch;

    public Neighbors(Patch p){
	_patch = p;
	helper(p);
    }

    public Patch getNeighbor(int r,int c){
	return _patch.getGrid().getPatch(r,c);
    }

    public void helper(Patch p){
	int max = p.getGrid().size() - 1;
	int x = p.getPxcor();
	int y = p.getPycor();
	//Corner Patches
	if (x == y && x == 0){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x,y + 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	    _neighbors.add(getNeighbor(x + 1,y + 1));
	}
	else if (x == y && x == max){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y - 1));
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x,y - 1));
	}
	else if (x == 0 && y == max){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	}
	else if (x == max && y == 0){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x - 1,y + 1));
	    _neighbors.add(getNeighbor(x,y + 1));
	}
	//Border Patches
	else if (x == 0){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x,y - 1));
	    _neighbors.add(getNeighbor(x,y + 1));
	    _neighbors.add(getNeighbor(x + 1,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	    _neighbors.add(getNeighbor(x + 1,y + 1));
	}
	else if (x == max){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y - 1));
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x - 1,y + 1));
	    _neighbors.add(getNeighbor(x,y - 1));
	    _neighbors.add(getNeighbor(x,y + 1));
	}
	else if (y == 0){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x - 1,y + 1));
	    _neighbors.add(getNeighbor(x,y + 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	    _neighbors.add(getNeighbor(x + 1,y + 1));
	}
	else if (y == max){
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y - 1));
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	}
	//Other Patches
	else{
	    _neighbors = new ArrayList<Patch>();
	    _neighbors.add(getNeighbor(x - 1,y - 1));
	    _neighbors.add(getNeighbor(x - 1,y));
	    _neighbors.add(getNeighbor(x - 1,y + 1));
	    _neighbors.add(getNeighbor(x,y - 1));
	    _neighbors.add(getNeighbor(x,y + 1));
	    _neighbors.add(getNeighbor(x + 1,y - 1));
	    _neighbors.add(getNeighbor(x + 1,y));
	    _neighbors.add(getNeighbor(x + 1,y + 1));
	}
    }

    public ArrayList <Patch> getNeighbors(){
	return _neighbors;
    }

    public int size(){
	return _neighbors.size();
    }

    public Patch getPatch(){
	return _patch;
    }
}
