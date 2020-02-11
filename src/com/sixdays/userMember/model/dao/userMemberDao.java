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

	public userMember repectMember(Connection con, String userId) {
		userMember m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		try {
			String sql = prop.getProperty("repeatMember");
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new userMember();
				m.setEmail(rset.getString("EMAIL"));
				m.setGender(rset.getString("GENDER"));
				m.setMycomment(rset.getString("MYCOMMENT"));
				m.setPhone(rset.getString("PHONE"));
				m.setUserId(rset.getString("USERID"));
				m.setUserName(rset.getString("USERNAME"));
				m.setUserpwd(rset.getString("USERPWD"));
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}

}
