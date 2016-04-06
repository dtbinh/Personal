
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
public class CanvasController {
    AppTemplate app;
    
    public CanvasController(AppTemplate initApp){
        app = initApp;
    }
    
    public void processCanvasMousePress(int x, int y){
        DataManager dataManager = (DataManager)app.getDataComponent();
        Workspace workspace = (Workspace) app.getWorkspaceComponent();
        if("selecting".equals(workspace.getMode())){//in selecting mode
            UMLTagPrototype tag = dataManager.selectTopTag(x, y);
            
            if(tag != null){
                workspace.setMode("dragging_tag");
            }  
        }
    }
    public void processCanvasMouseDragged(int x, int y){
        DataManager dataManager = (DataManager)app.getDataComponent();
        Workspace workspace = (Workspace) app.getWorkspaceComponent();
        if("dragging_tag".equals(workspace.getMode())){
            UMLTagPrototype tag = (UMLTagPrototype)dataManager.getSelectedTag();
            tag.drag(x, y);
        }
    }
    
    public void processCanvasMouseRelease(int x, int y){
        DataManager dataManager = (DataManager)app.getDataComponent();
        Workspace workspace = (Workspace) app.getWorkspaceComponent();
        if(workspace.getMode() == "dragging_tag"){
            workspace.setMode("selecting");
        }
    }  
    
}
