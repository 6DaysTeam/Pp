<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sixdays.qna.model.vo.*"%>
    
<%
    	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
  <title>Insert title here</title>
    <script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href ="/6Days/resources/css/boardlist.css">


  <style>
    body{
       font-family: 'Nanum Gothic Coding', monospace;

    }
    #g_title{
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

    
<!--    작성자 : 윤석훈
        작성일 : 2020-01-14
        내용 : 게시판 임시 제작 -->
        <div id="boardArea" style="background: white; height:650px;">
        <table class="table table-striped" id="listArea">
          <label id="g-title">QnA</label>
            <tr>
                <th style="width:70px;">번호</th>
                <th style="width:70px;">구분</th>
                <th style="width:430px; text-align: center">제목</th>
                <th style="text-align:center; width:160px;">작성자</th>
                <th style="text-align:center; width:130px;">작성일</th>
                <th style="width:70px;">조회수</th>
                <th style="width:70px;">댓글수</th>
            </tr>
        </thead>
        <tbody>
        <%
        	for(QnA q : list) {
        %>
		<tr>
        <td><%= q.getQno() %></td>
        <td><%= q.getQtype() %></td>
        <td><%= q.getQtitle() %></td>
        <td><%= q.getQwriter() %></td>
        <td><%= q.getQdate() %></td>
        <td><%= q.getQcount() %></td>
        <td><%= q.getQcomment() %></td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <hr/>
    <a class="btn btn-default pull-right" 
        onclick="location.href='/6Days/views/qna/QnAInsertForm.jsp'">글쓰기</a>
    <div class="text-center">
        <ul class="pagination" style="margin:0px 0px 7px 0px;">
            <li><a href="#"></a></li>
            <li><a href="#"></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">></a></li>
            <li><a href="#">>></a></li>

        </ul>
    </div>
    <input type="text" placeholder="검색할 내용을 입력하세요" style="width:300px; margin-left:-80px;">
    <a class="btn btn-default" style="font-size: 18px;">검색</a>
</div>

<script>  
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"skyblue", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"whitesmoke"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var qno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/qSelectOne.qo?qno=" + qno;
			});
		});
</script>

</body>
</html>