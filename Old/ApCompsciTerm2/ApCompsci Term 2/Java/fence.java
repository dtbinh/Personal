public static String fence (int posts){

    String x = "|";
    for (int a = posts; a > 1 && a <= posts; a--){
	x += "--";
	if (posts != 1)
	    x += "--|";
    }

    return ans;

}

// recursive version
public static String fenceR(int posts){
    if (posts == 1)
return "|"
else return "|--" + fenceR(posts - 1) ;
}

//fenceR(3)
//return "|--" + fence R(2)


//String methods
//length() ex. "cat".length -> 3
//substring (int,int) ex "stuy".substring(1,3) -> tu
//subtring(int)  ex. "stuy".substring(1) -> "tuy"

//pre-condition : w.length() > 0
//post:reverse("car") -> "rac"

public static String reverse(String w){

    if (w.length() == 1)
	return w;
    else
	return reverseR(w.substring(1)) + w.substring(0,1);
}
}

    public static void main (String [] args) {
	int n = Integer.parseInt(args[0]);
	System.outprintln(fence(n));
    }
