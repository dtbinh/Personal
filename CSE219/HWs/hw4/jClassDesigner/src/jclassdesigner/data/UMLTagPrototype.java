
package jclassdesigner.data;

import java.util.ArrayList;
import java.util.HashMap;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;

/**
 * This class represents a single element in a UML Diagram
 * @author Ronald
 * @version 1.0
 */
public class UMLTagPrototype {
    //FIRST SOME CONSTANTS WHICH WILL SETUP YOUR BASIC METHOD OR VARIABLE
    
    public static final String ATTRIBUTE_PUBLIC = "public";
    public static final String ATTRIBUTE_PRIVATE = "private";
    public static final String ATTRIBUTE_ABSTRACT = "abstract";
    public static final String ATTRIBUTE_STATIC = "static";
    public static final String LABEL = "tag_label";
   

    //public static final String
    
     String className;
     String packageName;
     //BorderPane labelBase;
     Label classNameLabel;
     
     
     HashMap<String, String> variables; //Storing each variable name and its type
     HashMap<String, String> methods;
     UMLTagPrototype parentTag;
     
     double startX;
     double startY;
     
     
     public UMLTagPrototype(){
         className = "DefaultClassName";
         packageName = "defaultpackage";
         variables = new HashMap();
         methods = new HashMap();
         classNameLabel = new Label(className);
         classNameLabel.getStyleClass().add(LABEL);
     }
     
     
     public UMLTagPrototype(String initClassName, String initPackageName, boolean classOrInterface){
         className = initClassName;
         packageName = initPackageName;
         variables = new HashMap();
         methods = new HashMap();  
         classNameLabel = new Label(className);
         classNameLabel.getStyleClass().add(LABEL);
     }
     
     /**
      * Accessor method for the name of the Class
      * 
      * @return String the name of this Tag
      */
  
     public String getClassName(){
         return this.className;
    }
     
     /**
      * Accessor method for th name of the package of the class
      * @return String the name of the Class' package
      */
    
     public String getPackageName(){
         return this.packageName;
     }
     
     public void setClassName(String name){
         this.className = name;
     }
     
    public void setPackageName(String name){
        this.packageName = name;
    }
    
    public Label getLabel(){
        return this.classNameLabel;
    }
    
    public double getX(){
        return this.startX;
    }
    
    public double getY(){
        return this.startY;
    }
    
    public void setX(double value){
        this.startX = value;
    }
    
    public void setY(double value){
        this.startY = value;
    }
    
    public void drag(int x, int y){
        double diffX = x - (classNameLabel.getLayoutX() + (classNameLabel.getWidth()/2));
        double diffY = y - (classNameLabel.getLayoutY() + (classNameLabel.getHeight()/2));
        double newX = classNameLabel.getLayoutX() + diffX;
        double newY = classNameLabel.getLayoutY() + diffY;
        classNameLabel.setLayoutX(newX);
        classNameLabel.setLayoutY(newY);
        this.startX = x;
        this.startY = y;
    }
}
