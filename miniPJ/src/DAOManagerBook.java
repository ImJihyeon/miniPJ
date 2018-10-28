import static util.JdbcUtil.getConnection;

import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class DAOManagerBook {
	Connection con;
	PreparedStatement psmt;
	Statement stmt;


	public void ManagerBookRent(String a1, int a2, String a3, String a4) {
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
			Login.book_manager.getJPanel_Book().setTableData2();
			Login.book_manager.getJPanel_RentReturn().setTableData(0);
		} catch (Exception e) {
			e.printStackTrace(); 

			try {
			psmt = conn.prepareStatement("select mem_id from member where mem_id = ?");
			psmt.setString(1, a1);
			ResultSet rs;
			rs = psmt.executeQuery();

			int cnt = 0;
			while (rs.next())
				cnt++;
			if (cnt == 0) {
				JOptionPane.showMessageDialog(null, "존재하지 않는 ID입니다.");
			} else {
			JOptionPane.showMessageDialog(null, "대여중입니다.");
		}
			} catch (Exception ee) { ee.printStackTrace();}
			
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
			Login.book_manager.getJPanel_RentReturn().setTableData(0);
			
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
			//Login.user.getJTableBookUserList().setTableData3();
		} catch (Exception e) { 
			e.printStackTrace(); 
			JOptionPane.showMessageDialog(null, "대여하지 않은 책입니다.");
			}
		
	}
}

