import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Date;
import java.util.List;

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

class JPanel_RentReturn extends JPanel implements ActionListener {
	private JFrame_AddBook jframe_addbook;
	private JFrame_ModifyBook jframe_modifybook;
	
	final int BOOK_ALL           = 0;	// 全体目録(ラジオコントロール)
	final int BOOK_ALREADY_RENT  = 1;	// 貸与目録(ラジオコントロール)
	final int BOOK_POSSIBLE_RENT = 2;	//貸与可能リスト (ラジオコントロール)
	final int BOOK_SEARCH        = 3;	// 検索1目録(ラジオコントロール)
	final int BOOK_MAX_RENT      = 4;
	private JRadioButton radio_rent[];
	
	private JLabel welcome;

	private JButton	btnRent;
	private JButton btnReturn;
	
	final static int SEARCH_OPT_ALL        = 0;
	final static int SEARCH_OPT_BOOKNAME   = 1;
	final static int SEARCH_OPT_AUTHOR     = 2;
	final static int SEARCH_OPT_PUBLISHER = 3;
	final static int SEARCH_OPT_MEMID = 4;
	final static int SEARCH_OPT_SearchALL = 5;
	
	private String[] comboName = {"ALL","도서명","저자명","출판사명","회원ID"};
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
	static DAORentReturn drr;
	static DTORentReturn drrt;
	public Object obj;
	DAOManagerBook dmr;
	
	private DAOBook dao;
	private Object[][] rowData;
	private Object[] columnNames = {"도서번호","도서명","저자명","출판사명","회원 ID"};

	
	public JPanel_RentReturn() {
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
		
		
		
		btnRent = new JButton("도서대여");
		btnReturn = new JButton("도서반납");
		
		btnRent.setBounds(750, 80,110,45);
		btnReturn.setBounds(750,130,110,45);
		
		btnRent.addActionListener(this);
		btnReturn.addActionListener(this);
		btnRent.setVisible(true);
		btnReturn.setVisible(true);
		
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
		
		//mbr.setVisible(false);
		//mbre.setVisible(false);
	}
	
	@Override
	 public void actionPerformed(ActionEvent e) {
		
		 if(e.getSource()==btnRent) {
			int i = (table.getSelectedRow());
			String id = (rowData[table.getSelectedRow()][4]).toString();
			
			if ( id.equals(" ")) {
			mbr.setVisible(true);
			mbr.Init();
			mbr.book_num1.setText((rowData[table.getSelectedRow()][0]).toString());
			} else if (!id.equals(" ")) {
				
				JOptionPane.showMessageDialog(null, "이미 대여중인 도서입니다.");
			}
		 }
		 if(e.getSource()==btnReturn) {
			 int i = table.getSelectedRow();
			 String id = rowData[table.getSelectedRow()][4].toString();
			 String num1 = rowData[table.getSelectedRow()][0].toString();
			 int num = Integer.parseInt(num1);
			 if (id.equals(" ") ) {
					JOptionPane.showMessageDialog(null, "대여한 회원이 없습니다.");
				}
				else if ( i >= 0) {
					
						mbre.setVisible(true);
						mbre.Init();
					List<DTOManagerBook> list;
					list = drr.getRentedData(id, num);
					
					 String g1 = DAORentReturn.dto.getMem_id();
					 int g2 = DAORentReturn.dto.getMem_num();
					 Date g3 = DAORentReturn.dto.getRent_date();
					 Date g4 = DAORentReturn.dto.getReturn_date();
					 
					 mbre.mem_id1.setText(g1);
					 mbre.book_num1.setText(g2+"");
					 mbre.rent_date1.setText(g3.toString());
					 mbre.return_date1.setText(g4.toString());
				} else {
					JOptionPane.showMessageDialog(null, "책을 보유중입니다.");
				}
		 }

		 if(e.getSource()==btnSearch) {

			String fieldName = comboSearch.getSelectedItem().toString();
			if(fieldName.trim().equals("ALL")) {
				if(jtfSearch.getText().equals("")) {
					setTableData(SEARCH_OPT_ALL);
				}	else {
				setTableData(SEARCH_OPT_SearchALL);
				}
			} else if(fieldName.trim().equals("도서명")) {
				setTableData(SEARCH_OPT_BOOKNAME);
			} else if(fieldName.trim().equals("저자명")) {
				setTableData(SEARCH_OPT_AUTHOR);
			} else if(fieldName.trim().equals("출판사명")) {
				setTableData(SEARCH_OPT_PUBLISHER);
			} else if(fieldName.trim().equals("회원ID")) {
				setTableData(SEARCH_OPT_MEMID);
			}
			return;
		 }
	 }
	
	public void setTableData(int flag) {

		List<DTORentReturn> list=null;

		switch(flag) {
			case SEARCH_OPT_ALL:
				list=DAORentReturn.getRecordAll4();
				break;
			case SEARCH_OPT_SearchALL:
				list=DAORentReturn.getRecordSearchAll(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_BOOKNAME:
				list=DAORentReturn.getSearchRecord_Name1(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_AUTHOR:
				list=DAORentReturn.getSearchRecord_Author1(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_PUBLISHER:
				list=DAORentReturn.getSearchRecord_Publisher1(jtfSearch.getText().trim());
				break;
			case SEARCH_OPT_MEMID:
				list=DAORentReturn.getSearchRecord_Memid1(jtfSearch.getText().trim());
				break;
				
		} 
		
		//System.out.println("setTableData() 결과 갯수 : " + list.size());
		
		rowData = new Object[list.size()][columnNames.length];
		
		for(int i=0; i < list.size();i++){			
			DTORentReturn dto = list.get(i);
			
			rowData[i][0]= dto.getBook_num();
			rowData[i][1]= dto.getBook_name();
			rowData[i][2]= dto.getBook_writer();
			rowData[i][3]= dto.getBook_com();	
			rowData[i][4]= dto.getMem_id();
			
		}
		model.setDataVector(null, columnNames);
		model.setDataVector(rowData, columnNames);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(60);
		table.getColumnModel().getColumn(1).setPreferredWidth(250);
		table.getColumnModel().getColumn(2).setPreferredWidth(200);
		table.getColumnModel().getColumn(3).setPreferredWidth(112);
		table.getColumnModel().getColumn(4).setPreferredWidth(60);
	}

	
	
	public JTable getJTableBookList() {
		return table;
	}
	
	public JScrollPane getJScrollPane() {
		return scroll;
	}
}