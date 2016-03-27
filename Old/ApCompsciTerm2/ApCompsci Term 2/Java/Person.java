public class Person {

    //instance variables
    private String _firstName, _lastName;
    private Face _myFace;

    //constructor

    public Person (){
	_firstName = "John";
	_lastName = "Doe";
	Face newFace;
    } 

    public Person (String firstName, String lastName) {
	_firstName = firstName;
	_lastname = lastName;
    }

    public Person (String firstName, String lastName, Face face){}


    public String getFirstName () {
	return _firstName;
    }
    public String getLastName() {
return _lastName
    }
    public Face getFace(){
	return face;
    }

    public String setFirstName (String firstName){
	    String ans = getFirstName();
	    _firstName = firstName;
	    return ans;
	}
    public String setLastName (string lastName){
	String ans = getLastName ();
	_lastName = lastName;
	return ans; 
    }


    public face setFace (Face newFace){
	String ans = getFace ();
	newFace = Face;
	return ans;
    }

    public static void main (String[] args){
	Person John = new Face();

	System.out.println(John);
    }



}