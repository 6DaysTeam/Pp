package com.sixdays.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sixdays.qna.model.service.QnAService;
import com.sixdays.qna.model.vo.QnA;

/**
 * Servlet implementation class QnAListServlet
 */
@WebServlet("/selectList.qo")
public class QnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QnA> list = new ArrayList<>();
		
		QnAService qs = new QnAService();
		
		list = qs.selectList(); 
		
		String page = "";
		
		if(list != null) {
			page = "views/qna/QnAList.jsp";
			request.setAttribute("list", list);
		} else {
			page = "";
			request.setAttribute("msg", "QnA 목록 불러오기 에러!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
