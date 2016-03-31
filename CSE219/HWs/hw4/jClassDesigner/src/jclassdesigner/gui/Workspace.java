/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jclassdesigner.gui;

import java.io.IOException;
import jclassdesigner.controller.CanvasController;
import jclassdesigner.controller.ComponentEditController;
import saf.AppTemplate;
import saf.components.AppWorkspaceComponent;
import saf.ui.AppGUI;

/**
 *
 * @author Ronald
 */
public class Workspace extends AppWorkspaceComponent{
    //THERE ARE SOME CONSTANTS TO BE ADDED TO EDIT THIS APPLICATION
    public static final String CLASS_TOOLBAR = "toolbar";
    public static final String CLASS_TOOLBAR_BUTTON = "toolbar_button";
    public static final String CLASS_RENDER_CANVAS = "render_canvas";
    public static final String CLASS_COMPONENT_EDITOR = "component_editor";
    //This here's the app
    AppTemplate app;
    
    //THIS HERE'S THE GUI
    AppGUI gui;
    
    //THIS HANDES INTERACTIONS WITH THE RENDERING VIEW
    CanvasController canvasController;
    
    //THIS HANDLES INTERACTIONS WITH THE COMPONENT TOOLBAR
    ComponentEditController componentEditController;
    
    
    
    
    
    
    
    
     /**
     * Constructor for initializing the workspace, note that this constructor
     * will fully setup the workspace user interface for use.
     *
     * @param initApp The application this workspace is part of.
     *
     * @throws IOException Thrown should there be an error loading application
     * data for setting up the user interface.
     */
    public Workspace(AppTemplate initApp) throws IOException {
    }
    
    
    
     /**
     * This function reloads all the controls for editing tag attributes into
     * the workspace.
     */
    @Override
    public void reloadWorkspace() {
    }
    
    
     /**
     * This function specifies the CSS style classes for all the UI components
     * known at the time the workspace is initially constructed. Note that the
     * tag editor controls are added and removed dynamicaly as the application
     * runs so they will have their style setup separately.
     */
    @Override
    public void initStyle() {
	// NOTE THAT EACH CLASS SHOULD CORRESPOND TO
	// A STYLE CLASS SPECIFIED IN THIS APPLICATION'S
	//CSS FILE
    }
    
    
    
    
    
}
