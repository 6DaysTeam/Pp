package com.sixdays.qna.model.dao;

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

import com.sixdays.qna.model.vo.QnA;

public class QnADao {
	private Properties prop;
	
	public QnADao() {
		prop = new Properties();
		
		String filePath = QnA.class.getResource("/config/QnA-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<QnA> selectList(Connection con) {
		ArrayList<QnA> list = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				QnA q = new QnA();
				
				q.setQno(rset.getInt(1));
				q.setQtype(rset.getInt("qtype"));
				q.setQtitle(rset.getString("qtitle"));
				q.setQwriter(rset.getString("qwriter"));
				q.setQdate(rset.getDate("qdate"));
				q.setQcount(rset.getInt("qcount"));
				q.setQcomment(rset.getInt("qcomment"));
				
				list.add(q);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	
	public int insertQnA(Connection con, QnA q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQnA");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQtype());
			pstmt.setString(2, q.getQtitle());
			pstmt.setString(3, q.getQcontent());
			pstmt.setString(4, q.getQwriter());
			pstmt.setString(5, q.getQnafile());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public QnA selectOne(Connection con, int qno) {
		QnA q = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA();
				
				q.setQno(qno);
				q.setQtype(rset.getInt("qtype"));
				q.setQtitle(rset.getString("qtitle"));
				q.setQwriter(rset.getString("qwriter"));
				q.setQcontent(rset.getString("qcontent"));
				q.setQdate(rset.getDate("qdate"));
				q.setQnafile(rset.getString("qnafile"));
			}
			System.out.println("qna 확인 : " + q);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return q;
	}

	public int updateReadCount(Connection con, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateQnA(Connection con, QnA q) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQnA");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, q.getQtype());
			pstmt.setString(2, q.getQtitle());
			pstmt.setString(3, q.getQnafile());
			pstmt.setString(4, q.getQcontent());
			pstmt.setInt(5,q.getQno());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteQnA(Connection con, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQnA");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
