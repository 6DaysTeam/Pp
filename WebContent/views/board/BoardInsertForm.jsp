<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<form action = "<%= request.getContextPath() %>/bInsert.bo" method="post" enctype="multipart/form-data">
	<div id ="boardArea" style="background:white;">
      <label id="board-title">게시물 작성</label>
            <input type="reset" class="board-button" onclick="location.href='selectList.bo'" value="취소" >
            <input type="submit" class="board-button" onclick="location.href='selectList.bo'" value="작성">
          <div id="board-area">
            <table id="boardWrite"> 
              <tr>
                <td class="board-type">구분</td>
                <td class="board-value" colspan="3" style="float: left; margin-left:15px;">
                <input type="text" name="type" />
                </td>
              </tr>
              
              <tr>
                <td class="board-type">제목</td>
                <td class="board-value" colspan="3">
                <input type="text" id="board-subject" name="title"></td>
              </tr>
              <tr>
                <td class="board-type">작성일</td>
                <td class="board-value" style="width:265px;">
                <input type="date" name="date"></td>
                
                <td class="board-type" style="width: 48px;">작성자</td>
                <td class="board-value">
                <input type = "text" name="writer"></td>
              </tr>
              <tr>
                <td class="board-type">첨부파일</td>
                <td class="board-value" colspan="3" >
                <input type="file" name="boardfile" id="boardfile" style="float:left; margin-left:5px;">
                </td>

              </tr>
              <tr id="boardcontent">
                <td style="border-radius: 10px;">내용</td>
                <td colspan="3">
                <TEXTAREA name="content" style="height:220px; width:600px; resize:none; float:left; ">
                </TEXTAREA></td>
              </tr>
            </table>
          </div>
        </div>
        </form>
	</body>
</html>