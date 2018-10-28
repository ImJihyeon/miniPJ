import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.beans.EventHandler;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextField;

public class JFrame_AddBook extends JFrame implements ActionListener {
	private Container contentPane;
	
	private JLabel jlbName;
	private JLabel jlbWriter;
	private JLabel jlbCom;
	private JTextField jtfName;
	private JTextField jtfWriter;
	private JTextField jtfCom;
	private JButton btnAdd;
	private JButton btnCancel;
	
	public JFrame_AddBook() {
		super("도서 추가");
		contentPane = getContentPane();
		setSize(350, 250);
		setLocation(600,300);
		setLayout(null);		
		
		jlbName = new JLabel("도서명");	// ラベルテキスト設定
		jlbName.setOpaque(true);	//不透明度をtrueに設定し,背景色を示す。 
		jlbName.setBounds(10, 30, 250, 25);
		contentPane.add(jlbName);
		
		jlbWriter = new JLabel("저자명");
		jlbWriter.setOpaque(true);	
		jlbWriter.setBounds(10, 65, 250, 25);
		contentPane.add(jlbWriter);
		
		jlbCom = new JLabel("출판사명");	
		jlbCom.setOpaque(true);
		jlbCom.setBounds(10, 100, 250, 25);
		contentPane.add(jlbCom);
		
		jtfName = new JTextField(20);
		jtfName.setBounds(70, 30, 250, 25);
		contentPane.add(jtfName);
		jtfWriter = new JTextField(20);
		jtfWriter.setBounds(70, 65, 200, 25);
		contentPane.add(jtfWriter);
		jtfCom = new JTextField(20);
		jtfCom.setBounds(70, 100, 200, 25);
		contentPane.add(jtfCom);
		
		btnAdd = new JButton("추가");
		btnAdd.setBounds(70, 150, 80, 25);		
		btnAdd.addActionListener(this);
		contentPane.add(btnAdd);
		btnAdd.setSelected(true); 
		
		btnCancel = new JButton("취소");
		btnCancel.setBounds(160, 150, 80, 25);		
		btnCancel.addActionListener(this);
		contentPane.add(btnCancel);
		btnCancel.setSelected(true); 
		
		Init();
	}
	
	public void Init() {
		
		this.setLocation(600,300);
		jtfName.setText("");
		jtfWriter.setText("");
		jtfCom.setText("");
		
	}
	
	@Override
	 public void actionPerformed(ActionEvent e) {

		 if(e.getSource()==btnAdd) {
			 
			 String name = jtfName.getText();
			 String writer = jtfWriter.getText();
			 String com = jtfCom.getText();
			 
			 /*
			  *     図書名,著者名,出版社名が入力されなかった場合 
			  * */
			 if(name.equals(""))   { 
				 JOptionPane.showMessageDialog(this,  "도서명을 입력해 주세요.");
				 return;
			 }
			 if(writer.equals("")) {
				 JOptionPane.showMessageDialog(this,  "저자명을 입력해 주세요.");
				 return;
			 }
			 if(com.equals(""))    {
				 JOptionPane.showMessageDialog(this,  "출판사명을 입력해 주세요.");
				 return;
			 }
			 
			 
			 /*
			  *    DBにデータ追加
			  * */
			 int result = DAOBook.insert(new DTOBook(0, name, writer, com));
			 
			 if(result > 0) {
				 JOptionPane.showMessageDialog(this,  "도서가 추가되었습니다.");
				 
				 JPanel_Book panel = Login.book_manager.getJPanel_Book();
				 JScrollPane scroll = panel.getJScrollPane();
				 panel.setTableData(JPanel_Book.SEARCH_OPT_ALL);
				 System.out.println(scroll.getVerticalScrollBar().getMaximum());
				 scroll.getVerticalScrollBar().setValue( scroll.getVerticalScrollBar().getMaximum() );
				 
				 this.setVisible(false);
			 }
			 else {
				 JOptionPane.showMessageDialog(this,  "에러!!!! 도서 추가 실패");
			 }
		 }
		 
		 if(e.getSource()==btnCancel) {
			this.setVisible(false); 
		 }
		 
	}
	
	// デバッグ用のメッセージボックスです。 ディバーグする時だけ使わなければなりません。
	public void Msg_Debug(String s) {
		JOptionPane.showMessageDialog(null,  s);
	}

}
