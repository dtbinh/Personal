//RONALD ABLCHAND
//109806273
public class Tartan{

    public static void IterativeTartan(int n){
	for(int i = 0;i < n;i++){
	    for(int j = 0; j < n;j++){
		if( ((i+j)%2) == 0){
		    System.out.print(n + " ");
		}
		else{
		    System.out.print( (n-1) + " ");
		}
	    }
	    System.out.println();
	}
    }



    public static void tartan(int n){
	tartanHelper(1,n,n,n-1);
    }
    public static void tartanHelper(int current, int remain, int original, int second){
	if(remain > 0){
	    if(current == 1){
		tartanHelperLine(original, second, original);
		tartanHelper(0, remain - 1, original, second);
	    }
	    
	    else if(current == 0){
		tartanHelperLine(second, original, original);
		tartanHelper(1,remain - 1, original, second);
	    }
	}
    }

    public static void tartanHelperLine(int first, int second, int num){
	if (num == 0){
	    System.out.println();
	}
	else{
	    System.out.print(first + " ");
	    tartanHelperLine(second,first, num - 1);
	}
    }


    public static void main(String [] args){
	//IterativeTartan(3);
	//IterativeTartan(4);
	//IterativeTartan(5);
	tartan(3);
    }
}
    
