package wpm.gui;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import saf.ui.AppYesNoCancelDialogSingleton;
import saf.ui.AppMessageDialogSingleton;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Orientation;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ScrollPane;
import javafx.scene.control.SelectionMode;
import javafx.scene.control.SplitPane;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import properties_manager.PropertiesManager;
import saf.ui.AppGUI;
import wpm.data.HTMLTagPrototype;
import saf.AppTemplate;
import saf.components.AppWorkspaceComponent;
import wpm.PropertyType;
import static wpm.PropertyType.TEMP_PAGE_LOAD_ERROR_MESSAGE;
import static wpm.PropertyType.TEMP_PAGE_LOAD_ERROR_TITLE;
import static wpm.PropertyType.UPDATE_ERROR_MESSAGE;
import static wpm.PropertyType.UPDATE_ERROR_TITLE;
import wpm.WebPageMaker;
import wpm.controller.PageEditController;
import wpm.data.DataManager;
import static wpm.data.HTMLTagPrototype.TAG_HTML;
import wpm.file.FileManager;
import static wpm.file.FileManager.TEMP_PAGE;

/**
 * This class serves as the workspace component for this application, providing
 * the user interface controls for editing work.
 *
 * @author Richard McKenna
 * @author ?
 * @version 1.0
 */
public class Workspace extends AppWorkspaceComponent {

    // THESE CONSTANTS ARE FOR TYING THE PRESENTATION STYLE OF
    // THIS Workspace'S COMPONENTS TO A STYLE SHEET THAT IT USES
    static final String CLASS_MAX_PANE = "max_pane";
    static final String CLASS_TAG_BUTTON = "tag_button";
    static final String CLASS_BLUE_BACKGROUND = "blue_background";//brings in the blue background from the wpm_style.css
    static final String CLASS_WHITE_BACKGROUND = "white_background";//brings in the white background from the wpm_style.css 
    static final String EMPTY_TEXT = "";
    static final int BUTTON_TAG_WIDTH = 75;

    // HERE'S THE APP
    AppTemplate app;

    // IT KNOWS THE GUI IT IS PLACED INSIDE
    AppGUI gui;

    // THIS HANDLES INTERACTIONS WITH PAGE EDITING CONTROLS
    PageEditController pageEditController;

    // WE'LL PUT THE WORKSPACE INSIDE A SPLIT PANE
    SplitPane workspaceSplitPane;

    // THESE ARE THE BUTTONS FOR ADDING AND REMOVING COMPONENTS
    BorderPane leftPane;
    Pane tagToolbar;
    ScrollPane tagToolbarScrollPane;
    ArrayList<Button> tagButtons;
    HashMap<String, HTMLTagPrototype> tags;
    ArrayList<Button> unallowedTags;//added to make sure rules of legal parents are enforced

    // THIS IS THE TREE REPRESENTING THE DOM
    TreeView htmlTree;
    TreeItem<HTMLTagPrototype> htmlRoot;
    ScrollPane treeScrollPane;

    // AND FOR EDITING A TAG
    GridPane tagEditorPane;
    ScrollPane tagEditorScrollPane;
    Label tagEditorLabel;
    ArrayList<Label> tagPropertyLabels;
    ArrayList<TextField> tagPropertyTextFields;

    // THIS WILL CONTAIN BOTH THE TREE AND THE TREE EDITOR
    VBox editVBox;

    // THIS IS WHERE WE CAN VIEW THE WEB PAGE OR DIRECTLY EDIT THE CSS
    TabPane rightPane;
    WebView htmlView;
    WebEngine htmlEngine;
    TextArea cssEditor;

    // HERE ARE OUR DIALOGS
    AppMessageDialogSingleton messageDialog;
    AppYesNoCancelDialogSingleton yesNoCancelDialog;

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
	// KEEP THIS FOR LATER
	app = initApp;

	// KEEP THE GUI FOR LATER
	gui = app.getGUI();

