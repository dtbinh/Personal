/**
 *Ronald Balchand
 *109806273
 *Assignment #6
 *CSE 214 Recitation Section 05
 *Recitation TA: Vyassa Baratham
 *Grading TA: Ke Ma
 *@author Ronald Balchand
 */

import big.data.*;
import java.util.*;
import java.io.Serializable;
import java.io.IOException;
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
public class HashedLibrary implements Serializable{


    private Hashtable<String, Book> hashLibrary;


    /**
     *default constructor for the HashedLibrary class
     */
    public HashedLibrary(){
	this.hashLibrary = new Hashtable<String, Book>();
    }

    /**
     *Overridden constructor for the HashedLibrary class
     *@param a the initial size of the Library
     */
    public HashedLibrary(int size){
 this.hashLibrary = new Hashtable<String, Book>(size);
    }

    /**
     *get method for the HashedLibrary class
     *@return Hashtable<String, Book> the current hash library
     */

    public Hashtable<String, Book> getLibrary(){
	return this.hashLibrary;
    }
    
    /**
     *adds a Book into the current hashedLibrary
     *@param title the Title of the Book being added
     *@param author the Author of the Book being added
     *@param publisher the Publisher of the Book being added
     *@param isbn the ISBN of the Book being added
     *@throws Exception if the key being added is already there
     */

    public void addBook(String title, String author, String publisher, String isbn) throws Exception{
	String value = isbn;
	Book newBook = new Book(title, author, publisher, isbn);
	if(this.hashLibrary.containsKey(value)){
	    
	    try{
		throw new Exception();
	    }catch(Exception ex){
		//System.out.println("It didnt work here");
	    }
	    
	}
	else{	
	    this.hashLibrary.put(value, newBook);
            System.out.println(isbn + ": " + title + " by " + author + " recorded.");
	}	
	
    }

    /**
     * using the fileName provided, use what you have learned to open the file and parse it. Add a record for each XML file names provided, and print a message if a Book id recorded successfully.
     *@param fileName the name of the file you are reading
     *@throws Exception thrown if there is a problem 
     */
    public void addAllBookInfo(String fileName)throws Exception{
	String pathname;
        pathname = "./" + fileName;
	File notYet = new File(pathname);
	if(notYet.exists() == false){
	    try{
		throw new Exception();
	    }catch (Exception ex){
		System.out.println("the file you are looking to draw from does not exist");
	    }
	}

	else{
	    BufferedReader br = null;
	    try{
		String currentLine;
		br = new BufferedReader(new FileReader(pathname));
		while((currentLine = br.readLine()) != null){
		    String name = currentLine;
                    DataSource ds = DataSource.connect("http://www.cs.stonybrook.edu/~cse214/hw/hw6/" + name + ".xml").load();
                    String _title = ds.fetchString("title");
                    String _author = ds.fetchString("author");
                    String _publisher = ds.fetchString("publisher");
                    String _isbn = ds.fetchString("isbn");
                    this.addBook(_title, _author, _publisher, _isbn);
                }
            }catch (Exception ex){
                //System.out.println("There was a problem adding a book");
            }
        }
    }

		    

    /**
     *returns a book based on its ISBN
     *@param isbn the isbn number of the Book
     *@return the Book being looked up, null if it doesnt exist in the library
     */
    public Book getBookByisbn(String isbn){
	if(this.hashLibrary.containsKey(isbn) == true){
	    return this.hashLibrary.get(isbn);
	}
	else{
	    return null;
	}
    }


    
    /**
     *prints all of the Books in the libraryb of the Hash table
     */
    public void printCatalog(){
	System.out.println("Book ISBN       Title                              Author                          Publisher");
	System.out.println("--------------------------------------------------------------------------------------------------------------------------");
	Set<String> keys;
	keys = this.hashLibrary.keySet();

	for(String key: keys){
	    Book temp = this.getBookByisbn(key);
	    System.out.printf(temp.getISBN() + ":  " + "%-35s" + "%-32s" + "%-5s", temp.getTitle(), temp.getAuthor(), temp.getPublisher());
	    System.out.println();
	}
    }
}


