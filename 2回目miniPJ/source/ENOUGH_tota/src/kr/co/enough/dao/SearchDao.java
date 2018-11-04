package kr.co.enough.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.enough.dto.StudyDto;

public class SearchDao {
	DataSource datasource = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public SearchDao() throws NamingException {
		Context context = new InitialContext();
		datasource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

		// datasource.getConnection > POOLにある連結客体得てくる
		// ダスミョン返還: datasource.close()
	}

	public String search(String value) throws SQLException {
		conn = null;
		pstmt = null;
		rs = null;
		String study = "";
		try {
			String sql = "select distinct s.study_subject_code from study s join study_subject_code sub on s.study_subject_code = sub.subject_code where sub.subject_name = ?";

			conn = datasource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				study = rs.getString("study_subject_code");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		return study;
	}

}
