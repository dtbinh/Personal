/**
 *Ronald Balchand
 *109806273
 *Assignment #6
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */


    

public class Book{
    private String title;
    private String author;
    private String publisher;
    private String isbn;

    /**
     *Default constructor for the Book class
     */
    public Book(){
	this.title = "";
	this.author = "";
	this.publisher = "";
	this.isbn = "";
    }

    /**
     *overridden constructor for the Book class
     *@param _title the title of the Book
     *@param _author the author of the Book
     *@param _publisher the publisher of the Book
     *@param _isbn the isbn number of the Nook
     */
    public Book(String _title, String _author, String _publisher, String _isbn){
	this.title = _title;
	this.author = _author;
	this.publisher = _publisher;
	this.isbn = _isbn;
    }

    /**
     *get method for the title
     *@return String the title of the Book
     */
    public String getTitle(){
	return this.title;
    }

    /**
     *get Method for the author of the Book
     *@return String the author of the Book
     */
    public String getAuthor(){
	return this.author;
    }

    /**
     *get method for the publisher of the Book
     *@return String the publisher of the Book
     */
    public String getPublisher(){
	return this.publisher;
    }

    /**
     *get method for the ISBN number
     *@return String the ISBN number of the Book
     */
    public String getISBN(){
	return this.isbn;
    }

    /**
     *set method for the title of the book
     *@param a the new Title for the Book
     */
    public void setTitle(String a){
	this.title = a;
    }

    /**
     *set method for the publisher of the Book
     *@param a the new publisher of the Book
     */
    public void setPublisher(String a){
	this.publisher = a;
    }

    /**
     *set method for the author of the Book
     *@param a the new author of the Book
     */
    public void setAuthor(String a){
	this.author = a;
    }

    /**
     *set method for the new ISBN of the Book
     *@param a the new ISBN of the book
     */
    public void setISBN(String a){
	this.isbn = a;
    }

    /**
     *equals method for this Book class
     
     */
    public boolean equals(Object obj){
	Book object = (Book)obj;
	if(object.getISBN().equals(this.getISBN())){
	    return true;
	}
	else{
	    return false;
	}
    }    
	

    /**
     *toString method for the Book class
     *@return String the String representation of the Book
     */
    public String toString(){
	return ": " + this.getTitle() + " by " + this.getAuthor();
	
    }
}
