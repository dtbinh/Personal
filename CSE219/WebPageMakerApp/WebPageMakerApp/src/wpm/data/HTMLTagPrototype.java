package wpm.data;

import java.util.ArrayList;
import java.util.HashMap;
/**
 * This class represents a single element (i.e. tag) in an HTML tree.
 *
 * @author Richard McKenna
 * @author ?
 * @version 1.0
 */
public class HTMLTagPrototype implements Comparable<HTMLTagPrototype>, Cloneable {
    // THESE CONSTANTS HELP US SETUP A MINIMAL PAGE
    public static final String TAG_HTML = "html";
    public static final String TAG_HEAD = "head";
    public static final String TAG_TITLE = "title";
    public static final String TAG_LINK = "link";
    public static final String TAG_BODY = "body";
    public static final String TAG_TEXT = "Text";
    public static final String ATT_REL = "rel";
    public static final String REL_STYLESHEET = "stylesheet";
    public static final String ATT_TYPE = "type";
    public static final String TYPE_TEXT_CSS = "text/css";
    public static final String ATT_HREF = "href";
    public static final String HREF_HOME = "./css/home.css";
    
    // NOW FOR THE DATA FOR EACH TAG
   
    // EACH TAG HAS A NAME, LIKE A PARAGRAPH IS "p"
    String tagName;
    
    // THE SET OF ATTRIBUTES FOR THIS TAG, MEANING NAME, VALUE PAIRS
    HashMap<String, String> attributes;
    
    // THIS IS USEFUL WHEN SAVING THE TREE
    int nodeIndex;
    int parentIndex;
    
    // HELPS KEEP TRACK OF WHERE A TAG CAN BE ADDED TO THE PAGE, FOR
    // EXAMPLE, A TR TAG CANNOT JUST BE ADDED ANYWHERE
    ArrayList<String> legalParents;
    
    // HELPS DURING PAGE GENERATION TO DETERMINE IF THIS PARTICULAR
    // TAG TYPE REQUIRES A CLOSING TAG OR NOT. "br", FOR EXAMPLE,
    // DOES NOT HAVE A CLOSING TAG
    boolean hasClosingTag;
    
    /**
     * Constructor that initializes the minimal requirements, meaning
     * the name of the tag and whether it has a closing tag. Note that 
     * legal parents and attributes must be subsequently provided in
     * order to setup this object properly.
     * 
     * @param initTagName Tag name for this object, like "p" for
     * a paragraph.
     * 
     * @param initHasClosingTag Used to initialize this object, true is
     * for HTML elements that have closing tags, false is for those that
     * don't, like "br".
     */
    public HTMLTagPrototype(String initTagName, boolean initHasClosingTag) {
	// KEEP THE DATA
	tagName = initTagName;
	hasClosingTag = initHasClosingTag;
	
	// AND INIT THE DATA STRUCTURES TO BE FILLED IN LATER
	attributes = new HashMap();
	legalParents = new ArrayList();
    }
    
    /**
     * Accessor method for testing whether or not this
     * tag has a closing tag.
     * 
     * @return true if this element has a closing tag, false
     * otherwise, like for "br" and "img".
     */
    public boolean hasClosingTag() {
	return hasClosingTag;
    }

    /**
     * Accessor method for getting the name of this tag.
     * 
     * @return The name of this tag, i.e. "p" for paragraph.
     */
    public String getTagName() {
	return tagName;
    }

    /**
     * Accessor method for getting the node index for this tag in
     * the HTML page tree.
     * 
     * @return This node's index as it would be saved to a file.
     */
    public int getNodeIndex() {
	return nodeIndex;
    }

    /**
     * Mutator method for setting the node index for this tag.
     * 
     * @param initNodeIndex The updated value to use to set this
     * node's index.
     */
    public void setNodeIndex(int initNodeIndex) {
	nodeIndex = initNodeIndex;
    }
    
    /**
     * Accessor method for getting the parent index for this tag in
     * the HTML page tree.
     * 
     * @return This node's parent index as it would be saved to a file.
     */
    public int getParentIndex() {
	return parentIndex;
    }

   /**
     * Mutator method for setting the parent index for this tag.
     * 
     * @param initParentIndex The updated value to use to set this
     * node's parent index.
     */
    public void setParentIndex(int initParentIndex) {
	parentIndex = initParentIndex;
    }

    /**
     * Adds the name, value pair to our attributes for this tag.
     * 
     * @param name The name of the attribute to add.
     * 
     * @param value The value for the attribute to add.
     */
    public void addAttribute(String name, String value) {
	attributes.put(name, value);
    }
    
    /**
     * Accessor method for getting an attribute for this tag.
     * 
     * @param name The name of the attribute to get.
     * 
     * @return The value corresponding to the attribute name
     * for this element.
     */
    public String getAttribute(String name) {
	return attributes.get(name);
    }
    
    /**
     * Accessor method for getting all of this tag's attributes
     * 
     * @return The complete hash table of attributes for this element.
     */
    public HashMap<String,String> getAttributes() { 
	return attributes;
    }
    
    /**
     * This method tests to see if the testParent argument is
     * a legal parent tag for this type of tag.
     * 
     * @param testParent The name of the parent tag to test to
     * see if this node can be added to such an element.
     * 
     * @return true if this node could be added to a testParent
     * element, false otherwise.
     */
    public boolean isLegalParent(String testParent) {
	return legalParents.contains(testParent);
    }

    /**
     * This method adds the parent argument to the list of
     * legal parent tags for this element.
     * 
     * @param parent The name of the element to add to
     * the list of legal parents for this node.
     */
    public void addLegalParent(String parent) {
	legalParents.add(parent);
    }

    /**
     * Accessor method for getting the full set of legal
     * parents for this element.
     * 
     * @return The list of all legal parents for this element.
     */
    public ArrayList<String> getLegalParents() {
	return legalParents;
    }
    
    /**
     * This method generates and returns a textual representation
     * of this tag, which we'll only use for displaying tags inside
     * the tree.
     * 
     * @return The textual representation of this element.
     */
    @Override
    public String toString() {
	return "<" + tagName + ">";
    }

    /**
     * Used for sorting tags, this method is used for comparing
     * one tag to another for that purpose.
     * 
     * @param otherTag The tag to compare to this tag.
     * 
     * @return true if the name of this tag is alphabetically before
     * that of the other tag. false otherwise.
     */
    @Override
    public int compareTo(HTMLTagPrototype otherTag) {
	return tagName.compareTo(otherTag.getTagName());
    }

    /**
     * This class employs the prototype design pattern in that
     * whenever we wish to add a new tag to our tree, we start by
     * cloning a similar one. This method provides the clone
     * implementation, initializing the object with the same name
     * but empty attributes.
     * 
     * @return A newly constructed tag object it the same tag name
     * and attributes, but empty attribute values.
     */
    @Override
    public HTMLTagPrototype clone() {
	// MAKE A NEW OBJECT
	HTMLTagPrototype clonedTag = new HTMLTagPrototype(tagName, hasClosingTag);
	
	// MAKE SURE IT HAS THE SAME LEGAL PARENTS
	clonedTag.legalParents = legalParents;
	
	// WE WANT ALL THE SAME ATTRIBUTS, BUT NO VALUES
	for (String attributeName : attributes.keySet()) {
	    clonedTag.addAttribute(attributeName, "");
	}
	// AND RETURN THE CLONED OBJECT
	return clonedTag;
    }
}