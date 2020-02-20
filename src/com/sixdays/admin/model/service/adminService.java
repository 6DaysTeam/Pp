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

}
