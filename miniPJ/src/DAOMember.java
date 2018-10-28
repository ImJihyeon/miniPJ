import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.swing.JOptionPane;

import static util.JdbcUtil.*;

public class DAOMember {
	Connection con = getConnection();
	PreparedStatement psmt;
	ResultSet rs;


	// 入力処理

	public int insert(String name, String id, String pass, String hp, String addr) {
		int affectedRow = 0;
		DTOMember dto = new DTOMember(0, name, id, pass, hp, addr);
		
		String sql = "INSERT INTO member (mem_num,mem_name,mem_id,mem_pw,mem_hp,mem_addr) VALUES(mem_num_seq.nextval,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPw());
			psmt.setString(4, dto.getHp());
			psmt.setString(5, dto.getAddr());

			affectedRow = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("입력시 오류:" + e.getMessage());
		}
		close(psmt);
		
		return affectedRow;
	}

	// 全レコード返還処理
	public List<DTOMember> getRecordAll() {
		List<DTOMember> list = null;
		Connection con = null;
		
		try {
			con = getConnection();
			PreparedStatement psmt = null;
			ResultSet rs = null;
			list = new Vector<DTOMember>();
			
			String sql = "SELECT * FROM member "
					+ " ORDER BY mem_num";
			psmt = con.prepareStatement(sql); 
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				DTOMember dto = new DTOMember(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
				list.add(dto);
			}
						
			close(psmt);
			close(rs);
		} catch (Exception e) {
			System.out.println("전체 레코드 반환시 오류:" + e.getMessage());
		}
		return list;
	}

	public int update(String name, String id, String pass, String hp, String addr) {
		int affectedRow = 0;

		String sql = "UPDATE member SET mem_name=?, mem_pw = ?, mem_hp = ?, mem_addr = ?" 
				+ " WHERE mem_id=?";
		DTOMember dto = new DTOMember(0, name, id, pass, hp, addr);
		try {
			psmt = con.prepareStatement(sql);

			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getHp());
			psmt.setString(4, dto.getAddr());
			psmt.setString(5, dto.getId());
			
			affectedRow = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("수정시 오류:" + e.getMessage());
		}
		return affectedRow;
	}

	// 삭제처리
	public int delete(String id) {
		int affectedRow = 0;
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement("DELETE from member WHERE mem_id=?");
			ps.setString(1, id);
			affectedRow = ps.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("삭제시 오류:" + e.getMessage());
		}
		return affectedRow;
	}
	public List<DTOMember> getSearchRecord_All(String search) {
		List<DTOMember> list = null;
		
		try {
			PreparedStatement psmt = null;
			ResultSet rs = null;
			list = new Vector<DTOMember>();
			
			String sql = "SELECT * FROM member "
					+ " WHERE mem_name LIKE ? or mem_id LIKE ? or mem_hp LIKE ? or mem_addr LIKE ? "
					+ " ORDER BY mem_num";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, "%"+search+"%");
			psmt.setString(2, "%"+search+"%");
			psmt.setString(3, "%"+search+"%");
			psmt.setString(4, "%"+search+"%");
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				DTOMember dto = new DTOMember(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));
				list.add(dto);
			}
						
			close(psmt);
			close(rs);
		} catch (Exception e) {
			System.out.println("전체 레코드 반환시 오류:" + e.getMessage());
		}
		return list;
	}
	public List<DTOMember> getSearchRecord_Name(String name) {
		List<DTOMember> list = null;
		try {
			list = new Vector<DTOMember>();

			String sql = "SELECT * FROM member WHERE "
					+" mem_name LIKE ?"
					+" ORDER BY mem_num";

			psmt = con.prepareStatement(sql);

			psmt.setString(1, "%"+name+"%");
			  

			rs = psmt.executeQuery();

			while (rs.next()) {
				DTOMember dto = new DTOMember(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));

				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		}
		return list;
	}
	public List<DTOMember> getSearchRecord_ID(String id) {
		List<DTOMember> list = null;
		try {
			list = new Vector<DTOMember>();

			String sql = "SELECT * FROM member WHERE "
					+" mem_id LIKE ?"
					+" ORDER BY mem_num";

			psmt = con.prepareStatement(sql);

			psmt.setString(1, "%"+id+"%");
			  

			rs = psmt.executeQuery();

			while (rs.next()) {
				DTOMember dto = new DTOMember(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5), rs.getString(6));

				list.add(dto);
			}

		} catch (Exception e) {
			System.out.println("검색시 오류:" + e.getMessage());
		}
		return list;
	}

}