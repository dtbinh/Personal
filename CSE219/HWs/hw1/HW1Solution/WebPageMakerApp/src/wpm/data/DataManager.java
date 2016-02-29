package wpm.data;

import java.util.ArrayList;
import java.util.HashMap;
import javafx.scene.control.TreeItem;
import saf.components.AppDataComponent;
import saf.AppTemplate;
import static wpm.data.HTMLTagPrototype.ATT_HREF;
import static wpm.data.HTMLTagPrototype.ATT_REL;
import static wpm.data.HTMLTagPrototype.ATT_TYPE;
import static wpm.data.HTMLTagPrototype.HREF_HOME;
import static wpm.data.HTMLTagPrototype.REL_STYLESHEET;
import static wpm.data.HTMLTagPrototype.TAG_BODY;
import static wpm.data.HTMLTagPrototype.TAG_HEAD;
import static wpm.data.HTMLTagPrototype.TAG_LINK;
import static wpm.data.HTMLTagPrototype.TAG_TITLE;
import static wpm.data.HTMLTagPrototype.TYPE_TEXT_CSS;
import wpm.file.FileManager;
import wpm.gui.Workspace;

/**
 * This class serves as the data management component for this application.
 *
 * @author Richard McKenna
 * @author ?
 * @version 1.0
 */
public class DataManager implements AppDataComponent {

    // THIS FILE HAS THE LIST OF TAGS OUR APPLICATION WILL USE
    static final String TAG_TYPES_FILE_PATH = "data/tags.json";

    // THESE ARE ALL THE AVAILABLE TAGS FROM WHICH WE WILL CLONE
    ArrayList<HTMLTagPrototype> tags;
    HashMap<String, HTMLTagPrototype> hashTags;

    // THIS IS THE ROOT OF THE TREE, FROM WHICH WE CAN
    // ACCESS THE ENTIRE TREE
    TreeItem htmlRoot;
    
    // THE FULL CONTENTS OF THE CSS FILE
    String cssText;

    // THIS IS A SHARED REFERENCE TO THE APPLICATION
    AppTemplate app;

    /**
     * THis constructor creates the data manager and sets up the
     *
     *
     * @param initApp The application within which this data manager is serving.
     */
    public DataManager(AppTemplate initApp) throws Exception {
	// KEEP THE APP FOR LATER
	app = initApp;

	// WE'LL STORE THE TAGS HERE
	tags = new ArrayList();
	hashTags = new HashMap();

	// NOW LOAD ALL THE TAGS WE'LL USE
	FileManager fileManager = (FileManager) app.getFileComponent();
	fileManager.loadHTMLTags(this, TAG_TYPES_FILE_PATH);
    }
    
    /**
     * Accessor method for getting the CSS text.
     * 
     * @return The contents of the CSS file for the page.
     */
    public String getCSSText() {
	return cssText;
    }
    
    /**
     * Mutator method for setting css text.
     * 
     * @param initCSSText The text to set for the css text.
     */
    public void setCSSText(String initCSSText) {
	cssText = initCSSText;
    }

    /**
     * Accessor method for getting the tree's root node.
     *
     * @return The root of the tree.
     */
    public TreeItem getHTMLRoot() {
	return htmlRoot;
    }

    /**
     * Mutator method for setting the tree's root node.
     *
     * @param initHTMLRoot The value to set as the root of the tree.
     */
    public void setHTMLRoot(TreeItem initHTMLRoot) {
	htmlRoot = initHTMLRoot;
    }

    /**
     * Accessor method for getting a tag.
     *
     * @param tagName The name of the tag to return.
     *
     * @return The HTMLTagPrototype object that has tagName as its name.
     */
    public HTMLTagPrototype getTag(String tagName) {
	return hashTags.get(tagName);
    }

    /**
     * This method adds the tag argument to the set of tags.
     *
     * @param tag A tag representing an HTML element.
     */
    public void addTag(HTMLTagPrototype tag) {
	tags.add(tag);
	hashTags.put(tag.tagName, tag);
    }

    /**
     * Accessor method for getting all the tags.
     *
     * @return A list containing all the tags used by this data manager.
     */
    public ArrayList<HTMLTagPrototype> getTags() {
	return tags;
    }

    /**
     * This function clears out the HTML tree and reloads it with the minimal
     * tags, like html, head, and body such that the user can begin editing a
     * page.
     */
    @Override
    public void reset() {
	// LET'S BUILD OUR START TAGS
	HTMLTagPrototype headTag = new HTMLTagPrototype(TAG_HEAD, true);
	HTMLTagPrototype titleTag = new HTMLTagPrototype(TAG_TITLE, true);
	HTMLTagPrototype linkTag = new HTMLTagPrototype(TAG_LINK, false);
	linkTag.addAttribute(ATT_REL, REL_STYLESHEET);
	linkTag.addAttribute(ATT_TYPE, TYPE_TEXT_CSS);
	linkTag.addAttribute(ATT_HREF, HREF_HOME);
	HTMLTagPrototype bodyTag = new HTMLTagPrototype(TAG_BODY, true);

	// NOW MAKE THE NODES
	Workspace workspace = (Workspace) app.getWorkspaceComponent();
	TreeItem headItem = new TreeItem(headTag);
	TreeItem titleItem = new TreeItem(titleTag);
	TreeItem linkItem = new TreeItem(linkTag);
	TreeItem bodyItem = new TreeItem(bodyTag);

	// FIRST CLEAR OUT ANY OLD STUFF
	htmlRoot.getChildren().clear();

	// AND ARRANGE THEM IN THE TREE
	htmlRoot.getChildren().add(headItem);
	headItem.getChildren().add(titleItem);
	headItem.getChildren().add(linkItem);
	htmlRoot.getChildren().add(bodyItem);
	
	// AND FINALLY CLEAR THE CSS
	cssText = "";
    }
}
