package com.sixdays.p_board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.sixdays.common.JDBCTemplate.*;
import com.sixdays.p_board.model.vo.p_Board;

public class pBoardDao {
	
	private Properties prop;
	
	public pBoardDao(){
		
		prop = new Properties();
		
		String filePath = p_Board.class.getResource("/config/pboard-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 사진 업로드 창
	 * @param con
	 * @param pb
	 * @return
	 */
	public int insertBoard(Connection con, p_Board pb) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("insertpBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, pb.getPbwriter());
			pstmt.setString(2, pb.getPhoto1());
			pstmt.setString(3, pb.getPhoto2());
			pstmt.setString(4, pb.getPhoto3());
			pstmt.setString(5, pb.getPhoto4());
			pstmt.setString(6, pb.getPhoto5());
			pstmt.setString(7, pb.getPhoto6());
			pstmt.setString(8, pb.getPcontent());
			pstmt.setString(9, pb.getHashtag());
			
			System.out.println(sql);
			System.out.println(pb);
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 총 게시글 수
	 * @param con
	 * @return
	 */
	public int getListCount(Connection con) {
		int listCount =0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

//	public ArrayList<p_Board> selectList(Connection con, int currentPage, int limit) {
//		ArrayList<p_Board> list = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectList");
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			int startRow = (currentPage-1)*limit + 1; // 1 , 11       1 10, 11 20
//			int endRow = startRow + limit -1;
//			
//			pstmt.setInt(1, endRow);
//			pstmt.setInt(2, startRow);
//			
//			rset = pstmt.executeQuery();
//			
//			list = new ArrayList<p_Board>();
//			
//			while(rset.next()) {
//				p_Board pb = new p_Board();
//				
//				
//				pb.setBno(rset.getInt("BNO"));
//				pb.setPbwriter(rset.getString("PBWRITER"));
//				pb.setPcontent(rset.getString("PCONTENT"));
//				pb.setHashtag(rset.getString("HASHTAG"));
//				pb.setLike_count(rset.getInt("LIKE_COUNT"));
//				pb.setPbdate(rset.getDate("PBDATE"));
//								
//				list.add(pb);
//			}
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		
//		return list;
//	}

	

//	/**
//	 * 게시글 상세보기
//	 * @param con
//	 * @param bno
//	 * @return
//	 */
//	public p_Board selectOne(Connection con, int bno) {
//		p_Board pb = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectOne");
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setInt(1, bno);
//			
//			rset = pstmt.executeQuery();
//			
//			if(rset.next()) {
//				pb = new p_Board();
//				
//				pb.setBno(bno);
//				pb.setPbwriter(rset.getString("PBWRITER"));
//				pb.setPbdate(rset.getDate("PBDATE"));
//				pb.setPcontent(rset.getString("PBCONTENT"));
//				pb.setHashtag(rset.getString("HASHTAG"));
//				pb.setLike_count(rset.getInt("LIKE_COUNT"));
//				pb.setPbcomment(rset.getInt("PBCOMMENT"));
//				pb.setStatus(rset.getString("STATUS"));
//				
//			}
//			System.out.println("p_board 확인 : " +pb);
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return pb;
//	}
}
