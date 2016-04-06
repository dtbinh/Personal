
package jclassdesigner.data;

import java.util.ArrayList;
import javafx.collections.ObservableList;
import javafx.geometry.Point2D;
import javafx.scene.Node;
import javafx.scene.effect.BlurType;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.Effect;
import javafx.scene.paint.Color;
import jclassdesigner.gui.Workspace;
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
    public static final String YELLOW_HEX = "#EEEE00";
    
    Effect highlightedEffect;
    UMLTagPrototype selectedTag;
    
    
    
    
    
      /**
     * This constructor creates the data manager and sets up the
     *
     *
     * @param initApp The application within which this data manager is serving.
     */
    public DataManager(AppTemplate initApp) throws Exception {
        app = initApp;
        classes = new ArrayList();
        selectedTag = null;
        
        //FOR THE SELECTED TAG
        DropShadow dropShadowEffect = new DropShadow();
	dropShadowEffect.setOffsetX(0.0f);
	dropShadowEffect.setOffsetY(0.0f);
	dropShadowEffect.setSpread(1.0);
	dropShadowEffect.setColor(Color.YELLOW);
	dropShadowEffect.setBlurType(BlurType.GAUSSIAN);
	dropShadowEffect.setRadius(15);
	highlightedEffect = dropShadowEffect;
        
    }
    
    
    
     /**
     * This function clears out the HTML tree and reloads it with the minimal
     * tags, like html, head, and body such that the user can begin editing a
     * page.
     */
    @Override
    public void reset() {
    }
    
    public void addNewClass(){
        Workspace workspace = (Workspace) app.getWorkspaceComponent();
        UMLTagPrototype tag = new UMLTagPrototype();
        classes.add(tag);
        double xbounds = (workspace.getCanvas().getWidth()) - 115;
        double ybounds = (workspace.getCanvas().getHeight()) - 115;
        xbounds *= Math.random();
        ybounds *= Math.random();
        tag.getLabel().setLayoutX(xbounds);
        tag.setX(xbounds);
        tag.getLabel().setLayoutY(ybounds);
        tag.setY(ybounds);
        workspace.getCanvas().getChildren().add(tag.getLabel());
    }
    
    
    public UMLTagPrototype getTopTag(int x, int y){
        Point2D value = new Point2D(x, y);
        for(int i = classes.size() - 1; i >= 0; i--){
            UMLTagPrototype tag = (UMLTagPrototype)classes.get(i);
            if(tag.getLabel().getBoundsInParent().contains(value)){
                return tag;       
            }
        }
        return null;
    }
    
    public UMLTagPrototype selectTopTag(int x, int y){
        UMLTagPrototype tag = getTopTag(x,y);
        if(tag == selectedTag){
            return tag;
        }
        if(selectedTag != null){
            unhighlightTag(selectedTag);
        }
        if(tag != null){
            highlightTag(tag);
            Workspace workspace = (Workspace)app.getWorkspaceComponent();
            workspace.loadSelectedTagProperties(tag);
        }
        selectedTag = tag;        
        return tag;
    }
    
    public void unhighlightTag(UMLTagPrototype tag){
        selectedTag.getLabel().setEffect(null);
    }
    
    
    public void highlightTag(UMLTagPrototype tag){
        tag.getLabel().setEffect(highlightedEffect);
    }
    
    public UMLTagPrototype getSelectedTag(){
        return this.selectedTag;
    }
    
    
}