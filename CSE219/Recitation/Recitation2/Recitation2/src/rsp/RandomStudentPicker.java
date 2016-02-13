package rsp;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javafx.application.Application;
import javafx.application.Platform;
import javafx.concurrent.Task;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.stage.Stage;
import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonObject;
import javax.json.JsonReader;

/**
 * This is a simple little program useful for randomly picking students
 * registered in our class to be called on to answer a question during lecture.
 *
 * @author Richard McKenna
 */
public class RandomStudentPicker extends Application {

    String STUDENT_NAMES_FILE = "./data/CSE219_Fall2015_Students.json";
    HashMap<String, Image> images;
    int currentIndex = 0;

    // THESE ARE OUR ONLY CONTROLS, A BUTTON AND A DISPLAY LABEL
    Button prevButton = new Button("Previous");
    Button nextButton = new Button("Next");
    Button pickButton = new Button("Random");
    ArrayList<String> students = new ArrayList();
    final Label studentNameLabel = new Label();
    final ImageView studentImageView = new ImageView();

    public Image loadImage(String imagePath) throws MalformedURLException {
	File file = new File(imagePath);
	URL fileURL = file.toURI().toURL();
	Image image = new Image(fileURL.toExternalForm());
	return image;
    }

    @Override
    public void start(Stage primaryStage) throws IOException {
	// SET THE TITLE
	primaryStage.setTitle("The Random Student Picker");
	
	// LOAD THE JSON FILE FULL OF NAMES
	JsonObject json = loadJSONFile(STUDENT_NAMES_FILE);
	JsonArray studentsArray = json.getJsonArray("names");
	images = new HashMap();
	for (int i = 0; i < studentsArray.size(); i++) {
	    String studentName = studentsArray.getString(i);
	    try {
		Image studentImage = loadImage("images/" + studentName + ".JPG");
		images.put(studentName, studentImage);
		students.add(studentName);
	    } catch (Exception e) {
		System.out.println("ERROR: " + studentName);
	    }
	}
	// CUSTOMIZE OUR FONTS
	List<String> fontFamilies = javafx.scene.text.Font.getFamilies();
	String randomFontFamily = fontFamilies.get((int)(Math.random()*fontFamilies.size()));
	Font buttonFont = new Font(randomFontFamily, 36);
	prevButton.setFont(buttonFont);
	pickButton.setFont(buttonFont);
	nextButton.setFont(buttonFont);
	randomFontFamily = fontFamilies.get((int)(Math.random()*fontFamilies.size()));
	studentNameLabel.setFont(new Font(randomFontFamily, 48));
	
	// PUT THE BUTTONS IN A TOOLBAR
	FlowPane buttonToolbar = new FlowPane();
	buttonToolbar.setAlignment(Pos.CENTER);
	buttonToolbar.getChildren().add(prevButton);
	buttonToolbar.getChildren().add(pickButton);
	buttonToolbar.getChildren().add(nextButton);

	// CUSTOMIZE OUR IMAGE VIEW
	currentIndex = pickRandomIndex();
	String startingStudent = students.get(currentIndex);
	Image startingStudentImage = images.get(startingStudent);
	studentNameLabel.setText(startingStudent);
	studentImageView.setImage(startingStudentImage);

	// PUT THEM IN A CONTAINER
	VBox root = new VBox();
	root.setAlignment(Pos.CENTER);
	root.getChildren().add(buttonToolbar);
	root.getChildren().add(studentNameLabel);
	root.getChildren().add(studentImageView);

	// AND PUT THE CONTAINER IN THE WINDOW (i.e. the "stage")
	Scene scene = new Scene(root, 600, 400);
	primaryStage.setScene(scene);

	// PROVIDE A RESPONSE TO BUTTON CLICKS
	EventHandler buttonsHandler = new EventHandler<ActionEvent>() {
	    @Override
	    public void handle(ActionEvent event) {
		Task<Void> task = new Task<Void>() {
		    @Override
		    protected Void call() throws Exception {
			int maxCount = 1; // PREV AND NEXT BUTTONS INC BY 1
			if (event.getSource() == pickButton) 
			    maxCount = 15; // RANDOM BUTTON FLIPS THROUGH 15 STUDENTS
			for (int i = 0; i < maxCount; i++) {
			    if (event.getSource() == prevButton)
			    {
				currentIndex -= 1;
				if (currentIndex < 0)
				    currentIndex = students.size() - 1;
			    }
			    else if (event.getSource() == nextButton)
			    {
				currentIndex += 1;
                                if(currentIndex >= (students.size())){
                                    currentIndex = 0;
                                }
			    }
			    else
			    {
				currentIndex = pickRandomIndex();
			    }

			    // THIS WILL BE DONE ASYNCHRONOUSLY VIA MULTITHREADING
			    Platform.runLater(new Runnable() {
				@Override
				public void run() {
				    String student = students.get(currentIndex);
				    studentNameLabel.setText(student);
				    studentImageView.setImage(images.get(student));
				}
			    });

			    // SLEEP EACH FRAME
			    try {
				Thread.sleep(30);
			    } catch (InterruptedException ie) {
				ie.printStackTrace();
			    }
			}
			return null;
		    }
		};
		// THIS GETS THE THREAD ROLLING
		Thread thread = new Thread(task);
		thread.start();
	    }
	};

	// REGISTER THE LISTENER WITH ALL 3 BUTTONS
	prevButton.setOnAction(buttonsHandler);
	pickButton.setOnAction(buttonsHandler);
	nextButton.setOnAction(buttonsHandler);

	// OPEN THE WINDOW
	primaryStage.show();
    }

    public int pickRandomIndex() {
	// RANDOMLY SELECT A STUDENT
	int randomIndex = (int) (Math.random() * students.size());
	return randomIndex;
    }

    // LOADS A JSON FILE AS A SINGLE OBJECT AND RETURNS IT
    private JsonObject loadJSONFile(String jsonFilePath) throws IOException {
	InputStream is = new FileInputStream(jsonFilePath);
	JsonReader jsonReader = Json.createReader(is);
	JsonObject json = jsonReader.readObject();
	jsonReader.close();
	is.close();
	return json;
    }

    /**
     * This starts our JavaFX application rolling.
     */
    public static void main(String[] args) {
	launch(args);
    }
}