	// THIS WILL PROVIDE US WITH OUR CUSTOM UI SETTINGS AND TEXT
	PropertiesManager propsSingleton = PropertiesManager.getPropertiesManager();

	// WE'LL ORGANIZE OUR WORKSPACE COMPONENTS USING A BORDER PANE
	workspace = new BorderPane();

	// FIRST THE LEFT HALF OF THE SPLIT PANE
	leftPane = new BorderPane();

	// THIS WILL MANAGE ALL EDITING EVENTS
	pageEditController = new PageEditController((WebPageMaker) app);

	// THIS IS THE TOP TOOLBAR
	tagToolbar = new FlowPane(Orientation.VERTICAL);
	tagToolbarScrollPane = new ScrollPane(tagToolbar);
	tagToolbarScrollPane.setFitToHeight(true);
	tagButtons = new ArrayList();
	tags = new HashMap();
        

	// LOAD ALL THE HTML TAG TYPES
	FileManager fileManager = (FileManager) app.getFileComponent();
	DataManager dataManager = (DataManager) app.getDataComponent();

	// AND NOW MAKE THE TREE
	htmlTree = new TreeView();
	treeScrollPane = new ScrollPane(htmlTree);
	htmlTree.getSelectionModel().setSelectionMode(SelectionMode.SINGLE);
	htmlTree.getSelectionModel().selectedItemProperty().addListener(e -> {
	    reloadWorkspace();
	});

	// NOW RESET THE TREE
	HTMLTagPrototype htmlTag = new HTMLTagPrototype(TAG_HTML, true);
	htmlRoot = new TreeItem(htmlTag);
	htmlTree.setRoot(htmlRoot);
	dataManager.setHTMLRoot(htmlRoot);
	dataManager.reset();

	// AND NOW USE THE LOADED TAG TYPES TO ADD BUTTONS
	for (HTMLTagPrototype tag : dataManager.getTags()) {
	    // MAKE THE BUTTON
	    Button tagButton = new Button(tag.getTagName());
	    tagButtons.add(tagButton);
	    tagButton.setMaxWidth(BUTTON_TAG_WIDTH);
	    tagButton.setMinWidth(BUTTON_TAG_WIDTH);
	    tagButton.setPrefWidth(BUTTON_TAG_WIDTH);
	    tagToolbar.getChildren().add(tagButton);

	    // INIT ITS EVENT HANDLER
            //code added here in order to handle deleter
	    tagButton.setOnAction(e -> {
		String tagName = tagButton.getText();// find out the name of the Button you pressed
                TreeItem selectedItem = (TreeItem) htmlTree.getSelectionModel().getSelectedItem();//figure out which leaf in the tree your at
                HTMLTagPrototype selectedTag = (HTMLTagPrototype) selectedItem.getValue();//Getting the selected tag
                String currentTagName = selectedTag.getTagName();//grab the name of the current tag in the tree youre on
                
                if("X".equals(tagName)){//You hit the X button, go to the next method
                    removeCurrentTag(currentTagName);
                }else{  
		HTMLTagPrototype clickedTag = dataManager.getTag(tagName);
		pageEditController.handleAddElementRequest(clickedTag);//here
                }
	    });
	}

	// AND NOW THE REGION FOR EDITING TAG PROPERTIES
	tagEditorPane = new GridPane();
	tagEditorScrollPane = new ScrollPane(tagEditorPane);
	tagEditorLabel = new Label("Tag Editor");
	tagPropertyLabels = new ArrayList();
	tagPropertyTextFields = new ArrayList();

	// PUT THEM IN THE LEFT
	leftPane.setLeft(tagToolbarScrollPane);
	leftPane.setCenter(treeScrollPane);
	leftPane.setBottom(tagEditorScrollPane);

	// NOW FOR THE RIGHT
	rightPane = new TabPane();
	htmlView = new WebView();
	htmlEngine = htmlView.getEngine();
	cssEditor = new TextArea();

