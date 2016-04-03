
package jclassdesigner.data;

import java.util.ArrayList;
import javafx.collections.ObservableList;
import javafx.scene.Node;
import saf.AppTemplate;
import saf.components.AppDataComponent;

/**
 * This class serves as the data management component for this application.
 * 
 * @author Ronald
 * @version 1.0
 */
public class DataManager implements AppDataComponent{
    
//REFERENCE TO THE APPLICATION
    AppTemplate app;
    
    ArrayList<UMLTagPrototype> classes;
    public static final String WHITE_HEX = "#FFFFFF";
    public static final String BLACK_HEX = "#000000";
    public static final String YELLOW_HEX = "#EEEE00";
    
    
    
    
    
    
      /**
     * THis constructor creates the data manager and sets up the
     *
     *
     * @param initApp The application within which this data manager is serving.
     */
    public DataManager(AppTemplate initApp) throws Exception {
        app = initApp;
        
    
        
        
    }
    
    
    
     /**
     * This function clears out the HTML tree and reloads it with the minimal
     * tags, like html, head, and body such that the user can begin editing a
     * page.
     */
    @Override
    public void reset() {
    }
    
    
}
