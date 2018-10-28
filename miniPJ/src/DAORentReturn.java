import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class DAORentReturn {
	static DTOManagerBook dto;
	static PreparedStatement pstmt;
	static ResultSet rst;
	
	public static List<DTORentReturn> getRecordAll4() {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;

		try {			
			list = new Vector<DTORentReturn>();
			con = getConnection();

			String sql = " select b.book_num, b.book_name, b.book_writer, b.book_com, NVL(r.mem_id, ' ') FROM book b left join rent r "
					+ "ON b.book_num=r.book_num ORDER BY b.book_num";
			psmt = con.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll4()_전체 레코드 반환시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return list;
	}
	
	public static List<DTORentReturn> getRecordSearchAll(String str) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;

		try {			
			list = new Vector<DTORentReturn>();
			con = getConnection();

			String sql = " select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r "
					+ " ON b.book_num=r.book_num "
					+ " WHERE b.book_name LIKE ? or b.book_writer LIKE ? or b.book_com LIKE ? or r.mem_id LIKE ? "
					+ " ORDER BY b.book_num";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, "%"+str+"%");
			psmt.setString(2, "%"+str+"%");
			psmt.setString(3, "%"+str+"%");
			psmt.setString(4, "%"+str+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll4()_전체 레코드 반환시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return list;
	}
	
	public static List<DTORentReturn> getSearchRecord_Num(int num) {
		Connection con = null;
		PreparedStatement psmt = null;
		List<DTORentReturn> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTORentReturn>();
			
			String sql = "select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r ON b.book_num=r.book_num WHERE ";  
			String whereSql = "b.book_num=?";
			String orderSql = " ORDER BY b.book_num";
			psmt = con.prepareStatement(sql + whereSql + orderSql);
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		}
		
		return list;
	}
	
	public static List<DTORentReturn> getSearchRecord_Name1(String name) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTORentReturn>();
			
			String sql =  "select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r "
					+ "ON b.book_num=r.book_num where book_name like ? order by b.book_num";
			
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+name+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}
	
	public static List<DTORentReturn> getSearchRecord_Author1(String writer) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTORentReturn>();
			
			String sql = "select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r "
						+ "ON b.book_num=r.book_num WHERE"
						+ " book_writer like ? ORDER BY b.book_num";
						
						
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+writer+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}
	
	public static List<DTORentReturn> getSearchRecord_Publisher1(String com) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTORentReturn>();
			
			String sql = "select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r "
						+ "ON b.book_num=r.book_num WHERE"
						+ " book_com like ? ORDER BY b.book_num";
	
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+com+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}
	
	public static List<DTORentReturn> getSearchRecord_Memid1(String com) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		
		ResultSet rs = null;
		List<DTORentReturn> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTORentReturn>();
			
			String sql = "select b.book_num, b.book_name, b.book_writer, b.book_com, r.mem_id from book b left join rent r "
						+ "ON b.book_num=r.book_num WHERE"
						+ " mem_id like ? ORDER BY b.book_num";
	
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+com+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTORentReturn dto = new DTORentReturn(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}
	
	public static List<DTOManagerBook> getRentedData(String id, int num) {
		Connection conn = null;
		
		List<DTOManagerBook> list = null;
		
		String sql = "select * from rent where mem_id = ? and book_num = ?";
				
		try {
			conn = getConnection();
			list = new Vector<DTOManagerBook>();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, num);
			rst = pstmt.executeQuery();
			
			while (rst.next()) {
				dto = new DTOManagerBook(rst.getString(1), rst.getInt(2), rst.getDate(3), rst.getDate(4));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rst); close(pstmt);
		}
		return list;
		
	}
}
	
	
	

