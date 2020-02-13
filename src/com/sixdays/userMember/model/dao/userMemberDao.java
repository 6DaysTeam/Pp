package com.sixdays.userMember.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.sixdays.common.JDBCTemplate.*;

import com.sixdays.userMember.model.exception.MemberException;
import com.sixdays.userMember.model.vo.userMember;

/**
 * 작성자 : 박주완
 * 작성일 : 2020-02-06
 * 내용 : 사용자 DAO --> CRUD
 */
public class userMemberDao {
	private Properties prop;
	
	/**
	 * 작성자  : 박주완
	 * 작성일 : 2020. 2. 6.
	 * 내용 : 쿼리문을 독립적으로 관리하는 메소드 생성
	 */
	public userMemberDao() {
		prop = new Properties();
		
		String filePath = userMemberDao.class.getResource("/config/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 작성자  : 박주완
	 * 작성일 : 2020. 2. 6.
	 * 내용 : 사용자 추가를 위한 메소드
	 */
	public int insertMember(Connection con, userMember m) {
		// 결과 확인을 위한 변수 result 생성
				int result = 0;
				
				PreparedStatement pstmt = null;
				
				try {
					String sql = prop.getProperty("insertMember");
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, m.getUserId());
					pstmt.setString(2, m.getUserpwd());
					pstmt.setString(3, m.getUserName());
					pstmt.setString(4, m.getEmail());
					pstmt.setString(5, m.getPhone());
					pstmt.setString(6, m.getGender());
					pstmt.setString(7, m.getMycomment());

					
					result = pstmt.executeUpdate();
					
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					close(pstmt);
				}
				return result;
	}


	/**
	 * 작성자  : 신지영
	 * 작성일 : 2020. 2. 10.
	 * 가입정보확인(로그인)
	 * @param con
	 * @param m
	 * @return
	 * @throws MemberException 
	 */
	public userMember selectMember(Connection con, userMember m) throws MemberException {
		userMember result = null; // 결과를 담을 객체
		PreparedStatement pstmt = null;
		ResultSet rset = null; // Select의 결과를 담을 객체
		
		try {
			String sql = prop.getProperty("selectMember");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserpwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new userMember();
				
				result.setUserId(rset.getString("USERID"));
				result.setUserpwd(rset.getString("USERPWD"));
				result.setUserName(rset.getString("USERNAME"));
				result.setEmail(rset.getString("EMAIL"));
				result.setPhone(rset.getString("PHONE"));
				result.setGender(rset.getString("GENDER"));
				result.setMycomment(rset.getString("MYCOMMENT"));
			}	
		}catch(Exception e) {
			//e.printStackTrace();
			
			throw new MemberException(e.getMessage());
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	/**
	 * 작성자  : 윤석훈
	 * 작성일 : 2020. 2. 13.
	 * 중복확인
	 * @param con
	 * @param id
	 * @return
	 */
	public int idDupCheck(Connection con, String id) {
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		
		try {
			pstmt = con.prepareStatement(sql);			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				//-1:에러!
				// 0: id 중복사용자 없음
				// 1: id를 누군가 사용중
				result = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
	return result;
	}
}
