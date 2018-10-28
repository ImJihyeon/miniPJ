import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Manager_BookRent extends JFrame {//implements ActionListener{

	JPanel pan1,pan2,pan3,pan4,pan5,pan6,pan7;
	JLabel book_num,book_writer,book_com, empty1, mem_id,rent_date,return_date;
	JTextField book_num1,book_writer1,book_com1,mem_id1,rent_date1,return_date1;
	JPanel main;
	 JButton btnrent, btnreturn1, btncancel;
	Connection conn; PreparedStatement pstmt;
	ResultSet rs;	
	String sql;
	int result = 0;
	private JPanel_Book jpb;
	String id = Login.dtou.getId();
	
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	Calendar cal = Calendar.getInstance();
	String date = null;
	DAO_ManagerBook dmb = new DAO_ManagerBook();
	DTO_ManagerBook dto;
	
	public Manager_BookRent() {
		
		
		main = new JPanel();
		pan1 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan2 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan3 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan4 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan5 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan6 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		pan7 = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		
		mem_id = new JLabel("회원 ID :     "); mem_id1 = new JTextField("",20);
		
		book_num = new JLabel("도서번호 : "); book_num1 = new JTextField("",20);
		
		
		rent_date = new JLabel("대여날짜 : "); rent_date1 = new JTextField("",20);
		rent_date1.setText(dateFormat.format(cal.getTime()));
		
		return_date = new JLabel("반납날짜 : "); return_date1 = new JTextField("",20);
		cal.add(Calendar.DATE, 7);
		date = dateFormat.format(cal.getTime());
		return_date1.setText(date);
		
		btnrent = new JButton("대여");  btncancel = new JButton("취소");
		
		btnrent.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				String a1 = mem_id1.getText();
				Integer a2= Integer.parseInt(book_num1.getText());
				String a3 = rent_date1.getText();
				String a4 = return_date1.getText();
				
				
				if ( a1.length() == 0) {
					JOptionPane.showMessageDialog(null, "ID를 입력하세요.");
					return;
				} 				
				else {
					if ( id.equals("admin") ) {
						
						dmb.Manager_BookRent(a1, a2, a3, a4);
						dispose();
					} else {
						System.out.println(id);
						dmb.Manager_BookRentUser(a1, a2, a3, a4);
						dispose();
					}
				}
			}
		});
		btncancel.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				dispose();
				String name = mem_id1.getText().trim();
				String id = book_num1.getText().trim();
				String pass = rent_date1.getText().trim();
				String pass2 = return_date1.getText().trim();
				if (id.length() > 0) {
					mem_id1.setText(null);
					dispose();
				}else {
					dispose();
				}
			}
		});
		
		pan1.add(mem_id);
		pan1.add(mem_id1,"Right");
		
		pan2.add(book_num);	
		pan2.add(book_num1,"Right");
		
		pan5.add(rent_date);
		pan5.add(rent_date1,"Right");
		
		rent_date1.setEnabled(false);
		
		
		pan6.add(return_date);
		pan6.add(return_date1,"Right");
		return_date1.setEnabled(false);
		
		
		pan7.add(btnrent);	
		pan7.add(btncancel);
		
		
		main.add(pan1);
		main.add(pan2);
		main.add(pan5);
		main.add(pan6);
		main.add(pan7);
		
		
		add(main);
		
		
		setResizable(false);
		
		setBounds(500,250,350,240);
		setVisible(true);
		
		
	}
	void Init() {
		mem_id1.setText("");
		book_num1.setText("");
	}
}
	

