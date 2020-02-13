<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sixdays.qna.model.vo.*, java.util.*" %>
<%
	QnA q= (QnA)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href ="/6Days/resources/css/boardWrite.css">
    <style>
    body{
       font-family: 'Jua', sans-serif;

    }
    
    .board-type {
    width: 63px !important;
}
    #boardArea {
    width: 918px;
    height: 100%;
    margin-left: 1.8%;
    align-content: center;
    padding: 15px;
    padding-top: 100px;
    text-align: center;
    margin: 0px auto;
}
    </style>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/left-sidebar.jsp" %>
<%@ include file="../common/right-sidebar.jsp" %>

	<div id ="boardArea" style="background:white;">
      <label id="board-title">QnA 내용</label>
            <input type="reset" class="board-button" onclick="location.href='selectList.qo'" value="뒤로" >
            <input type="submit" class="board-button" onclick="location.href='qUpdateView.qo?qno=<%=q.getQno()%>'" value="수정">
          <div id="board-area">
            <table id="boardWrite"> 
              <tr>
                <td class="board-type">구분</td>
                <td class="board-value" colspan="3" style="margin-left:15px;"><%= q.getQtype() %>
                </td>
              </tr>
              
              <tr>
                <td class="board-type">제목</td>
                <td class="board-value" colspan="3">
                <%= q.getQtitle() %></td>
              </tr>
              <tr>
                <td class="board-type">작성자</td>
                <td class="board-value" style="width:265px;">
                <%= q.getQwriter() %></td>
                
                <td class="board-type" style="width: 63px;">작성일</td>
                <td class="board-value" style="width:265px;">
               	<%= q.getQdate() %></td>
               	
              </tr>
              <tr>
                <td class="board-type" style="border-bottom: 1px solid whitesmoke;">첨부파일</td>
                
                <td class="board-value" colspan="3" style="border-bottom: 1px solid whitesmoke;">
              <% if(q.getQnafile() != null && q.getQnafile().length() > 0) { %>
                <a href="/6Days/qfdown.qo?path=<%=q.getQnafile() %>"><%=q.getQnafile() %> 
							</a>
              <% } %>
                </td>
              </tr>
            
              <tr style="height: 300px;">
                <td class="board-type" style="margin-left: 10px; border-radius: 10px; font-size : 25px !important">내용</td>
                <td colspan="3" style="float:left; border-style : none; font-size : 16px;">
              	<%= q.getQcontent() %></td>            
              </table>
          </div>
        </div>
	</body>
</html>