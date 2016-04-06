/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jclassdesigner.gui;

import java.io.IOException;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Text;
import jclassdesigner.controller.CanvasController;
import jclassdesigner.controller.ComponentEditController;
import jclassdesigner.data.UMLTagPrototype;
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
    public static final String CLASS_PART_TOOLBAR = "toolbar";
    public static final String CLASS_TOOLBAR_BUTTON = "toolbar_button";
    public static final String CLASS_RENDER_CANVAS = "render_canvas";
    public static final String CLASS_COMPONENT_EDITOR = "component_editor";
    public static final String CLASS_LABEL = "class_label";
    public static final String CLASS_TEXT_FIELD = "text_field";
    public static final String CLASS_NORMAL_LABEL = "normal_label";
    public static final String CLASS_LABEL_FIELD = "label_field";
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
    
    //THIS WILL BE WHERE WE DISPLAY ALL THE STUFF
    Pane canvas;
    
    //THIS IS WHERE WE COMPONENT STUFF
    VBox componentToolbar;
    
    //ROW FOR THE CLASS NAME
    FlowPane row1Pane;
    Label classLabel;
    TextField classNameField;
    
    FlowPane row2Pane;
    Label packageLabel;
    TextField classPackageField;
    
    FlowPane row3Pane;
    Label parentLabel;
    ChoiceBox parentChoice = new ChoiceBox();
    
    //ROW FOR THE VARIABLES
    HBox row4Box;
    Label variableLabel;
    Button addVariableButton;
    Button removeVariableButton;
    
    //ROW FOR THE METHOD
    HBox row5Box;
    Label methodLabel;
    Button addMethodButton;
    Button removeMethodButton;
    
    String mode;
    Text debugText;
     
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
        //KEEP THIS FOR LATER
        app = initApp;
        
        gui = app.getGUI();
        layoutGUI();
        initHandlers();
        
    }
    
    
    /**
     * This function sets up the view of the design renderer and the component toolbar
     * 
     */
    
    public void layoutGUI(){
        componentToolbar = new VBox();
        
        
        row1Pane = new FlowPane();
        classLabel = new Label("Class Name:          ");
        classNameField = new TextField();
        row1Pane.getChildren().add(classLabel);
        row1Pane.getChildren().add(classNameField);
        componentToolbar.getChildren().add(row1Pane);
        
        row2Pane = new FlowPane();
        packageLabel = new Label("Package:                              ");
        classPackageField = new TextField();
        row2Pane.getChildren().add(packageLabel);
        row2Pane.getChildren().add(classPackageField);
        componentToolbar.getChildren().add(row2Pane);
        
        row3Pane = new FlowPane();
        parentLabel = new Label("Parent:                                    ");
        parentChoice = new ChoiceBox();
        row3Pane.getChildren().add(parentLabel);
        row3Pane.getChildren().add(parentChoice);
        componentToolbar.getChildren().add(row3Pane);
        
        canvas = new Pane();
        debugText = new Text();
        canvas.getChildren().add(debugText);
        workspace = new BorderPane();
        debugText.setX(100);
        debugText.setY(100);
        componentToolbar.setPrefWidth(500);
        ((BorderPane)workspace).setRight(componentToolbar);
        ((BorderPane)workspace).setCenter(canvas);
        mode = "adding";
    }
    
    public void initHandlers(){
        componentEditController = new ComponentEditController(app);
        classNameField.setOnKeyReleased(e -> {  
            componentEditController.handleClassNameUpdate(classNameField.getText());
        });
        gui.getAddClassButton().setOnAction(e -> {
            componentEditController.handleNewClassRequest();
            gui.getSelectionButton().setDisable(false);
            mode = "adding";
        });
        gui.getSelectionButton().setOnAction(e ->{
            mode = "selecting";
            gui.getSelectionButton().setDisable(true);
        });
        
        canvasController = new CanvasController(app);
        canvas.setOnMousePressed(eh -> {
            canvasController.processCanvasMousePress((int)eh.getX(), (int)eh.getY());
        });
        
        canvas.setOnMouseDragged(e -> {
            canvasController.processCanvasMouseDragged((int)e.getX(), (int)e.getY());
        });
        
        canvas.setOnMouseReleased(e -> {
            canvasController.processCanvasMouseRelease((int)e.getX(), (int)e.getY());
        });
    }
    
    public String getMode(){
        return this.mode;
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
        canvas.getStyleClass().add(CLASS_RENDER_CANVAS);
        componentToolbar.getStyleClass().add(CLASS_COMPONENT_EDITOR);
        classLabel.getStyleClass().add(CLASS_LABEL);
        row1Pane.getStyleClass().add(CLASS_LABEL_FIELD);
        packageLabel.getStyleClass().add(CLASS_NORMAL_LABEL);
        parentLabel.getStyleClass().add(CLASS_NORMAL_LABEL);
    }
    
    /**
     * retrieves the textField for the class Name
     * @return TextField The textfield for the class name
     */
    
    public TextField getClassName(){
        return classNameField;
    }
    
    /**
     * retrieves the choicebox for the list of parent classes available
     */
    
    public ChoiceBox getParents(){
        return parentChoice;
    }
    
    
    public Pane getCanvas(){
        return this.canvas;
    }
    
    public void loadSelectedTagProperties(UMLTagPrototype tag){
        if(tag != null){
            classNameField.setText(tag.getClassName());
            classPackageField.setText(tag.getPackageName());
        }
    }
    
    public void setMode(String newMode){
        this.mode = newMode;
    }
    
}
