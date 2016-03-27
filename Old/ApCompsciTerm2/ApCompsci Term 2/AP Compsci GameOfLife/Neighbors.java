public class Neighbors{

    private Patch[] _neighbors;
    private Patch _patch;

    public Neighbors(Patch p){
	_patch = p;
    }

    public void getNeighborsHelper() {
	int n = _patch.getMyGrid().size() - 1;
	int x = _patch.getPxcor();
	int y = _patch.getPycor();
	//corner patches
	if (x == y & x == 0){
	    _neighbors = new Patch[3];
	    _neighbors[0] = getNeighbor(x + 1,y + 1);
	    _neighbors[1] = getNeighbor(x + 1,y);
	    _neighbors[2] = getNeighbor(x,y + 1);
	}
	else if (x == y && x == n){
	    _neighbors = new Patch[3];
	    _neighbors[0] = getNeighbor(x - 1,y - 1);
	    _neighbors[1] = getNeighbor(x - 1,y);
	    _neighbors[2] = getNeighbor(x,y - 1);
	}
	else if (x == 0 && y == n){
	    _neighbors = new Patch[3];
	    _neighbors[0] = getNeighbor(x,y - 1);
	    _neighbors[1] = getNeighbor(x + 1,y -1);
	    _neighbors[2] = getNeighbor(x + 1,y);
	}
	else if (x == n && y == 0){
	    _neighbors = new Patch[3];
	    _neighbors[0] = getNeighbor(x - 1,y);
	    _neighbors[1] = getNeighbor(x-1,y + 1);
	    _neighbors[2] = getNeighbor(x,y + 1);
	}
	//side border patches
	else if (x == 0){
	    _neighbors = new Patch[5];
	    _neighbors[0] = getNeighbor(x,y - 1);
	    _neighbors[1] = getNeighbor(x,y + 1);
	    _neighbors[2] = getNeighbor(x + 1,y + 1);
	    _neighbors[3] = getNeighbor(x + 1,y);
	    _neighbors[4] = getNeighbor(x + 1,y - 1);
	}
	else if (x == n){
	    _neighbors = new Patch[5];
	    _neighbors[0] = getNeighbor(x - 1,y + 1);
	    _neighbors[1] = getNeighbor(x - 1,y);
	    _neighbors[2] = getNeighbor(x - 1,y - 1);
	    _neighbors[3] = getNeighbor(x,y - 1);
	    _neighbors[4] = getNeighbor(x,y + 1);
	}
	else if (y == 0){
	    _neighbors = new Patch[5];
	    _neighbors[0] = getNeighbor(x + 1,y);
	    _neighbors[1] = getNeighbor(x - 1,y);
	    _neighbors[2] = getNeighbor(x + 1,y + 1);
	    _neighbors[3] = getNeighbor(x,y + 1);
	    _neighbors[4] = getNeighbor(x - 1,y + 1);
	}
	else if (y == n){
	    _neighbors = new Patch[5];
	    _neighbors[0] = getNeighbor(x - 1,y);
	    _neighbors[1] = getNeighbor(x + 1,y);
	    _neighbors[2] = getNeighbor(x + 1,y - 1);
	    _neighbors[3] = getNeighbor(x,y - 1);
	    _neighbors[4] = getNeighbor(x - 1,y - 1);
	}
	//patches not on the borders
	else{
	    _neighbors = new Patch[8];
	    _neighbors[0] = getNeighbor(x + 1,y);
	    _neighbors[1] = getNeighbor(x + 1,y - 1);
	    _neighbors[2] = getNeighbor(x + 1,y + 1);
	    _neighbors[3] = getNeighbor(x,y + 1);
	    _neighbors[4] = getNeighbor(x,y - 1);
	    _neighbors[5] = getNeighbor(x - 1,y - 1);
	    _neighbors[6] = getNeighbor(x - 1,y + 1);
	    _neighbors[7] = getNeighbor(x - 1,y);
	}
    }

    public Patch getNeighbor(int x,int y){
	return _patch.getMyGrid().getPatch(x,y);

    }

    public Patch [] getNeighbors(){
	getNeighborsHelper();
	return _neighbors;
    }
}
