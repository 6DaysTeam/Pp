<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sixdays.qna.model.vo.*, com.sixdays.board.model.vo.*"%>
    
<%
    	ArrayList<QnA> list = (ArrayList<QnA>)request.getAttribute("list");
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
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
		 <input type="hidden" value="<%= q.getQno() %>">
        <td><%= q.getRnum() %></td>
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
        
        <%-- 페이지 처리 --%>
		<div class="text-center" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/selectList.qo?currentPage=<%= maxPage %>'">>></button>
			
		</div> 
  <!--   <div class="text-center">
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
    </div> -->
    <div class="searchArea" align="center" style="margin-top: 10px;
    padding-left: 75px;">
				<select id="searchCondition" name="searchCondition" style="display: inline-block;
    height: 25px;">
					<option value="">---</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
				</select>
    
    <input type="text" id="keyword" placeholder="검색할 내용을 입력하세요" style="line-height: 20px; width: 300px; display: inline-block;">
    <a class="btn btn-defalut" 
    	onclick="location.href='<%=request.getContextPath()%>/qSearch.qo?category='+$('#searchCondition').val()+'&keyword='+$('#keyword').val()" 
    	style="cursor: pointer; display: inline-block; font-size: 18px; margin: 5px 0 0 5px;">검색 </a>
	</div>
</div>

<script>  
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"skyblue", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"whitesmoke"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var qno = $(this).parent().find('input').val();
				location.href="<%=request.getContextPath()%>/qSelectOne.qo?qno=" + qno;
			});
		});
</script>

</body>
</html>