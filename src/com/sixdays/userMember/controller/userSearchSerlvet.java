package com.sixdays.userMember.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixdays.userMember.model.dao.userMemberDao;
import com.sixdays.userMember.model.service.userMemberService;
import com.sixdays.userMember.model.vo.userMember;

/**
 * Servlet implementation class userSearchSerlvet
 */
@WebServlet("/search.me")
public class userSearchSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userSearchSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("UTF-8");
		//2. 변수저장
		String phone = request.getParameter("inputPh");
		String email = request.getParameter("inputEmail");
		
		System.out.println("phone : "+ phone);
		System.out.println("email : "+ email);
		
		//3. 비즈니스로직
		userMemberService serivce = new userMemberService();
		userMember member = serivce.userSearch(phone,email);
		
		System.out.println("member : " + member);
		//4. 뷰처리
		
		if(member != null) {
			RequestDispatcher rd = request.getRequestDispatcher("/views/member/IdSearchOK.jsp");
			rd.forward(request, response);
			System.out.println("if member : " + member);
		}else {
			request.setAttribute("msg","정확한 정보를 입력해 주세요.");
			System.out.println("else member : " + member);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
