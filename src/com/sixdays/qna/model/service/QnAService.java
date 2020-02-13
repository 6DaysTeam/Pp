package com.sixdays.qna.model.service;

import static com.sixdays.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.sixdays.qna.model.dao.QnADao;
import com.sixdays.qna.model.vo.QnA;

public class QnAService {
	
	private QnADao qDao = new QnADao();
	
	public ArrayList<QnA> selectList() {
		Connection con = getConnection();
		
		ArrayList<QnA> list = qDao.selectList(con);
		
		close(con);
		return list;
		
	}

	public int insertQnA(QnA q) {
		Connection con = getConnection();
		
		int result = qDao.insertQnA(con,q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public QnA selectOne(int qno) {
		Connection con = getConnection();
		
		QnA q = qDao.selectOne(con, qno);
		
		if(q != null) {
			int result = qDao.updateReadCount(con, qno);
			
			if(result > 0) commit(con);
			else rollback(con);
			}
		close(con);
		return q;
		}

	public int updateQnA(QnA q) {
		Connection con = getConnection();
		
		int result = qDao.updateQnA(con,q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public QnA updateView(int qno) {
		Connection con = getConnection();
		
		QnA q = qDao.selectOne(con, qno);
		
		close(con);
		
		return q;
	}

	public int deleteQnA(int qno) {
		Connection con = getConnection();
		
		int result = qDao.deleteQnA(con, qno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}

