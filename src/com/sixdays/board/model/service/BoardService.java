package com.sixdays.board.model.service;

import static com.sixdays.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sixdays.board.model.dao.BoardDao;
import com.sixdays.board.model.vo.Board;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();
	

	/**
	 * 공지사항 목록 불러오기
	 * @return
	 */
	public ArrayList<Board> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.selectList(con,currentPage, limit);
		
		close(con);
		return list;
	}


	public int insertBoard(Board b) {
		Connection con = getConnection();
		int result = bDao.insertBoard(con,b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public Board selectOne(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con, bno);
		
		if(b != null) {
			int result = bDao.updateReadCount(con, bno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		return b;
	}


	public Board updateView(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con, bno);
		
		close(con);
		
		return b;
	}


	public int updateBoard(Board b) {
		Connection con = getConnection();
		
		int result = bDao.updateBoard(con,b);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public int deleteBoard(int bno) {
		Connection con = getConnection();
		
		int result = bDao.deleteBoard(con, bno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = bDao.getListCount(con);
		
		return listCount;
	}
}

