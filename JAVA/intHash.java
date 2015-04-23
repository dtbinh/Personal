import java.util.ArrayList;

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
	    System.out.println("Modulus Index = " + arrayIndex + " for Value " + newElementVal);
	    while(theArray[arrayIndex] != "-1"){
		++arrayIndex;
		System.out.println("Collision Try " + arrayIndex + " instead");
	    }

	    arrayIndex %= arraySize;
      
	    theArray[arrayIndex] = newElementVal;
	}
    }


    

    

    public String findKey(String key){
	int arrayIndexHash = Integer.parseInt(key) % 29;
	while(theArray[arrayIndexHash] != "-1"){
	    
	    if(theArray[arrayIndexHash] == key){
		System.out.println(key + " was found in Index " + arrayIndexHash);
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
	for(int i = 0; i < size; i++){
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
    

    /*public void display(){
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
    */

    public boolean isPrime(int number){
	if(number % 2 == 0){
	    return false;
	}

	for(int i = 3; i * i <= number; i += 2){
	    if(number % i == 0){
		return false;
	    }
	}
	return true;
	
    }


    public int getNextPrime(int number){
	for(int i = number; true; i++){
	    if(isPrime(i)){
		return i;
	    }
	}
    }



    public void display(){
	int increment = 0;
	int numberOfRows = (this.arraySize / 10) + 1;
	for (int m = 0; m < numberOfRows; m++) {
	    increment += 10;
	    
	    
	    
	    for (int n = 0; n < 71; n++)
		
		System.out.print("-");
	    
	    
	    System.out.println();
		    
	    
	    
	    for (int n = increment - 10; n < increment; n++) {
		
		
		System.out.format("| %3s " + " ", n);
		
		
		
	    }
	    
	    
	    
	    System.out.println("|");
	    
	    
	    for (int n = 0; n < 71; n++)
		
		System.out.print("-");
	    
	    
	    
	    System.out.println();
	    
	    
	    
	    for (int n = increment - 10; n < increment; n++) {
		
		
		
		if (n >= arraySize)
		    
		    System.out.print("|      ");
		
		
		
		else if (theArray[n].equals("-1"))
		    
		    System.out.print("|      ");
		
		
		
		else
		    
		    System.out.print(String.format("| %3s " + " ", this.theArray[n]));
		
	    }
	    
	    
	    
	    System.out.println("|");
	    
	    
	    
	    for (int n = 0; n < 71; n++)
		
		System.out.print("-");
	    
	    
	    
	    System.out.println();
	    
	    
	    
	}
	
	
	
    }



    public void increaseArraySize(int minArraySize){
	int newSize = getNextPrime(minArraySize);
	moveOldArray(newSize);
    }

    public void moveOldArray(int newArraySize){
	String [] cleanArray = removeEmptySpacesInArray(this.theArray);
	this.theArray = new String[newArraySize];
	this.arraySize = newArraySize;
	for(int i = 0; i < arraySize; i++){
	    this.theArray[i] = "-1";
	}
	hashFunction2(cleanArray, this.theArray);
    }
	

    public String [] removeEmptySpacesInArray(String [] arrayToClean){
	ArrayList<String> stringList = new ArrayList<String>();
	for(String theString : arrayToClean){
	    if(!theString.equals("-1") && !theString.equals("")){
		stringList.add(theString);
	    }
	}

	return stringList.toArray(new String[stringList.size()]);
    }
	
    
    public static void main(String [] args){
	intHash theFunc = new intHash(30);
	String[] elementsToAdd = {"1", "5", "17", "21", "26"};
	String [] elementsToAdd2 = {"100", "510", "170", "214", "268", "398", "235", "802", "900", "723", "699", "1", "16", "999", "890", "725","998", "978", "988", "990", "989", "984", "320", "321", "400", "415", "450", "50", "660", "624"};

	String[] elementsToAdd3 = { "30", "60", "90", "120", "150", "180","210", "240", "270", "300", "330", "360", "390", "420", "450","480", "510", "540", "570", "600", "989", "984", "320", "321","400", "415", "450", "50", "660", "624" };


	//theFunc.hashFunction1(elementsToAdd, theFunc.theArray);
	theFunc.hashFunction2(elementsToAdd3, theFunc.theArray);
	theFunc.display();
	//theFunc.findKey("660");
	
	theFunc.increaseArraySize(60);

	theFunc.display();
	
	//System.out.println(theFunc.theArray.length);	
    }

}




































