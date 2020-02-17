package com.sixdays.userMember.controller;

import static com.sixdays.common.JDBCTemplate.commit;
import static com.sixdays.common.JDBCTemplate.rollback;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import java.net.PasswordAuthentication;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sixdays.userMember.model.service.userMemberService;
import com.sixdays.userMember.model.vo.userMember;


/**
 * 작성자: 박주완
 * 작성일 : 2020-02-17
 * 내용 : 비밀번호찾기 서블릿
 */
@WebServlet("/PwdSearch.me")
public class userPwdSearchSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userPwdSearchSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
	    //2. 변수저장  
		String email = request.getParameter("inputEmail");
	    
		//3. 비즈니스 로직 
			userMemberService ms = new userMemberService();
				
			    System.out.println("@@@@@" +email);

		      //mail server 설정
		        String host = "smtp.naver.com";
		        String m_user = "pigplus3@naver.com"; //자신의 네이버 계정
		        String m_password = "!@#dltjgus0304";//자신의 네이버 패스워드
		        
		        //메일 받을 주소
		        String to_email = email;
		        
		        //SMTP 서버 정보를 설정한다.
		        Properties props = new Properties();
		        props.put("mail.smtp.host", host);
		        props.put("mail.smtp.port", 465);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.starttls.enable", "true");
		        props.put("mail.debug", "true");
		        
		        //인증 번호 생성기
		        StringBuffer temp =new StringBuffer();
		        Random rnd = new Random();
		        for(int i=0;i<10;i++)
		        {
		            int rIndex = rnd.nextInt(3);
		            switch (rIndex) {
		            case 0:
		                // a-z
		                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		                break;
		            case 1:
		                // A-Z
		                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		                break;
		            case 2:
		                // 0-9
		                temp.append((rnd.nextInt(10)));
		                break;
		            }
		        }
		        String AuthenticationKey = temp.toString();
		        System.out.println("인증번호 값 " + AuthenticationKey);
		        
		        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
		                return new javax.mail.PasswordAuthentication(m_user,m_password);
		            }
		        });
		        
		        // db까지 출장 ㄱ 비밀번호 업데이트 때리고 옴 ㅇㅇ
		        ms.userPwdSearch(email, AuthenticationKey);

				
		        
		        
		        
		        
		        
		        
		        //email 전송
		        try {
		            MimeMessage msg = new MimeMessage(session);
		            msg.setFrom(new InternetAddress(m_user, "6DAYS TEAM"));
		            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
		            
		            //메일 제목
		            msg.setSubject("<6DAYS>이메일 인증");
		            //메일 내용
		            msg.setText("안녕하세요 6DAYS입니다. \n 임시 비밀번호는"+temp + "입니다.");
		            
		            Transport.send(msg);
		            System.out.println("이메일 전송");
		            
		        }catch (Exception e) {
		            e.printStackTrace();
		        }
		        HttpSession saveKey = request.getSession();
		        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);

		        //인증번호 받은것 팝업창으로 옮기는 작업
		        
		        request.setAttribute("temp", temp);
		                 //데이터의 이름      넘길데이터

		        
		        
				RequestDispatcher rd = request.getRequestDispatcher("/views/member/PwdSearchOK.jsp");
				rd.forward(request, response);
		        System.out.println("임시비밀번호 발급 완료!!");
				
				

	     
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
