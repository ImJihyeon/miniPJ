import static util.JdbcUtil.getConnection;

import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class DAO_ManagerBook {
	Connection con;
	PreparedStatement psmt;
	Statement stmt;

	public void Manager_BookRent(String a1, int a2, String a3, String a4) {
		Connection conn = null;
		String sql = "INSERT INTO rent(mem_id, book_num, rent_date, return_date) values(?, ?, ?, ?)";

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);			
			psmt.setString(1, a1);
			psmt.setInt(2, a2);
			psmt.setString(3, a3);
			psmt.setString(4, a4);
			int t = psmt.executeUpdate();			
			JOptionPane.showMessageDialog(null, "대여완료");
//			Login.user.getJTableBookUserList().setTableData2() ;
			Login.book_manager.getJPanel_Book().setTableData2();
			
		} catch (Exception e) {
			e.printStackTrace(); 
			JOptionPane.showMessageDialog(null, "대여중입니다.");

			}
		
	}
	public void Manager_BookRentUser(String a1, int a2, String a3, String a4) {
		Connection conn = null;
		String sql = "INSERT INTO rent(mem_id, book_num, rent_date, return_date) values(?, ?, ?, ?)";

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);			
			psmt.setString(1, a1);
			psmt.setInt(2, a2);
			psmt.setString(3, a3);
			psmt.setString(4, a4);
			int t = psmt.executeUpdate();			
			JOptionPane.showMessageDialog(null, "대여완료");
			Login.user.getJTableBookUserList().setTableData2() ;
		} catch (Exception e) { 
			e.printStackTrace(); 
			JOptionPane.showMessageDialog(null, "대여중입니다.");
			}
		
	}
	
	public void Manager_BookReturn(int a) {
		Connection conn = null;
		String sql = "DELETE FROM rent where book_num = ?";

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, a);
			
			int t = psmt.executeUpdate();			
			JOptionPane.showMessageDialog(null, "반납완료");
			Login.book_manager.getJPanel_Book().setTableData1();
		} catch (Exception e) { 
			e.printStackTrace();
			JOptionPane.showMessageDialog(null, "대여하지 않은 책입니다.");
			}
		
	}
	public void Manager_BookReturnUser(int a) {
		Connection conn = null;
		String sql = "DELETE FROM rent where book_num = ?";

		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, a);
			
			int t = psmt.executeUpdate();			
			JOptionPane.showMessageDialog(null, "반납완료");
			Login.user.getJTableBookUserList().setTableData3();
		} catch (Exception e) { 
			e.printStackTrace(); 
			JOptionPane.showMessageDialog(null, "대여하지 않은 책입니다.");
			}
		
	}
}

