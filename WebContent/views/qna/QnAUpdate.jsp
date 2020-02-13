<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sixdays.qna.model.vo.*"%>
<% QnA q = (QnA)request.getAttribute("qna"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="/6Days/resources/js/ckeditor/ckeditor.js"></script>
    <script src="/6Days/resources/js/ckeditor/config.js"></script>
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
		.cke_chrome {
			margin-left : 13px !important;
		}
		
		#board-subject {
			width: 643px;
		}
		
		.board-type {
			width: 68px;
		}
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
                <td class="board-value" colspan="3" style="margin-left:15px;">
                <select name="qtype">
                	<option>공개</option>
                	<option>비공개</option>
                </select>
                </td>
              </tr>
              
              <tr>
                <td class="board-type">제목</td>
                <td class="board-value" colspan="3">
                <input type="text" id="board-subject" name="title" value="<%= q.getQtitle().replace("\"", "&#34;") %>">
              	<input type="hidden" name="bno" value="<%= q.getQno() %>"></td>
              </tr>
              
              <tr>
                <td class="board-type">작성자</td>
                <td class="board-value" style="width:265px;">
                <%= q.getQwriter() %></td>
                
                <td class="board-type" style="width: 62px;">작성일</td>
                <td class="board-value" style="width:265px;">
                <%= q.getQdate() %></td>
              </tr>
              <tr>
                <td class="board-type">첨부파일</td>
                <td class="board-value" colspan="3" >
                <input type="file" name="boardfile" style="float:left; margin-left:13px;"
                value="<%= q.getQnafile() %>"></td>

              </tr>
              <tr>
                <td class="board-type" style="border-radius: 10px; font-size:25px;">내용</td>
                <td colspan="3">
                <textarea id="ckeditor" name="content" style="float:left;"><%= q.getQcontent() %></textarea></td>
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
				
			CKEDITOR.replace('ckeditor'
	                , {height: 300
	        		
	                 });
				</script>
        
        </form>
</body>
</html>