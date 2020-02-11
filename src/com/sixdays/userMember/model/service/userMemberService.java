package com.sixdays.userMember.model.service;


import static com.sixdays.common.JDBCTemplate.close;
import static com.sixdays.common.JDBCTemplate.commit;
import static com.sixdays.common.JDBCTemplate.getConnection;
import static com.sixdays.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.sixdays.userMember.model.dao.userMemberDao;
import com.sixdays.userMember.model.vo.userMember;

/**
 * 작성자 : 박주완
 * 작성일 : 2020-02-06
 * 내용 : 연결 service 생성
 */
public class userMemberService {
	
	private Connection con;
	private userMemberDao mDao = new userMemberDao();
	
	public int insertMember(userMember m) {
		con = getConnection();
		int result = mDao.insertMember(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
		
	}

	public userMember repectMember(userMember m)  {
		con = getConnection();
		
		userMember result = mDao.repectMember(con,m);
		
		
		
		close(con);
		
		
		return result;
		
		
	}

}
