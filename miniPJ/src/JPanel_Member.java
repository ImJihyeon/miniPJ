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

class JPanel_Member extends JPanel implements ActionListener {
	JFrame_ManNewmem newmem;
	DAOMember dao;
	JLabel jlbl_welcome;

	final int SEARCH_OPT_ALL = 0;
	final int SEARCH_OPT_NAME = 1;
	final int SEARCH_OPT_ID = 2;
	final int SEARCH_OPT_SearchALL = 3;
	private String[] comboName = { "ALL", "이름", "아이디" };
	private JComboBox comboSearch;
	private JTextField jtfSearch;
	private JButton btnSearch;
	private JLabel welcome;

	private JScrollPane scroll;

	private JButton btnAdd;
	private JButton btnDelete;
	private JButton btnModify;

	private JTable table;
	private DefaultTableModel model;

	int selectedRow = -1;

	Object[][] rowData;
	Object[] columnNames = { "회원번호", "이름", "ID", "전화번호", "주소" };

	public JPanel_Member() {
		setLayout(null);
	}

	public void Init() {
		dao = new DAOMember();

		welcome = new JLabel();
		welcome.setText(Login.dtou.getId() + " 님 환영합니다.");
		welcome.setBounds(10, 0, 300, 45);
		add(welcome);

		btnAdd = new JButton("회원추가");
		btnDelete = new JButton("회원삭제");
		btnModify = new JButton("회원수정");

		btnAdd.setBounds(750, 50, 100, 50);
		btnDelete.setBounds(750, 105, 100, 50);
		btnModify.setBounds(750, 160, 100, 50);

		add(btnAdd);
		add(btnDelete);
		add(btnModify);

		comboSearch = new JComboBox(comboName);
		comboSearch.setBounds(30, 700, 100, 25);
		add(comboSearch);
		jtfSearch = new JTextField(20);
		jtfSearch.setBounds(130, 700, 400, 25);
		add(jtfSearch);
		btnSearch = new JButton("검색");
		btnSearch.setBounds(530, 700, 80, 25);
		add(btnSearch);

		eventUp();

		model = new DefaultTableModel();
		table = new JTable(model) {
			@Override
			public boolean isCellEditable(int row, int column) {
				return false;
			}
		};
		table.setAutoResizeMode(table.AUTO_RESIZE_OFF);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		JTableHeader header = table.getTableHeader();
		header.setPreferredSize(new Dimension(0, 50));
		header.setResizingAllowed(false);
		setTableData(0);
		scroll = new JScrollPane(table);
		scroll.setBounds(30, 50, 583, 650);
		add(scroll);

	}

	public void eventUp() {
		btnAdd.addActionListener(this);
		btnDelete.addActionListener(this);
		btnModify.addActionListener(this);
		btnSearch.addActionListener(this);
	}

	@Override

	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == btnAdd) {
			newmem = new JFrame_ManNewmem();
			newmem.setVisible(true);
		}
		if (e.getSource() == btnDelete) {

			int row = table.getSelectedRow();
			if (row < 0) {
				JOptionPane.showMessageDialog(this, "삭제할 데이터를 선택하세요.");
				return;
			} else {

				int result = JOptionPane.showConfirmDialog(this, rowData[table.getSelectedRow()][2] + " 회원을 삭제하겠습니까?",
						"확인", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE);

				if (result == JOptionPane.YES_OPTION) {
					String str = (String) rowData[table.getSelectedRow()][2];

					int a = dao.delete(str);

					setTableData(SEARCH_OPT_ALL);
				}
			}
		}
		if (e.getSource() == btnModify) {
			int row = table.getSelectedRow();
			if (row < 0) {
				JOptionPane.showMessageDialog(this, "수정할 데이터를 선택하세요.");
				return;
			} else {
				String name = rowData[table.getSelectedRow()][1].toString();
				String id = rowData[table.getSelectedRow()][2].toString();
				String hp = rowData[table.getSelectedRow()][3].toString();
				String addr = rowData[table.getSelectedRow()][4].toString();

				JFrame_ManAlterMem altermem = new JFrame_ManAlterMem(name, id, hp, addr);
				altermem.setVisible(true);

			}
		}
		if (e.getSource() == btnSearch) {
			String fieldName = comboSearch.getSelectedItem().toString();
			if (fieldName.trim().equals("ALL")) {
				if(jtfSearch.getText().equals("")) {
					setTableData(SEARCH_OPT_ALL);
				}else {
				setTableData(SEARCH_OPT_SearchALL);
				}
			} else if (fieldName.trim().equals("이름")) {
				setTableData(SEARCH_OPT_NAME);
			} else if (fieldName.trim().equals("아이디")) {
				setTableData(SEARCH_OPT_ID);
			} 
			return;
		}
	}

	public void setTableData(int flag) {
		List<DTOMember> list = null;

		switch (flag) {
		case SEARCH_OPT_ALL:
			list = dao.getRecordAll();
			break;
		case SEARCH_OPT_NAME:
			list = dao.getSearchRecord_Name(jtfSearch.getText().trim());
			break;
		case SEARCH_OPT_ID:
			list = dao.getSearchRecord_ID(jtfSearch.getText().trim());
			break;
		case SEARCH_OPT_SearchALL:
			list = dao.getSearchRecord_All(jtfSearch.getText().trim());
			break;
		}


		rowData = new Object[list.size()][columnNames.length];

		for (int i = 0; i < list.size(); i++) {
			DTOMember dto = list.get(i);

			rowData[i][0] = dto.getNum();
			rowData[i][1] = dto.getName();
			rowData[i][2] = dto.getId();
			rowData[i][3] = dto.getHp();
			rowData[i][4] = dto.getAddr();

		}
		model.setDataVector(rowData, columnNames);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(80);
		table.getColumnModel().getColumn(1).setPreferredWidth(80);
		table.getColumnModel().getColumn(2).setPreferredWidth(80);
		table.getColumnModel().getColumn(3).setPreferredWidth(90);
		table.getColumnModel().getColumn(4).setPreferredWidth(250);
	}

}