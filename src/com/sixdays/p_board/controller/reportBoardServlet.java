package com.sixdays.p_board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixdays.p_board.model.service.p_BoardService;

/**
 * Servlet implementation class reportBoardServlet
 */
@WebServlet("/reportboard.bo")
public class reportBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reportBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 int pbno = Integer.parseInt(request.getParameter("pbno"));
	      

	      System.out.println("불러온 pbno값 : " + pbno);
	      
	      int result = new p_BoardService().Reportboard(pbno);
	      
	     
	      
			if(result > 0) {
				System.out.println("p보드 게시물 신고 완료.");
		
				
				
			} else {
				request.setAttribute("msg", "게시물 신고 실패!");
				System.out.println("p보드 게시물 신고 실패.");
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
