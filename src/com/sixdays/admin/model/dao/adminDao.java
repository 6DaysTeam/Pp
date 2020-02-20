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

import com.sixdays.admin.model.vo.userManage;
import com.sixdays.board.model.vo.Board;

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
 
}
