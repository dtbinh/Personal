
package jclassdesigner.data;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * This class represents a single element in a UML Diagram
 * @author Ronald
 * @version 1.0
 */
public class UMLTagPrototype {
    //FIRST SOME CONSTANTS WHICH WILL SETUP YOUR BASIC METHOD OR VARIABLE
    
    public static final String ATTRIBUTE_PUBLIC = "public";
    public static final String ATTRIBUTE_PRIVATE = "private";
   

    //public static final String
    
     String className;
     String packageName;
     
     
     HashMap<String, String> variables; //Storing each variable name and its type
     HashMap<String, String> methods;
  
    
    
}