	// PUT BOTH ITEMS IN THE TAB PANE
	Tab htmlTab = new Tab();
	htmlTab.setText("HTML");
	htmlTab.setContent(htmlView);

	// NOW FOR THE CSS
	Tab cssTab = new Tab();
        cssTab.setClosable(false);
	cssTab.setText("CSS");
	cssTab.setContent(cssEditor);
	rightPane.getTabs().add(htmlTab);
	rightPane.getTabs().add(cssTab);

	// SETUP THE RESPONSE TO CSS EDITING
	cssEditor.textProperty().addListener(e -> {
	    pageEditController.handleCSSEditing(cssEditor.getText());
	});

	// AND NOW PUT IT IN THE WORKSPACE
	workspaceSplitPane = new SplitPane();
	workspaceSplitPane.getItems().add(leftPane);
	workspaceSplitPane.getItems().add(rightPane);

	// AND FINALLY, LET'S MAKE THE SPLIT PANE THE WORKSPACE
	workspace = new Pane();
	workspace.getChildren().add(workspaceSplitPane);

        // NOTE THAT WE HAVE NOT PUT THE WORKSPACE INTO THE WINDOW,
	// THAT WILL BE DONE WHEN THE USER EITHER CREATES A NEW
	// COURSE OR LOADS AN EXISTING ONE FOR EDITING
	workspaceActivated = false;

