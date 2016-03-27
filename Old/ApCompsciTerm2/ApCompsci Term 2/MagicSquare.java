public class MagicSquare{


    private Object [] [] _magicSquare;
    private static final int DEFAULT_SIZE = 1;

    public MagicSquare(){
	_magicSquare = new Object[DEFAULT_SIZE][DEFAULT_SIZE];
    }

    public Matrix(int n){
	_magicSquare = new Object [n][n];
    }