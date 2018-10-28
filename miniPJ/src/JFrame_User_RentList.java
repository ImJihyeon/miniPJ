import java.awt.Container;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.JTableHeader;

public class JFrame_User_RentList extends JFrame implements ActionListener {
	private Container contentPane;

	private JTable table;
	private DefaultTableModel model;
	private JScrollPane scroll, cancel;

	private JButton btnCancel, btnReturn;

	private Object[][] rowData;
	private Object[] columnNames1 = { "ID", "도서번호", "대여날짜", "반납예정일" };

	public JFrame_User_RentList() {
		super("");
		contentPane = getContentPane();

		setSize(780, 830);
		setLocation(400, 180);
		setLayout(null);
		setVisible(true);

		btnCancel = new JButton("취소");
		btnCancel.setBounds(400, 738, 100, 35);
		btnCancel.addActionListener(this);
		contentPane.add(btnCancel);
		add(btnCancel);

		btnReturn = new JButton("도서반납");
		btnReturn.setBounds(250, 738, 100, 35);
		btnReturn.addActionListener(this);
		contentPane.add(btnReturn);
		add(btnReturn);

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
		setTableData();
		scroll = new JScrollPane(table);
		scroll.setBounds(30, 80, 700, 650);
		add(scroll);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnReturn) {
			JFrame_BookReturn frm = new JFrame_BookReturn();
			JTable table = Login.user.getJTableBookUserList().getFrame_User_RentList().getJTableBookList();
			int sel = table.getSelectedRow();
			
			frm.mem_id1.setText(table.getValueAt(sel, 0).toString());
			frm.book_num1.setText(table.getValueAt(sel, 1).toString());
			frm.rent_date1.setText(table.getValueAt(sel, 2).toString());
			frm.return_date1.setText(table.getValueAt(sel, 3).toString());

			frm.setVisible(true);
		}

		if (e.getSource() == btnCancel) {
			System.out.println("cancel");
			dispose();
		}

	}

	public void setTableData() {

		List<DTOManagerBook> list = DAOBook.getRecordAll3();

		rowData = new Object[list.size()][columnNames1.length];

		for (int i = 0; i < list.size(); i++) {
			DTOManagerBook dto = list.get(i);

			rowData[i][0] = dto.getMem_id();
			rowData[i][1] = dto.getMem_num();
			rowData[i][2] = dto.getRent_date();
			rowData[i][3] = dto.getReturn_date();

		}
		model.setDataVector(null, columnNames1);
		model.setDataVector(rowData, columnNames1);
		table.setModel(model);
		table.getColumnModel().getColumn(0).setPreferredWidth(150);
		table.getColumnModel().getColumn(1).setPreferredWidth(70);
		table.getColumnModel().getColumn(2).setPreferredWidth(231);
		table.getColumnModel().getColumn(3).setPreferredWidth(231);
	}
	
	public JTable getJTableBookList() {
		return table;
	}
}
