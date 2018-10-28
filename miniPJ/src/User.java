import java.awt.Container;

import javax.swing.JFrame;
import javax.swing.JTabbedPane;

public class User extends JFrame {
	
	boolean isInit;
	private Container contentPane;
	private JTabbedPane jtab;
	private JPanel_Book_User jpanel_book_user;
	
	
	public User() {
		super("도서 대여,반납");
		contentPane = getContentPane();		
		setSize(900, 850);
		setLocation(400,200);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		isInit = false;
		jpanel_book_user = null;
		Init();
	}
	
	public void Init() {
		
		if(isInit) return;
		
		jpanel_book_user = new JPanel_Book_User();
		jpanel_book_user.Init();
		
		add(jpanel_book_user);
		
		
		isInit = true;
	}
	
	public JPanel_Book_User getJTableBookUserList() {
		return jpanel_book_user;
	}

}
