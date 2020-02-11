package com.sixdays.userMember.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixdays.userMember.model.service.userMemberService;
import com.sixdays.userMember.model.vo.userMember;

/**
 * Servlet implementation class userRepeatCheck
 */
@WebServlet("/user.rc")
public class userRepeatCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userRepeatCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("name");
		
		
		userMemberService ms = new userMemberService();
		
		userMember m = ms.repectMember(userId);
		
		if(m == null) {
			request.setAttribute("result",true);
			
		}else {
			request.setAttribute("result",false);
		}

		request.setAttribute("name", userId);
		RequestDispatcher rd = request.getRequestDispatcher("/6Days/views/member/Register.jsp");
		rd.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
