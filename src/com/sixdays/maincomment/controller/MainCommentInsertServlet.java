package com.sixdays.maincomment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixdays.maincomment.model.service.MainCommentService;
import com.sixdays.maincomment.model.vo.MainComment;

/**
 * Servlet implementation class MainCommentServlet
 */
@WebServlet("/InsertComment.mo")
public class MainCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		int mno = Integer.parseInt(request.getParameter("mno"));
		String mwriter = request.getParameter("mwriter");
		String mcontent = request.getParameter("mcontent");
		String mnickname = request.getParameter("mnickname");
		
		MainComment mc = new MainComment(pbno, mno, mwriter, mcontent,mnickname);
		
		int result = new MainCommentService().insertComment(mc);
		
		response.getWriter().print(result);
		
						
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
