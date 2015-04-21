
public class intHash{
    private String[] theArray;
    private int arraySize;
    private int itemsInArray;


    public void hashFunction1(String [] stringsForArray, String[] theArray){
	for(int i = 0; i < stringsForArray.length; i++){
	    String newElementVal = stringsForArray[i];
	    theArray[Integer.parseInt(newElementVal)] = newElementVal;
	}
    }


    public void hashFunction2(String [] stringsForArray, String[] theArray){
	for(int i = 0; i < stringsForArray.length; i++){
	    String newElementVal = stringsForArray[i];
	    int arrayIndex = Integer.parseInt(newElementVal) % 29;
	    System.out.println("Modulus Index = " + arrayIndex + " for Value" + newElementVal);
	    while(theArray[arrayIndex] != "-1"){
		++arrayIndex;
		System.out.println("Collision Try " + arrayIndex + "instead");
		arrayIndex %= arraySize;
	    }
	    theArray[arrayIndex] = newElementVal;
	}
    }

    public String findKey(String key){
	int arrayIndexHash = Integer.parseInt(key) % 29;
	while(theArray[arrayIndexHash] != "-1"){
	    
	    if(theArray[arrayIndexHash] == key){
		System.out.println(key + " was found in Inex " + arrayIndexHash);
		return theArray[arrayIndexHash];
	    }
	    ++arrayIndexHash;
	    
	    arrayIndexHash %= arraySize;
	    
	}
	return null;
    }

			
    
    public intHash(int size){
	this.arraySize = size;
	this.theArray  = new String[size];
	for(int i = 0; i < this.getSize(); i++){
	    this.theArray[i] = "-1";
	}
    }

    public String[] getTheArray(){
	return this.theArray;
    }
    
    public int getSize(){
	return this.arraySize;
    }

    public int getitemsInArray(){
	return this.itemsInArray;
    }
    

    public void display(){
	String [] temp = this.getTheArray();
	for(int i = 0; i < temp.length; i++){
	    if(temp[i] == "-1"){
		System.out.print(" , ");
	    }
	    else{
		System.out.print(temp[i] + ", ");
	    }
	}
    }

    
    
    public static void main(String [] args){
	intHash theFunc = new intHash(30);
	//String[] elementstoAdd = {"1", "5", "17", "21", "26"};
	String [] elementsToAdd2 = {"100", "510", "170", "214", "268", "398", "235", "802", "900", "723", "699", "1", "16", "999", "890", "725","998", "978", "988", "990", "989", "984", "320", "321", "400", "415", "50", "660", "624"};
	theFunc.hashFunction2(elementsToAdd2, theFunc.theArray);
	theFunc.display();
	theFunc.findKey("660");
	
    }

}




































