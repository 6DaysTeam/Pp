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

import com.sixdays.board.model.vo.Board;
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
    * 사진 목록조회 창
    * @param con
    * @return
    */
   

   public ArrayList<p_Board> selectList(Connection con, String userId) {
      ArrayList<p_Board> list = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectpBoard");
      
      try {
         pstmt = con.prepareStatement(sql);
         
         pstmt.setString(1, userId);
         rset = pstmt.executeQuery();
         
         list = new ArrayList<>();
         
         while(rset.next()) {
            p_Board pb= new p_Board();
            
            pb.setPbno(rset.getInt("PBNO"));
            pb.setPbwriter(rset.getString("PBWRITER"));
            pb.setPbdate(rset.getDate("PBDATE"));
            pb.setPhoto1(rset.getString("PHOTO1"));
            pb.setPhoto2(rset.getString("PHOTO2"));
            pb.setPhoto3(rset.getString("PHOTO3"));
            pb.setPhoto4(rset.getString("PHOTO4"));
            pb.setPhoto5(rset.getString("PHOTO5"));
            pb.setPhoto6(rset.getString("PHOTO6"));
            
            list.add(pb);
         
         }
         
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
   
      return list;
   }

		public ArrayList<p_Board> allList(Connection con) {
			 ArrayList<p_Board> list = null;
		     PreparedStatement pstmt = null;
		     ResultSet rset = null;
		     
		     String sql = prop.getProperty("selectAll");
		   try {
			   pstmt = con.prepareStatement(sql);
			   rset = pstmt.executeQuery();
			   
			   
		       list = new ArrayList<>();
		       while(rset.next()) {
		            p_Board pb= new p_Board();
		            
		            pb.setPbno(rset.getInt("PBNO"));
		            pb.setPbwriter(rset.getString("PBWRITER"));
		            pb.setPbdate(rset.getDate("PBDATE"));
		            pb.setPcontent(rset.getString("PCONTENT"));
		            pb.setPhoto1(rset.getString("PHOTO1"));
		            pb.setPhoto2(rset.getString("PHOTO2"));
		            pb.setPhoto3(rset.getString("PHOTO3"));
		            pb.setPhoto4(rset.getString("PHOTO4"));
		            pb.setPhoto5(rset.getString("PHOTO5"));
		            pb.setPhoto6(rset.getString("PHOTO6"));
		            
		            list.add(pb);
		         
		         }
		       
		     }catch(SQLException e) {
		    	 e.printStackTrace();
		     }finally {
		    	 close(rset);
		    	 close(pstmt);
		     }
		   
			return list;				
		}


   
   
   
   
}