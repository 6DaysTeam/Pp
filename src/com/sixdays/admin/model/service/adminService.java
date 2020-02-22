package com.sixdays.admin.model.service;

import static com.sixdays.common.JDBCTemplate.close;
import static com.sixdays.common.JDBCTemplate.commit;
import static com.sixdays.common.JDBCTemplate.getConnection;
import static com.sixdays.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.sixdays.admin.model.dao.adminDao;
import com.sixdays.admin.model.vo.userManage;
import com.sixdays.board.model.vo.Board;
import com.sixdays.userMember.model.exception.MemberException;
import com.sixdays.userMember.model.vo.userMember;


public class adminService {
	

	private adminDao aDao = new adminDao();
	
	public ArrayList<userManage> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<userManage> list = aDao.selectList(con, currentPage, limit);

		close(con);
		return list;
	}
 
	public int getListCount() {
		Connection con = getConnection();
		int listCount = aDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public userManage selectOne(String userId) {
		Connection con = getConnection();
				
		userManage u= aDao.selectOne(con, userId);	
		
		close(con);
		return u;
	}

	public ArrayList<userManage> selectUserList(String userId) {

		Connection con = getConnection();
		
		ArrayList<userManage> list = aDao.selectUserList(con,userId);
		
		close(con);
		
		
		return list;
	}

	public int updateDelfag(userManage u) throws MemberException {
		Connection con = getConnection();
		System.out.println("서비스로 넘어왔닝");
		int result = aDao.updateDelfag(con,u);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

}
