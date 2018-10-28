import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;


class JPanel_Book extends JPanel implements ActionListener {
	
	private JFrame_AddBook jframe_addbook;
	private JFrame_ModifyBook jframe_modifybook;
	
	private JLabel welcome;
	
	private JButton btnAdd;
	private JButton btnDelete;
	private JButton btnModify;
	private JButton	btnRent;
	private JButton btnReturn;
	
	final static int SEARCH_OPT_ALL        = 0;	
	final static int SEARCH_OPT_BOOKNAME   = 1;
	final static int SEARCH_OPT_AUTHOR     = 2;
	final static int SEARCH_OPT_PUBLISHER = 3;
	final static int SEARCH_OPT_SearchALL = 4;
	
	private String[] comboName = {"ALL","도서명","저자명","출판사명"};
	private JComboBox comboSearch;
	private JTextField jtfSearch;
	private JButton btnSearch;
	
	private JTable table;
	private DefaultTableModel model;
	private JScrollPane scroll;
	
	public int selectedRow = -1;
	public String gostring;
	public int goint;
	public String bun;
	JFrame_BookRent mbr = new JFrame_BookRent();
	JFrame_BookReturn mbre = new JFrame_BookReturn();
	DAOManagerBook dmb;
	DTOBook dto;
	public Object obj;
	
	private DAOBook dao;
	private Object[][] rowData;
	private Object[] columnNames = {"도서번호","도서명","저자명","출판사명"};
	private Object[] columnNames1 = {"ID","도서번호","대여날짜","반납예정일"};
	
	public JPanel_Book() {
		setLayout(null);
		
		jframe_addbook = new JFrame_AddBook();
		jframe_addbook.Init();
		jframe_modifybook = new JFrame_ModifyBook();
		jframe_modifybook.Init();
	}
	
	public void Init() {	
		welcome = new JLabel();
		welcome.setText(Login.dtou.getId() + " 님 환영합니다.");
		welcome.setBounds(10, 0, 300, 45);
		add(welcome);
		
		btnAdd = new JButton("도서추가");
		btnDelete = new JButton("도서삭제");
		btnModify = new JButton("도서수정");	
		btnRent = new JButton("도서대여");
		btnReturn = new JButton("도서반납");
		btnAdd.setBounds(   750,  80, 110, 45);
		btnDelete.setBounds(750, 130, 110, 45);
		btnModify.setBounds(750, 180, 110, 45);
		btnRent.setBounds(750, 230,110,45);
		btnReturn.setBounds(750,230,110,45);
		btnAdd.addActionListener(this);
		btnDelete.addActionListener(this);
		btnModify.addActionListener(this);
		btnRent.addActionListener(this);
		btnReturn.addActionListener(this);
		btnRent.setVisible(false);
		btnReturn.setVisible(false);
		add(btnAdd);
		add(btnDelete);
		add(btnModify);
		add(btnRent);
		add(btnReturn);
		
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
		
		model = new DefaultTableModel(){
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};
		table = new JTable(model);						
		table.setAutoResizeMode(table.AUTO_RESIZE_OFF);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JTableHeader header=table.getTableHeader();		
		header.setPreferredSize(new Dimension(0,50));
		header.setResizingAllowed(false);
		setTableData(SEARCH_OPT_ALL);
		scroll = new JScrollPane(table);
		scroll.setBounds(30, 80, 700, 650);
		add(scroll);
		
		mbr.setVisible(false);
		mbre.setVisible(false);
	}
	
	@Override
	 public void actionPerformed(ActionEvent e) {

		 if(e.getSource()==btnAdd) {
			 jframe_addbook.setVisible(true);
			 jframe_addbook.Init();
			 return;
		 }
		 if(e.getSource()==btnDelete) {
			 int result = JOptionPane.showConfirmDialog(this, "정말로 삭제하시겠습니까?", "확인", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);
			 if(result==JOptionPane.YES_OPTION) {
				 String s = table.getValueAt(table.getSelectedRow(), 0).toString();
				 DAOBook.delete(Integer.parseInt(s));			 
				 setTableData(SEARCH_OPT_ALL);
			 }
			 return;
		 }
		 if(e.getSource()==btnModify) {
			 jframe_modifybook.setVisible(true);
			 DTOBook dto = new DTOBook();
			 dto.setNum(Integer.parseInt(table.getValueAt(table.getSelectedRow(), 0).toString()));
			 dto.setName(table.getValueAt(table.getSelectedRow(), 1).toString());
			 dto.setWriter(table.getValueAt(table.getSelectedRow(), 2).toString());
			 dto.setCom(table.getValueAt(table.getSelectedRow(), 3).toString());
			 jframe_modifybook.Init(dto);
			 return;
		 }
		 if(e.getSource()==btnRent) {
			int i = (table.getSelectedRow());
			if ( i >= 0) {
			mbr.setVisible(true);
			mbr.Init();
			mbr.book_num1.setText((rowData[table.getSelectedRow()][0]).toString());
			} else if (i < 0) {
				mbr.Init();
				mbr.setVisible(true);
			}
		 }
		 if(e.getSource()==btnReturn) {
			 int i = (table.getSelectedRow());
				if ( i >= 0) {
				 mbre.setVisible(true);
				 mbre.Init();
				 mbre.mem_id1.setText((rowData[table.getSelectedRow()][0]).toString());
				 mbre.book_num1.setText((rowData[table.getSelectedRow()][1]).toString());
				 mbre.rent_date1.setText((rowData[table.getSelectedRow()][2]).toString());
				 mbre.return_date1.setText((rowData[table.getSelectedRow()][3]).toString());
				} else {
				mbre.Init();
				mbre.setVisible(true);
				}
		 }
		 if(e.getSource()==btnSearch) {
			 //JOptionPane.showMessageDialog(null,  "검색합니다.");
			 
			 
			
			// JComboBox에 선택된 value 가져오기
			String fieldName = comboSearch.getSelectedItem().toString();
			if(fieldName.trim().equals("ALL")) {
				setTableData(SEARCH_OPT_SearchALL);
			} else if(fieldName.trim().equals("도서명")) {
				setTableData(SEARCH_OPT_BOOKNAME);
			} else if(fieldName.trim().equals("저자명")) {
				setTableData(SEARCH_OPT_AUTHOR);
			} else if(fieldName.trim().equals("출판사명")) {
				setTableData(SEARCH_OPT_PUBLISHER);
			}
			return;
		 }
	 }
	
	public void setTableData(int flag) {

		List<DTOBook> list=null;

		switch(flag) {
			case SEARCH_OPT_ALL:
				list=DAOBook.getRecordAll();
				break;
			case SEARCH_OPT_BOOKNAME:
				list=DAOBook.getSearchRecord_Name(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_AUTHOR:
				list=DAOBook.getSearchRecord_Author(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_PUBLISHER:
				list=DAOBook.getSearchRecord_Publisher(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_SearchALL:
				list=DAOBook.getSearchRecord_All(jtfSearch.getText().trim());
				break;
		} 
		
		//System.out.println("setTableData() 결과 갯수 : " + list.size());
		
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
	public void setTableData1() {

		

		 List<DTOManagerBook> list = DAOBook.getRecordAll1();
		
		
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
		
		//System.out.println("setTableData() 결과 갯수 : " + list.size());
		
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
	
	public JTable getJTableBookList() {
		return table;
	}
	
	public JScrollPane getJScrollPane() {
		return scroll;
	}
}
