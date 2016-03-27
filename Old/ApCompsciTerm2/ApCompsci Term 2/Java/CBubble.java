import wheels.users.Frame;
import wheels.users.ConversationBubble;
import java.awt.Color;

public class CBubble extends Frame{

    private ConvwersationBubble _bubble;


    public CBubble (){

	_bubble = new ConversationBubble ("Happy Snow Day!!",

					  Conversation.Bubble.TAIL_DIR_LEFT);


    }

    public static void main (String []args) {
	CBubble cbubble = new CBubble();
    }

}