import java.awt.Container;

import javax.swing.JFrame;
import javax.swing.JTabbedPane;

public class Manager extends JFrame {
	
	boolean isInit;
	private Container contentPane;	
	private JTabbedPane jtab;
	private JPanel_Book jpanel_book;
	private JPanel_Member jpanel_member;
	private JPanel_RentReturn jpanel_rentreturn;
	private JPanel_Book_User jpanel_book_user;
	
	
	public Manager() {
		super("도서 관리 프로그램");
		contentPane = getContentPane();		
		setSize(900, 850);
		setLocation(400,200);
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		isInit = false;
		jpanel_book = null;
		jpanel_rentreturn = null;
		jpanel_member = null;
		Init();
	}
	
	public void Init() {
		
		if(isInit) return;
		
		jtab = new JTabbedPane();
		contentPane.add(jtab);
		
		jpanel_book = new JPanel_Book();
		jpanel_book.Init();
		jpanel_rentreturn = new JPanel_RentReturn();
		jpanel_rentreturn.Init();
		jpanel_member = new JPanel_Member();
		jpanel_member.Init();
		
		jtab.addTab("도서관리", jpanel_book);
		jtab.addTab("대여반납", jpanel_rentreturn);
		jtab.addTab("회원관리", jpanel_member);	
		
			
		
		isInit = true;
	}
	
	public JPanel_Book getJPanel_Book() {
		return jpanel_book;
	}
	public JPanel_RentReturn getJPanel_RentReturn() {
		return jpanel_rentreturn;
	}
	
	public JPanel_Member getJPanel_Member() {
		return jpanel_member;
	}
	public JPanel_Book_User getFrame_User_RentList() {
		return jpanel_book_user;
	}

}
