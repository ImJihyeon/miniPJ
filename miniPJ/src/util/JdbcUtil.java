package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtil {
	private static boolean isConn = false;
	
	static {
		try { Class.forName("oracle.jdbc.driver.OracleDriver"); }
		catch (ClassNotFoundException cne) { cne.printStackTrace(); }
	}
	public static Connection getConnection() {		
		Connection con = null;
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			con = DriverManager.getConnection(url, "wolf", "1234");
			//con.setAutoCommit(false);
		}
		catch(SQLException se) { se.printStackTrace(); }
		finally {
			if(!isConn) {
				System.out.println("DB연결 성공");
				isConn = true;
			}
		}
		return con;
	}
	public static void close(Connection con) {
		try { con.close(); }
		catch(Exception e) { e.printStackTrace(); }		
	}
	public static void close(PreparedStatement psmt) {
		try { psmt.close(); }
		catch(Exception e) { e.printStackTrace(); }
	}
	public static void close(Statement stmt) {
		try { stmt.close(); }
		catch(Exception e) { e.printStackTrace(); }
	}
	public static void close(ResultSet rs) {
		try { rs.close(); }
		catch(Exception e) { e.printStackTrace(); }
	}
}
