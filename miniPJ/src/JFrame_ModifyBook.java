import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.JTextField;

class JFrame_ModifyBook extends JFrame implements ActionListener {

	private Container contentPane;
	
	private JLabel jlbName;
	private JLabel jlbWriter;
	private JLabel jlbCom;
	private JTextField jtfNum;
	private JTextField jtfName;
	private JTextField jtfWriter;
	private JTextField jtfCom;
	private JButton btnModify;
	private JButton btnCancel;
	
	public JFrame_ModifyBook() {
		super("도서 정보 수정");
		contentPane = getContentPane();
		setSize(350, 250);
		setLocation(600,300);
		setLayout(null);		
		
		jlbName = new JLabel("도서명");	
		jlbName.setOpaque(true);	
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
		
		jtfNum = new JTextField(20);
		jtfNum.setBounds(0, 0, 250, 25);
		jtfName = new JTextField(20);
		jtfName.setBounds(70, 30, 250, 25);
		contentPane.add(jtfName);
		jtfWriter = new JTextField(20);
		jtfWriter.setBounds(70, 65, 200, 25);
		contentPane.add(jtfWriter);
		jtfCom = new JTextField(20);
		jtfCom.setBounds(70, 100, 200, 25);
		contentPane.add(jtfCom);
		
		btnModify = new JButton("수정");
		btnModify.setBounds(70, 150, 80, 25);		
		btnModify.addActionListener(this);
		contentPane.add(btnModify);
		btnModify.setSelected(true); 
		btnCancel = new JButton("취소");
		btnCancel.setBounds(160, 150, 80, 25);		
		btnCancel.addActionListener(this);
		contentPane.add(btnCancel);
		btnCancel.setSelected(true); 
				
		Init();
	}
	
	public void Init() {
		
		this.setLocation(600,300);
		jtfNum.setText(" ");
		jtfName.setText(" ");
		jtfWriter.setText(" ");
		jtfCom.setText(" ");
	}
	
	public void Init(DTOBook dto) {
		
		this.setLocation(600,300);
		jtfNum.setText(dto.getNum()+"");
		jtfName.setText(dto.getName());
		jtfWriter.setText(dto.getWriter());
		jtfCom.setText(dto.getCom());

	}
	
	@Override
	 public void actionPerformed(ActionEvent e) {

		 if(e.getSource()==btnModify) {
			 String num = jtfNum.getText();
			 String name = jtfName.getText();
			 String writer = jtfWriter.getText();
			 String com = jtfCom.getText();
			 String s = "도서번호 : " + num + "\n도서명 : " + name + "\n저자명 : " + writer + "\n출판사명 : " + com + "\n정말로 수정하시겠습니까?";
			 JOptionPane.showConfirmDialog(this, s, "확인", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
			 
			 JTable table = Login.book_manager.getJPanel_Book().getJTableBookList();
			 int result = DAOBook.update(new DTOBook(Integer.parseInt(num), name, writer, com));
			 
			 if(result > 0) {
				 JOptionPane.showMessageDialog(this,  "도서가 수정되었습니다.");				 
				 Login.book_manager.getJPanel_Book().setTableData(JPanel_Book.SEARCH_OPT_ALL);
				 this.setVisible(false);
			 }
			 else {
				 JOptionPane.showMessageDialog(this,  "에러!!!! 도서 수정 실패");
			 }
			 
			 return; 
		 }
		 
		 if(e.getSource()==btnCancel) {
			this.setVisible(false);
			return; 
		 }
		 
	}
	
	public void Msg_Debug(String s) {
		JOptionPane.showMessageDialog(null,  s);
	}
}
