import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.swing.JOptionPane;

public class DAOBook {

	// 入力処理

	public static int insert(DTOBook dto) {
		Connection con = null;
		PreparedStatement psmt = null;
		int affectedRow = 0;

		try {
			con = getConnection();

			String sql = "insert into Book values(book_num_seq.nextval, ?, ?, ?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getWriter());
			psmt.setString(3, dto.getCom());
			affectedRow = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("class DAOBook.insert()_입력시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return affectedRow;
	}

	//全レコード返還処理
	public static List<DTOBook> getRecordAll() {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOBook> list = null;

		try {			
			list = new Vector<DTOBook>();
			con = getConnection();

			String sql = "SELECT * FROM book ORDER BY book_num";
			psmt = con.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll()_전체 레코드 반환시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return list;
	}
	public static List<DTOManagerBook> getRecordAll1() {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOManagerBook> list = null;

		try {			
			list = new Vector<DTOManagerBook>();
			con = getConnection();

			String sql = "SELECT * FROM rent ORDER BY book_num";
			psmt = con.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOManagerBook dto = new DTOManagerBook(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll1()_전체 레코드 반환시 오류:" + e.getMessage());
			
		} finally {
			close(psmt);
		}
		return list;
	}
	public static List<DTOBook> getRecordAll2() {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOBook> list = null;
		try {			
			list = new Vector<DTOBook>();
			con = getConnection();

			String sql = "SELECT * FROM book where book_num not in (select book_num from rent) ORDER BY book_num";
			psmt = con.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll()_전체 레코드 반환시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return list;
	}
	public static List<DTOManagerBook> getRecordAll3() {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOManagerBook> list = null;

		try {			
			list = new Vector<DTOManagerBook>();
			con = getConnection();

			String sql = "select r.mem_id, r.book_num, r.rent_date, r.return_date from rent r, book b where r.book_num=b.book_num and r.mem_id = ? ORDER BY r.book_num";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1,Login.dtou.getId());
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOManagerBook dto = new DTOManagerBook(rs.getString(1), rs.getInt(2), rs.getDate(3), rs.getDate(4));
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("class DAOBook.getRecordAll()_전체 레코드 반환시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return list;
	}

	public static int update(DTOBook dto) {
		Connection con = null;
		PreparedStatement psmt = null;
		int affectedRow = 0;

		try {
			con = getConnection();

			String sql = "UPDATE book SET book_name=?, book_writer=?, book_com=? WHERE book_num=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getWriter());
			psmt.setString(3, dto.getCom());
			psmt.setInt(4, dto.getNum());
			affectedRow = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("class DAOBook.update()_수정시 오류:" + e.getMessage());
		} finally {
			close(psmt);
		}
		return affectedRow;
	}

	// 削除処理s
	public static int delete(int num) {
		Connection con = null;
		PreparedStatement psmt = null;
		int affectedRow = 0;

		try {
			con = getConnection();

			String sql = "DELETE from book WHERE book_num=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			affectedRow = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("삭제시 오류:" + e.getMessage());
			JOptionPane.showMessageDialog(null, "대여중입니다.");
		} finally {
			close(psmt);
		}
		return affectedRow;
	}
	
	public static List<DTOBook> getSearchRecord_All(String search) {
		Connection con = null;
		List<DTOBook> list = null;
		
		try {
			PreparedStatement psmt = null;
			ResultSet rs = null;
			list = new Vector<DTOBook>();
			con = getConnection();
			
			String sql = "SELECT * FROM book "
					+ " WHERE book_name LIKE ? or Book_Writer LIKE ? or Book_Com LIKE ? "
					+ " ORDER BY Book_Num";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, "%"+search+"%");
			psmt.setString(2, "%"+search+"%");
			psmt.setString(3, "%"+search+"%");
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
						
			close(psmt);
			close(rs);
		} catch (Exception e) {
			System.out.println("전체 레코드 반환시 오류:" + e.getMessage());
		}
		return list;
	}

	public static List<DTOBook> getSearchRecord_Num(int num) {
		Connection con = null;
		PreparedStatement psmt = null;
		List<DTOBook> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTOBook>();
			
			String sql = "SELECT * FROM book WHERE ";
			String whereSql = "book_num=?";
			String orderSql = " ORDER BY book_num";
			psmt = con.prepareStatement(sql + whereSql + orderSql);
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		}
		
		return list;
	}

	public static List<DTOBook> getSearchRecord_Name(String name) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOBook> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTOBook>();
			
			String sql = "SELECT * FROM book WHERE"
						+ " book_name like ?"
						+ " ORDER BY book_num";
						
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+name+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}

	public static List<DTOBook> getSearchRecord_Author(String writer) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOBook> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTOBook>();
			
			String sql = "SELECT * FROM book WHERE"
						+ " book_writer like ?"
						+ " ORDER BY book_num";
						
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+writer+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}


	public static List<DTOBook> getSearchRecord_Publisher(String com) {
		Connection con = null;
		PreparedStatement psmt = null;
		
		ResultSet rs = null;
		List<DTOBook> list = null;
		
		try {
			con = getConnection();
			list = new Vector<DTOBook>();
			
			String sql = "SELECT * FROM book WHERE"
						+ " book_com like ?"
						+ " ORDER BY book_num";
						
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+com+"%");
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOBook dto = new DTOBook(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		} finally {
			close(rs); close(psmt);
		}
		
		return list;
	}
}