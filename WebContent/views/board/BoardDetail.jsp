<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sixdays.board.model.vo.*, java.util.*" %>
<%
	Board b = (Board)request.getAttribute("board");
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
      <label id="board-title">공지사항 내용</label>
            <input type="reset" class="board-button" onclick="location.href='selectList.bo'" value="뒤로" >
            <input type="submit" class="board-button" onclick="location.href='bUpdateView.bo?bno=<%=b.getBno()%>'" value="수정">
          <div id="board-area">
            <table id="boardWrite"> 
              <tr>
                <td class="board-type">구분</td>
                <td class="board-value" colspan="3" style="margin-left:15px;"><%= b.getBtype() %>
                </td>
              </tr>
              
              <tr>
                <td class="board-type">제목</td>
                <td class="board-value" colspan="3">
                <%= b.getBtitle() %></td>
              </tr>
              <tr>
                <td class="board-type">작성일</td>
                <td class="board-value" style="width:265px;">
               	<%= b.getBdate() %></td>
               	
                <td class="board-type" style="width: 48px;">작성자</td>
                <td class="board-value">
                <%= b.getBwriter() %></td>
              </tr>
              <tr>
                <td class="board-type">첨부파일</td>
                
              <% if(b.getBoardfile() != null && b.getBoardfile().length() > 0) { %>
                <td class="board-value" colspan="3">
                <a href="/6Days/bfdown.bo?path=<%=b.getBoardfile() %>"><%=b.getBoardfile() %> 
							</a>
              <% } %>
                </td>
              </tr>
            
              <tr style="height: 300px;">
                <td class="board-type" style="border-radius: 10px;">내용</td>
                <td colspan="3" style="float:left;">
              	<%= b.getBcontent() %></td>
              </tr>
            </table>
          </div>
        </div>
	</body>
</html>