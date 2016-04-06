
package jclassdesigner.controller;

import jclassdesigner.JClassDesigner;
import jclassdesigner.data.DataManager;
import jclassdesigner.data.UMLTagPrototype;
import jclassdesigner.gui.Workspace;
import saf.AppTemplate;

/**
 *
 * @author Ronald
 */
public class ComponentEditController {
    AppTemplate app;
    
    DataManager dataManager;
    
    public ComponentEditController(AppTemplate initApp){
        app = initApp;
        dataManager = (DataManager)app.getDataComponent();
    }
    
    
    public void handleNewClassRequest(){
        dataManager.addNewClass();
    }
    
    public void handleClassNameUpdate(String newName){
        DataManager dataManager = (DataManager)app.getDataComponent();
        dataManager.getSelectedTag().setClassName(newName);
        dataManager.getSelectedTag().getLabel().setText(newName);
    }
    
}
