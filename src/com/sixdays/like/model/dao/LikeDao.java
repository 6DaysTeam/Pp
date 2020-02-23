package com.sixdays.like.model.dao;

import static com.sixdays.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.sixdays.board.model.vo.Board;
import com.sixdays.like.model.vo.Like;

public class LikeDao {
//	좋아요 추천 DB접근
	private Properties prop;
	
	public LikeDao() {
		prop = new Properties();
		
		String filePath = Board.class.getResource("/config/like-query.properties").getPath();
	
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	// userID, userWriteTitle 둘 다 pk, nn 이므로 중복이 불가 !!!
    // 좋아요한 사람들의  데이터베이스 추가 기능

	public int like(Connection con, Like l) {

		int result =0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("like");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, l.getUserId() );
			pstmt.setString(2, l.getUserWriteTitle());
			pstmt.setString(3, l.getUserIP());
			
			result = pstmt.executeUpdate();
		}catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result-1;
	
	
	}

	
	// 추천 및 좋아요 통해 실제 해당 개수가 올라가는
	// 게시물 추천
	public int filelike(Connection con, String userWriteTitle) {

		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("likecount");
        
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userWriteTitle);
			
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	return result-1;
}
}
