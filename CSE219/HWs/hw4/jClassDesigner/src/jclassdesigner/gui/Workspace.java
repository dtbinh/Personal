/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jclassdesigner.gui;

import java.io.IOException;
import javafx.scene.control.Button;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import jclassdesigner.controller.CanvasController;
import jclassdesigner.controller.ComponentEditController;
import saf.AppTemplate;
import saf.components.AppWorkspaceComponent;
import saf.ui.AppGUI;
import saf.ui.AppMessageDialogSingleton;
import saf.ui.AppYesNoCancelDialogSingleton;

/**
 *
 * @author Ronald
 */
public class Workspace extends AppWorkspaceComponent{
    //THERE ARE SOME CONSTANTS TO BE ADDED TO EDIT THIS APPLICATION
    public static final String CLASS_MAIN_TOOLBAR = "toolbar";
    public static final String CLASS_TOOLBAR_BUTTON = "toolbar_button";
    public static final String CLASS_RENDER_CANVAS = "render_canvas";
    public static final String CLASS_COMPONENT_EDITOR = "component_editor";
    //This here's the app
    AppTemplate app;
    
    //THIS HERE'S THE GUI
    AppGUI gui;
    AppMessageDialogSingleton messageDialog;
    AppYesNoCancelDialogSingleton yesNoCancelDialog; 
    
    //THIS HANDES INTERACTIONS WITH THE RENDERING VIEW
    CanvasController canvasController;
    
    //THIS HANDLES INTERACTIONS WITH THE COMPONENT TOOLBAR
    ComponentEditController componentEditController;
    
    //THESE TWO BUTTONS WILL BE SENT TO THE GUI AS THE CUSTOM BUTTONS
    Button photoButton;
    Button codeButton;
    
    //THIS IS THE EDIT TOOLBAR AND ALL OF ITS BUTTONS
    FlowPane editToolbar;
    Button selectButton;
    Button resizeButton;
    Button addClassButton;
    Button addInterfaceButton;
    Button removeButton;
    Button undoButton;
    Button redoButton;
    
    //THIS IS THE VIEW TOOLBAR AND ITS BUTTONS
    
    Button zoomInButton;
    Button zoomOutButton;
    CheckBox gridBox;
    CheckBox snapBox;
    
    
    //THIS WILL BE WHERE WE DISPLAY ALL THE STUFF
    Pane canvas;
    
    //THIS IS WHERE WE COMPONENT STUFF
    VBox componentToolbar;
    
    //ROW FOR THE CLASS NAME
    HBox row1Box;
    TextField classNameField;
 
    //ROW FOR THE PACKAGE NAME
    HBox row2Box;
    TextField classPackageField;
    
    //ROW FOR THE PARENT CLASS
    HBox row3Box;
    ChoiceBox parentChoice = new ChoiceBox();
    
    //ROW FOR THE VARIABLES
    HBox row4Box;
    Button addVariableButton;
    Button removeVariableButton;
    
    //ROW FOR THE METHOD
    HBox row5Box;
    Button addMethodButton;
    Button removeMethodButton;
     
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
        System.out.println("workspace starting up");
        //KEEP THIS FOR LATER
        app = initApp;
        
        gui = app.getGUI();
        
        initToolbars();
        setupRenderer();
        setupComponent();
    }
    
    /**
     * This function adds the two additional toolbars to the top file toolbar.
     * It also adds the two custom buttons to the GUI toolbar
     */
    
    public void initToolbars(){
        //editToolbar = 
    }
    
    
    /**
     * This function sets up the view of the design renderer
     * 
     */
    
    public void setupRenderer(){
    }
    
    /**
     * This function sets up the component toolbar and all of its buttons
     */
    
    public void setupComponent(){
    }
    
    /**
     * This function returns the current state of the grid checkbox
     * @return A checkBox that represents the gridBox
     */
    
    public CheckBox getGridBox(){
        return this.gridBox;
    }
    
    /**
     * This function returns the current state of the snapBox
     * @return A checkBox that represents the snapBox
     */
    
    public CheckBox getSnapBox(){
        return this.snapBox;
    }
    
    /**
     * This function returns the Choicebox in the Component Toolbar
     * @return a ChoiceBox 
     */
    
    public ChoiceBox getParentChoice(){
        return this.parentChoice;
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
