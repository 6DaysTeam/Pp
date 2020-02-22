<%@page import="com.sixdays.p_board.model.vo.p_Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sixdays.userMember.model.vo.userMember" %>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 사진 게시글 리스트 가져오기
    ArrayList<p_Board> list = (ArrayList<p_Board>)request.getAttribute("list"); 
	p_Board pba = new p_Board();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>둘러보기</title>
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/left-sidebar.jsp" %>
	<%@ include file="/views/common/right-sidebar.jsp" %>
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/6Days/resources/css/sidebar.css">
    <link rel="stylesheet" href="/6Days/resources/css/Right_sidebar.css">
    <link rel="stylesheet" href="/6Days/resources/css/main.css">
    <link rel="stylesheet" href = "/6Days/resources/css/Infadd.css">
    <link rel="stylesheet" href = "/6Days/resources/css/MainContact.css">
    <link rel="stylesheet" href = "/6Days/resources/css/Scrollbar.css">
    <link rel="stylesheet" href = "/6Days/resources/css/main-header.css">
</head>
<body>

	<input type="hidden" id="userid" name="userid" value="<%=m.getUserId()%>">
	<div id="backgroundArea" style="background-color:smokewhite;">
		<div id="contentArea" class="contentArea" style="background:orange; width:60%; margin-left:20%; position:absolute; background-color:white;">
		<table align="center" style="width: 900px;">
                <tr>
                <% for(p_Board pb : list) {
                	if(pb.getPhoto1() != null){
                	
                %>
				
				<td style="display: inline-block; float:left; margin-left:2%">		
						<input type="hidden" value="<%= pb.getPbno()%>">
						<img src="/6Days/resources/pboardUploadFiles/<%=pb.getPhoto1() %>"
						     width="260px" height="260px" style="margin:7px" onclick="modalOpen();">
				
				</td>
				
				<% 
                	}
                	} %>
				</tr>
        </table>
		</div>
	</div>
	
	
<!--    작성자 : 박주완
        작성일 : 2020-01-09
        내용 : 유저 게시물 클릭시 확대창 -->
        

</body>
</html>