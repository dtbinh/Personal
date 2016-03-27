import wheels.users.Ellipse;
import wheels.users.Frame;
import wheels.users.ConversationBubble;
import java.awt.Color;

public class Alien extends Frame{

    private Ellipse _head;
    private Ellipse _eye1;
    private Ellipse _eye2;

    public Alien() {
	_head = new Ellipse (Color.BLUE);
	_head.setSize (100, 100);
	_eye1 = new Ellipse (Color.YELLOW);
	_eye1.setSize (25, 25);
	_eye2 = new Ellipse (Color.YELLOW);
        _eye2.setSize (25, 25);

	int x1 = _head.getXLocation() + ( _head.getWidth() / 4);
	int y1 = _head.getYLocation() - ( _head.getHeight() * 5 / 4);
	int x2 = _head.getXLocation() + ( _head.getWidth() * 3 / 4);
	int y2 = _head.getYLocation() - (_head.getHeight() * 5 / 4);

	_eye1.setLocation (x1, y1);
	_eye2.setLocation (x2, y2);

    }

    public static void  main (String [] args){
	Alien bob = new Alien();
    
    }


}
