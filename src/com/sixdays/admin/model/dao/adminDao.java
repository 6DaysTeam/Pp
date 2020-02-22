package com.sixdays.admin.model.dao;

import static com.sixdays.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.StatementEvent;

import org.omg.PortableInterceptor.TRANSPORT_RETRY;

import com.sixdays.admin.model.vo.Report;
import com.sixdays.admin.model.vo.userManage;
import com.sixdays.board.model.vo.Board;
import com.sixdays.userMember.model.exception.MemberException;

public class adminDao {
	private Properties prop; 
	
	public adminDao() {
		
		prop = new Properties();
	
		String filePath = userManage.class.getResource("/config/admin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<userManage> selectList(Connection con, int currentPage, int limit) {
		ArrayList<userManage> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectaManage");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			
			
			System.out.println("strat : "+startRow);
			System.out.println("strat : "+endRow);
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				userManage u = new userManage();
				
				u.setRownum(rset.getInt(1));
				u.setUserId(rset.getString(2));
				u.setUserName(rset.getString(3));
				u.setpCount(rset.getInt(4));
				u.setEnrolldate(rset.getDate(5));
				u.setDelflag(rset.getString(6));
				
				
				list.add(u);
			
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("list : "+list);
		return list;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			System.out.println(listCount);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	/**
	 * 관리자(사용자 관리) 세부내용
	 * @param con
	 * @param userId
	 * @return
	 */
	public userManage selectOne(Connection con, String userId) {
		userManage u = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			 
			if(rset.next()) {
				u = new userManage();
				
				u.setUserId(userId);
				u.setProimg(rset.getString("PROIMG"));
				u.setUserName(rset.getString("USERNAME"));
				u.setEmail(rset.getString("EMAIL"));
				u.setMycomment(rset.getString("MYCOMMENT"));
				u.setEnrolldate(rset.getDate("ENROLLDATE"));
			
				}
			
			System.out.println("userManage 확인 : " + u);
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return u;
	}

	public ArrayList<userManage> selectUserList(Connection con, String userId) {

		
		PreparedStatement pstmt = null;
		
		ArrayList<userManage> list = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUserList");
		
		try {
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<userManage>();
			
			while(rset.next()) {
				
				userManage u = new userManage();
				
				u.setPdate(rset.getDate("PBDATE"));
				u.setPcontent(rset.getString("PCONTENT"));
				
				list.add(u);	
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();	
		}finally {
			close(rset);
			close(pstmt);
			
		}
	
		return list;
	}

	public int updateDelfag(Connection con, userManage u) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("dsdass");
		
		try {	
			String sql = prop.getProperty("updateDelfag");

			pstmt = con.prepareStatement(sql);	
			
			pstmt.setString(1, u.getUserId());		
			
			result = pstmt.executeUpdate();
		
			
		}catch(SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
//	--------------------------------------------------
//	신고사항 관리 


	public ArrayList<Report> rselectList(Connection con, int currentPage, int limit) {
	
		ArrayList<Report> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectReport");
	
	try {
		pstmt = con.prepareStatement(sql);
		  
		int startRow = (currentPage-1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		
		
		System.out.println("start : "+startRow);
		System.out.println("end : "+endRow);
		
		pstmt.setInt(1, endRow);
		pstmt.setInt(2, startRow);
		rset = pstmt.executeQuery();
		
		list = new ArrayList<>();
		
		while(rset.next()) {
		
		Report r = new Report();
	
		r.setRownum(rset.getInt(1));
		r.setUserId(rset.getString(2));
		r.setUserName(rset.getString(3));
		r.setStatus(rset.getString(4));
		r.setBlockflag(rset.getString(5));
		r.setReport_yn(rset.getString(6));
	
		list.add(r);
	
	}
	
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
	System.out.println("list : "+list);
		return list;
	}
	
	public int getrListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
	
		String sql = prop.getProperty("listCount");
	
	try {
		stmt = con.createStatement();
	
		rset = stmt.executeQuery(sql);
	
	if(rset.next()) {
		listCount = rset.getInt(1);
	}
		System.out.println(listCount);
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(stmt);
	}
		return listCount;
	}

	public int delflagcheckN(Connection con, String userid) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("delflagcheckN");
			
			pstmt = con.prepareStatement(sql);
			

			pstmt.setString(1, userid);

			
			result = pstmt.executeUpdate();

			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int delflagcheckY(Connection con, String userid) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("delflagcheckY");
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, userid);
			
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
 
}
