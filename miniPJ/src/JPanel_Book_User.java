
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;
import util.JdbcUtil;

class JPanel_Book_User extends JPanel implements ActionListener {
	private JLabel welcome;

	private JButton btn_update;
	private JButton btn_rent;
	private JButton btn_return;

	final int SEARCH_OPT_ALL = 0;
	final int SEARCH_OPT_BOOKNAME = 1;
	final int SEARCH_OPT_AUTHOR = 2;
	final int SEARCH_OPT_PUBLISHER = 3;
	private String[] comboName = { "ALL", "도서명", "저자명", "출판사명" };
	private JComboBox comboSearch;
	private JTextField jtfSearch;
	private JButton btnSearch;

	private JTable table;
	private DefaultTableModel model;
	private JScrollPane scroll;

	private DAOBook dao;
	private Object[][] rowData;
	private Object[] columnNames = {"도서번호","도서명","저자명","출판사명"};
	private Object[] columnNames1 = {"ID","도서번호","대여날짜","반납예정일"};
	
	private JFrame_User_RentList frame_user_rentlist;

	public JPanel_Book_User() {
		setLayout(null);		
	}

	public void Init() {
		dao = new DAOBook();
		
		welcome = new JLabel();
		welcome.setText(Login.dtou.getId() + " 님 환영합니다.");
		welcome.setBounds(10, 0, 300, 45);
		add(welcome);

		btn_update = new JButton("회원 정보 수정");
		btn_rent = new JButton("도서대여");
		btn_return = new JButton("도서반납");
		btn_update.setBounds(750, 10, 120, 30);   
		btn_rent.setBounds(750, 80, 110, 45);
		btn_return.setBounds(750, 130, 110, 45);
		btn_update.addActionListener(this);
		btn_rent.addActionListener(this);
		btn_return.addActionListener(this);
		add(btn_update);
		add(btn_rent);
		add(btn_return);

		comboSearch = new JComboBox(comboName);
		comboSearch.setBounds(30, 738, 150, 25);
		add(comboSearch);
		jtfSearch = new JTextField(20);
		jtfSearch.setBounds(180, 738, 450, 25);
		add(jtfSearch);
		btnSearch = new JButton("검색");
		btnSearch.setBounds(630, 738, 100, 25);
		btnSearch.addActionListener(this);
		add(btnSearch);

		model = new DefaultTableModel() {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};
		table = new JTable(model);
		table.setAutoResizeMode(table.AUTO_RESIZE_OFF);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JTableHeader header = table.getTableHeader();
		header.setPreferredSize(new Dimension(0, 50));
		header.setResizingAllowed(false);
		setTableData2();
		scroll = new JScrollPane(table);
		scroll.setBounds(30, 80, 700, 650);
		add(scroll);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == btn_update) {
			String name = Login.dtou.getName();
			String id = Login.dtou.getId();
			String hp = Login.dtou.getHp();
			String addr = Login.dtou.getAddr();
			
			JFrame_Altermem altermem = new JFrame_Altermem(name, id, hp, addr);
			altermem.setVisible(true);
			
			return;
		}
		if (e.getSource() == btn_rent) {
			if(table.getSelectedRow()<0) {
				JOptionPane.showMessageDialog(this,  "대여할 도서를 선택해주세요.");
			}				
			else {
				JFrame_BookRent f = new JFrame_BookRent();
				f.book_num1.setText((rowData[table.getSelectedRow()][0]).toString());
				f.setVisible(true);
			}
			
		}

		if (e.getSource() == btn_return) {
			frame_user_rentlist=new JFrame_User_RentList();

		}

		if (e.getSource() == btnSearch) {
			// JComboBoxに選ばれる
			String fieldName = comboSearch.getSelectedItem().toString();
			if (fieldName.trim().equals("ALL")) {
				setTableData(SEARCH_OPT_ALL);

			} else if (fieldName.trim().equals("도서명")) {
				setTableData(SEARCH_OPT_BOOKNAME);
			} else if (fieldName.trim().equals("저자명")) {
				setTableData(SEARCH_OPT_AUTHOR);
			} else if (fieldName.trim().equals("출판사명")) {
				setTableData(SEARCH_OPT_PUBLISHER);
			}
			return;
		}
	}

	private void setTableData(int flag) {

		List<DTOBook> list = null;

		switch (flag) {
		case SEARCH_OPT_ALL:
			list = dao.getRecordAll();

			break;
		case SEARCH_OPT_BOOKNAME:
			list = dao.getSearchRecord_Name(jtfSearch.getText().trim());

			break;
		case SEARCH_OPT_AUTHOR:
			list = dao.getSearchRecord_Author(jtfSearch.getText().trim());
			break;
		case SEARCH_OPT_PUBLISHER:
			list = dao.getSearchRecord_Publisher(jtfSearch.getText().trim());

			break;
		}

		// System.out.println("setTableData() 결과 갯수 : " + list.size());

		rowData = new Object[list.size()][columnNames.length];

		for (int i = 0; i < list.size(); i++) {
			DTOBook dto = list.get(i);

			rowData[i][0] = dto.getNum();
			rowData[i][1] = dto.getName();
			rowData[i][2] = dto.getWriter();
			rowData[i][3] = dto.getCom();

		}
		model.setDataVector(null, columnNames);
		model.setDataVector(rowData, columnNames);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(70);
		table.getColumnModel().getColumn(1).setPreferredWidth(300);
		table.getColumnModel().getColumn(2).setPreferredWidth(200);
		table.getColumnModel().getColumn(3).setPreferredWidth(112);
	}
	
	public void setTableData3() {

		 List<DTOManagerBook> list = DAOBook.getRecordAll3();
		
		rowData = new Object[list.size()][columnNames1.length];
		
		for(int i=0; i < list.size();i++){			
			DTOManagerBook dto = list.get(i);
			
			rowData[i][0]= dto.getMem_id();
			rowData[i][1]= dto.getMem_num();
			rowData[i][2]= dto.getRent_date();
			rowData[i][3]= dto.getReturn_date();
			
		}
		model.setDataVector(null, columnNames1);
		model.setDataVector(rowData, columnNames1);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(150);
		table.getColumnModel().getColumn(1).setPreferredWidth(70);
		table.getColumnModel().getColumn(2).setPreferredWidth(231);
		table.getColumnModel().getColumn(3).setPreferredWidth(231);
	}
	public void setTableData2() {

		List<DTOBook> list = DAOBook.getRecordAll2();
		
	
		rowData = new Object[list.size()][columnNames.length];
		
		for(int i=0; i < list.size();i++){			
			DTOBook dto = list.get(i);
			
			rowData[i][0]= dto.getNum();
			rowData[i][1]= dto.getName();
			rowData[i][2]= dto.getWriter();
			rowData[i][3]= dto.getCom();	
			
		}
		model.setDataVector(null, columnNames);
		model.setDataVector(rowData, columnNames);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(70);
		table.getColumnModel().getColumn(1).setPreferredWidth(300);
		table.getColumnModel().getColumn(2).setPreferredWidth(200);
		table.getColumnModel().getColumn(3).setPreferredWidth(112);
	}

	public JTable getJTableBookUserList() {
		return table;
	}
	public JFrame_User_RentList getFrame_User_RentList() {
		return frame_user_rentlist;
	
	}
	

}