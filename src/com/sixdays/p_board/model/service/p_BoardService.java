package com.sixdays.p_board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.sixdays.p_board.model.dao.pBoardDao;
import com.sixdays.p_board.model.vo.p_Board;
import static com.sixdays.common.JDBCTemplate.*;

public class p_BoardService {
	
private pBoardDao pbDao = new pBoardDao();
	
	public int getListCount() {
	
		Connection con = getConnection();
		int listCount = pbDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

//	/**
//	 * 게시글 목록 조회
//	 * @param currentPage
//	 * @param limit
//	 * @return
//	 */
//	public ArrayList<p_Board> selectList(int currentPage, int limit) {
//		Connection con = getConnection();
//		ArrayList<p_Board> list = pbDao.selectList(con,currentPage,limit);
//		
//		close(con);
//		
//		
//		return list;
//	}

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

//	/**
//	 * 게시판 상세보기
//	 * @param bno
//	 * @return
//	 */
//	public p_Board selectOne(int bno) {
//		Connection con = getConnection();
//		
//		p_Board pb = pbDao.selectOne(con, bno);
//		
//		close(con);
//		
//		return pb;
//	}
}
