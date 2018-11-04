package kr.co.enough.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.enough.dto.MentoDto;


public class MentoDao {
	
	public MentoDao() throws NamingException {
		Context context = new InitialContext();		
		datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	}
	
	DataSource datasource = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
								
	public ArrayList<MentoDto> getMentoList() { 				
		
		ArrayList<MentoDto> memolist = new ArrayList<MentoDto>();		
		
		try {
			String sql = "select m.NAME name, mt.CAREER career, mt.MENTO_EMAIL mtemail, mt.STAUS_CODE mtcode, m.MEMBER_IMG pimg from mento mt join MEMBER m on mt.MENTO_EMAIL = m.EMAIL where mt.STAUS_CODE = 'MS00'";
			
			conn = datasource.getConnection();		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MentoDto m = new MentoDto();
				m.setMtcode(rs.getString("mtcode"));
				m.setName(rs.getString("name"));
				m.setCareer(rs.getString("career"));
				m.setMtemail(rs.getString("mtemail"));
				m.setPimg(rs.getString("pimg"));
				memolist.add(m);				
			   }
			
		}catch(Exception e) {	         
	    } finally {	         
				 try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		         try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		         try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}         
	      }
		return memolist;
		
	}	
	
	public MentoDto getMentoDetailService(String mtemail) { 				
		
		MentoDto m = new MentoDto();
		try {
			String sql = "select m.NAME name, mt.CAREER career, mt.MENTO_EMAIL mtemail, mt.STAUS_CODE mtcode, m.MEMBER_IMG pimg" 
			         + " from mento mt join MEMBER m on mt.MENTO_EMAIL = m.EMAIL" 
					 + " where mt.MENTO_EMAIL = ?";
			
			conn = datasource.getConnection();		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mtemail);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				m.setMtcode(rs.getString("mtcode"));
				m.setName(rs.getString("name"));
				m.setCareer(rs.getString("career"));
				m.setMtemail(rs.getString("mtemail"));	
				m.setPimg(rs.getString("pimg"));
			}				
			
		}catch(Exception e) {	         
		} finally {	         
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}         
		}
		return m;
	}
	
	public void delete( String  MENTO_EMAIL){
		
		 conn = null;
		 pstmt = null;
		 
		try{
			conn = datasource.getConnection();
			
			String sql = "DELETE FROM mento WHERE MENTO_EMAIL = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString( 1, MENTO_EMAIL);
				
           	pstmt.executeUpdate( );					
		
		}catch( Exception e) { 
			e.printStackTrace();
		}finally{
			try {
				if( pstmt != null) pstmt.close();
				if( conn != null) conn.close();
				
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
	}//end delete
	
	
	public MentoDto retrieve(String MENTO_EMAIL){
		
		 conn = null;
		 pstmt = null;
		 rs = null;
		 MentoDto data = new MentoDto();
		 try{
				conn = datasource.getConnection();
				
				String sql = "select mt.STAUS_CODE mtcode, m.NAME name, mt.CAREER career, mt.MENTO_EMAIL mtemail" + 
						" from mento mt join MEMBER m on mt.MENTO_EMAIL = m.EMAIL" + 
						" where MENTO_EMAIL = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString( 1, MENTO_EMAIL);
				rs= pstmt.executeQuery();

				if( rs.next()){	
					data.setMtcode(rs.getString("mtcode"));
					data.setName(rs.getString("name"));
					data.setCareer(rs.getString("career"));
					data.setMtemail(rs.getString("mtemail"));					
				}//end if				
					
		 }catch( Exception e){ 
			 e.printStackTrace();
		 }finally{
				try {
					if( rs != null) rs.close();
					if( pstmt != null) pstmt.close();
					if( conn != null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
				 return data; 
		
	}//end retrieve
	
	public int insertMemo(String MENTO_EMAIL, String STUDY_NAME, String STUDY_LOC_CODE, String START_DATE,
			String END_DATE, String PRICE, String STUDEY_SUBJECT_CODE, String STUDY_LEVEL_CODE, String STUDY_WRITE) throws SQLException {
		int resultrow = 0;		
		
		try {			   
			   String sql="insert into study(STUDY_NUM, MENTO_EMAIL, STUDY_NAME, STUDY_LOC_CODE, START_DATE, END_DATE, PRICE, STUDEY_SUBJECT_CODE, STUDY_LEVEL_CODE, STUDY_WRITE)"
			   		+ "values(STUDY_SEQ.nextval,?,?,?,?,?,?,?,?,?)";
			   
			   conn = datasource.getConnection();
			   pstmt = conn.prepareStatement(sql);			   
			   pstmt.setString(1, MENTO_EMAIL);
			   pstmt.setString(2, STUDY_NAME);
			   pstmt.setString(3, STUDY_LOC_CODE);
			   pstmt.setString(4, START_DATE);
			   pstmt.setString(5, END_DATE);			   
			   pstmt.setInt(6, Integer.parseInt(PRICE));
			   pstmt.setString(7, STUDEY_SUBJECT_CODE);
			   pstmt.setString(8, STUDY_LEVEL_CODE);
			   pstmt.setString(9, STUDY_WRITE);		
			 //number資料型stringで値を持って来て 
			 //pstmt.setInt(3,Integer.parseInt(salary));で入力する		
			   
			   resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("Insert :" + e.getMessage());
		}finally {
			pstmt.close();
			conn.close();
		} 
		return resultrow;
	}	
	
	
	public int insertCareerList(String email,String career, String staus_code) throws SQLException {
		int resultrow = 0;		
		
		try {			   
			   String sql="insert into mento(mento_email, career, staus_code) values(?,?,'MS01')";
			   String mscode = "MS01";
			   conn = datasource.getConnection();
			   pstmt = conn.prepareStatement(sql);	
			   pstmt.setString(1, email);
			   pstmt.setString(2, career);
			   
			   resultrow = pstmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("Insert :" + e.getMessage());
			e.printStackTrace();
		}finally {
			pstmt.close();
			conn.close();
		} 
		return resultrow;
	}	
}