	// MAKE SURE THE FILE MANAGER HAS THE ROOT AND THEN
	// EXPORT THE SITE TO THE temp DIRECTORY. THEN, LOAD
	// IT INTO THE WEB ENGINE
	dataManager.setHTMLRoot(htmlRoot);
	fileManager.exportData(dataManager, TEMP_PAGE);
	loadTempPage();
    }

    /**
     * Accessor method for getting the html engine, which is tied to the page
     * display.
     *
     * @return The html engine for the Web view component.
     */
    public WebEngine getHTMLEngine() {
	return htmlEngine;
    }
    
    /**
     * Remove method for the workspace to be used if the 'X' tag is chosen
     * @param tagName String form of the name of the Tag
     */
    public void removeCurrentTag(String tagName){//If you are going to delete something, normal conventions cannot be used
        System.out.println(tagName);
        //Check to make sure the tag you want to remove allows itself to be removed
        if("html".equals(tagName)){
            System.out.println("You cannot remove this core tag");
        }else if("head".equals(tagName)){
            System.out.println("You cannot remove this core tag");
        }else if("body".equals(tagName)){
            System.out.println("You cannot remove this core tag");
        }else if("title".equals(tagName)){
            System.out.println("You cannot remove this core tag");
        }else{//Else proceed with deleting the tag
            //HOWEVER BEFORE YOU CAN DELETE YOU MUST BE READY TO DELETE
            
        //prompt the user to see if they really want to delete
            
            Button btn1 = new Button("YES");
            Button btn2 = new Button("NO");
            GridPane pane = new GridPane();
            pane.setAlignment(Pos.CENTER);
            pane.add(new Label("Are you sure you want to delete this Tag?"),0,0);
            pane.add(btn1, 0, 1);
            pane.add(btn2, 1, 1);
            Stage buttonStage = new Stage(); 
            Scene buttonScene = new Scene(pane, 275, 150);
            buttonStage.setTitle("Delete Tag Prompt");
            buttonStage.setScene(buttonScene);
            buttonStage.show();
        
        
            btn1.setOnAction((ActionEvent event) -> {//Answer was yes
                Workspace workspace2 = (Workspace) app.getWorkspaceComponent();
                TreeView tree = workspace2.getHTMLTree();
                TreeItem selectedItem = (TreeItem) tree.getSelectionModel().getSelectedItem();
                selectedItem.getParent().getChildren().remove(selectedItem);
                //selectedItem.setValue(null);
                workspace2.reloadWorkspace();
                buttonStage.close();
            });

            btn2.setOnAction((ActionEvent event) -> {//Answer was no
                Workspace workspace3 = (Workspace) app.getWorkspaceComponent();//workspace reload
                workspace3.reloadWorkspace();
                buttonStage.close();
            });
        }
    }
    
    /**
     * Accessor method for getting the html tree, which contains all the tags
     * for the page being edited.
     *
     * @return The html tree being edited.
     */
    public TreeView getHTMLTree() {
	return htmlTree;
    }

    /**
     * Accessor method for getting the root node of the html tree. Through that
     * node one can access the full DOM.
     *
     * @return The root node of the html tree currently being edited.
     */
    public TreeItem getHTMLRoot() {
	return htmlRoot;
    }

    /**
     * Mutator method for setting the root node for the html tree.
     *
     * @param initRoot The node to use to set the root.
     */
    public void setHTMLRoot(TreeItem initRoot) {
	htmlTree.setRoot(initRoot);
	htmlRoot = initRoot;
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
	// CSS FILE
	//tagToolbar.getStyleClass().add(CLASS_BLUE_BACKGROUND);
        //tagToolbar.getStyleClass().add(CLASS_BLUE_BACKGROUND);
	for(Button b : tagButtons) {
	    b.getStyleClass().add(CLASS_TAG_BUTTON);
	}
	leftPane.getStyleClass().add(CLASS_WHITE_BACKGROUND);
       // leftPane.getStyleClass().add(CLASS_BORDERBLUE_PANE);
	treeScrollPane.getStyleClass().add(CLASS_MAX_PANE);
	tagEditorLabel.getStyleClass().add(CLASS_HEADING_LABEL);
        tagEditorScrollPane.getStyleClass().add(CLASS_WHITE_BACKGROUND);
        tagToolbar.getStyleClass().add(CLASS_BLUE_BACKGROUND);
        //gui.getFileToolbar().getStyleClass().add(CLASS_BLUE_BACKGROUND);         //).getStyleClass().add(CLASS_BLUE_BACKGROUND);
    }

    /**
     * This function reloads all the controls for editing tag attributes into
     * the workspace.
     */
    @Override
    public void reloadWorkspace() {
	try {
	    // WE DON'T WANT TO RESPOND TO EVENTS FORCED BY
	    // OUR INITIALIZATION SELECTIONS
	    pageEditController.enable(false);

	    // FIRST CLEAR OUT THE OLD STUFF
	    tagPropertyLabels.clear();
	    tagPropertyTextFields.clear();
	    tagEditorPane.getChildren().clear();

	    // FIRST ADD THE LABEL
	    tagEditorPane.add(tagEditorLabel, 0, 0, 2, 1);

	    // THEN LOAD IN ALL THE NEW STUFF
	    TreeItem selectedItem = (TreeItem) htmlTree.getSelectionModel().getSelectedItem();
	    if (selectedItem != null) {
		HTMLTagPrototype selectedTag = (HTMLTagPrototype) selectedItem.getValue();//Getting the selected tag
		HashMap<String, String> attributes = selectedTag.getAttributes();//Getting the selected tags' attributes in a Hashmap
		Collection<String> keys = attributes.keySet();//Gets the keys of the HashMap of the attributes
                ArrayList<String> tempParents = selectedTag.getLegalParents();//Arraylist of the Legal parents 
                               
                //System.out.println(attributes);
               /* 
                int size1 = tagToolbar.getChildren().size();//Amount of Tags there are in the Toolbar
                DataManager dataManager2 = (DataManager) app.getDataComponent();
                
                for(int i = 0; i < size1; i++){
                    Button buttonTemp = (Button) tagToolbar.getChildren().get(i);//GRAB EACH BUTTON
                    String stringTemp = buttonTemp.getText();//GET THE TEXT FROM EACH BUTTON
                    HTMLTagPrototype tagTemp = dataManager2.getTag(stringTemp);//GET THE TAG 
                    String currentStringTemp = selectedTag.getTagName();
                    if(!(tagTemp.isLegalParent(currentStringTemp))){
                        Button temp2 = (Button) tagToolbar.getChildren().remove(i);
                    }
                    
                }
                */
                //ITERATE THROUGH EACH OF THE BUTTONS
                //REMOVE THEM IF THEY ARE NOT LEGAL PARENTS BUT STORE THEM
                //ADD ANY THAT ARE NOT DISPLAYED
                
               /* 
                //System.out.println((tagToolbar.getChildren()).get(2));
                
                for(int i = 0; i < tempParents.size() - 1; i++){
                    String a = selectedTag.getTagName();
                    Button temp = tagButtons.get(i);
                    HTMLTagPrototype y = tags.get(temp.getText());
                   System.out.println(y.getTagName());
                    
                   if(!(.isLegalParent(a))){
                        unallowedTags.add((Button)(tagToolbar.getChildren().remove(i)));
                    }
                }
                DataManager dataManager = (DataManager) app.getDataComponent();
                Button temp = tagButtons.get(2);
                System.out.println(temp.getText());
                HTMLTagPrototype temp2 = dataManager.getTag(temp.getText());
                System.out.println(temp2.getTagName());
                System.out.println();
               //System.out.println(y.getTagName());
                    
                //End of Code Insertion
                
                */
		int row = 1;
		for (String attributeName : keys) {
		    String attributeValue = selectedTag.getAttribute(attributeName);
		    Label attributeLabel = new Label(attributeName + ": ");
		    attributeLabel.getStyleClass().add(CLASS_PROMPT_LABEL);
		    TextField attributeTextField = new TextField(attributeValue);
		    attributeTextField.getStyleClass().add(CLASS_PROMPT_TEXT_FIELD);
		    tagEditorPane.add(attributeLabel, 0, row);
		    tagEditorPane.add(attributeTextField, 1, row);
		    attributeTextField.textProperty().addListener(e -> {
			// UPDATE THE TEMP SITE AS WE TYPE ATTRIBUTE VALUES
			pageEditController.handleAttributeUpdate(selectedTag, attributeName, attributeTextField.getText());
		    });
		    row++;
		}
	    }

	    // LOAD THE CSS
	    DataManager dataManager = (DataManager) app.getDataComponent();
	    cssEditor.setText(dataManager.getCSSText());

	    // THEN FORCE THE CHANGES TO THE TEMP HTML PAGE
	    FileManager fileManager = (FileManager) app.getFileComponent();
	    fileManager.exportData(dataManager, TEMP_PAGE);

	    // WE DON'T WANT TO RESPOND TO EVENTS FORCED BY
	    // OUR INITIALIZATION SELECTIONS
	    pageEditController.enable(true);
	} catch (Exception e) {
	    AppMessageDialogSingleton dialog = AppMessageDialogSingleton.getSingleton();
	    PropertiesManager props = PropertiesManager.getPropertiesManager();
	    dialog.show(props.getProperty(UPDATE_ERROR_TITLE), props.getProperty(UPDATE_ERROR_MESSAGE));
	}
    }

    /**
     * This function loads the temp page into the web view.
     */
    public void loadTempPage() {
	String urlPath = TEMP_PAGE;
	File webPageFile = new File(urlPath);
	try {
	    URL pageURL = webPageFile.toURI().toURL();
	    String pagePath = pageURL.toString();
	    htmlEngine.load(pagePath);
	} catch (MalformedURLException murle) {
	    PropertiesManager props = PropertiesManager.getPropertiesManager();
	    AppMessageDialogSingleton dialog = AppMessageDialogSingleton.getSingleton();
	    dialog.show(props.getProperty(TEMP_PAGE_LOAD_ERROR_TITLE), props.getProperty(TEMP_PAGE_LOAD_ERROR_MESSAGE));
	}
    }
}
