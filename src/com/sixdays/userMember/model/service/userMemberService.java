package com.sixdays.userMember.model.service;



import static com.sixdays.common.JDBCTemplate.close;
import static com.sixdays.common.JDBCTemplate.commit;
import static com.sixdays.common.JDBCTemplate.getConnection;
import static com.sixdays.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.sixdays.userMember.model.dao.userMemberDao;
import com.sixdays.userMember.model.exception.MemberException;
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

	
	/**
	 * 작성자  : 신지영
	 * 작성일 : 2020. 2. 10.
	 * 가입정보확인(로그인)
	 * @param m
	 * @return
	 * @throws MemberException 
	 */
	public userMember selectMember(userMember m) throws MemberException {
		con = getConnection();
		
		userMember result = mDao.selectMember(con,m);
		
		close(con);
		
		if(result == null) {
			throw new MemberException("아이디나 비밀번호가 올바르지 않습니다.");
		}
		return result;
	}

	public int idDupCheck(String id) {
		
		Connection con = getConnection();
		
		int result = mDao.idDupCheck(con,id);
		
		close(con);
		
		return result;
	}
	
public int nameUpdateMember(userMember m) throws MemberException {
		
		con = getConnection();
		
		int result = mDao.nameUpdateMember(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int commentUpdateMember(userMember m) throws MemberException {
		con = getConnection();
		
		int result = mDao.commentUpdateMember(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

	public int updateProImg(userMember m) throws MemberException{
		con = getConnection();
		
		int result = mDao.updateProImg(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	public int updateProBack(userMember m) throws MemberException{
		con = getConnection();
		
		int result = mDao.updateProBack(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
