package com.sixdays.p_board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sixdays.board.model.vo.Board;
import com.sixdays.p_board.model.dao.pBoardDao;
import com.sixdays.p_board.model.vo.p_Board;

import static com.sixdays.common.JDBCTemplate.*;

public class p_BoardService {
   
private pBoardDao pbDao = new pBoardDao();
   

 

   /**
    * 게시글 추가
    * @param b
    * @return
    */
   public int insertBoard(p_Board pb) {
      Connection con = getConnection();
      
      int result = pbDao.insertBoard(con,pb);
      
      if(result > 0) commit(con);
      else rollback(con);
      
      close(con);
      
      return result;
   }

   /**
    * 게시글 목록 조회
    * @param currentPage
    * @param limit
    * @return
    */

   public ArrayList<p_Board> selectList(String userId) {
	      Connection con = getConnection();
	      
	      ArrayList<p_Board> list = pbDao.selectList(con, userId);
	      
	      close(con);
	      
	      return list;
	   }

    /**
     * 게시글 목록 전체 조회
     * @return
     */
    public ArrayList<p_Board> allList() {
    Connection con = getConnection();
    
    ArrayList<p_Board> list = pbDao.allList(con);
    		
    close(con);
    
	return list;
}

   

}