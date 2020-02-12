<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sixdays.board.model.vo.*"%>
<% Board b = (Board)request.getAttribute("board"); %>
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

<form id="updateForm" method="post">
	<div id ="boardArea" style="background:white;">
      <label id="board-title">공지사항 수정</label>
            <button class="board-button" onclick="deleteNotice();">삭제</button>
            <button class="board-button" onclick="complete();">수정</button>
          <div id="board-area">
            <table id="boardWrite"> 
              <tr>
                <td class="board-type">구분</td>
                <td class="board-value" colspan="3" style="margin-left:15px;">공지
                </td>
              </tr>
              
              <tr>
                <td class="board-type">제목</td>
                <td class="board-value" colspan="3">
                <input type="text" id="board-subject" name="title" value="<%= b.getBtitle().replace("\"", "&#34;") %>">
              	<input type="hidden" name="bno" value="<%= b.getBno() %>"></td>
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
                <td class="board-value" colspan="3" >
                <input type="file" name="boardfile" style="float:left; margin-left:5px;"
                value="<%= b.getBoardfile() %>"></td>

              </tr>
              <tr>
                <td style="border-radius: 10px;">내용</td>
                <td colspan="3">
                <TEXTAREA name="content" style="height:220px; width:600px; resize:none; float:left;">
                <%= b.getBcontent() %></TEXTAREA></td>
              </tr>
            </table>
          </div>
        </div>
        <script>
			function complete(){
				$("#updateForm").attr("action","<%=request.getContextPath() %>/bUpdate.bo");
			}
			
			function deleteNotice(){
				// delete 는 예약어 이므로 deleteNotice 로 ...!
				$("#updateForm").attr("action","<%=request.getContextPath() %>/bDelete.bo");
			}
				
				</script>
        
        </form>
</body>
</html>