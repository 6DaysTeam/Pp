<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sixdays.qna.model.vo.*, java.util.*, com.sixdays.qnacomment.model.vo.*" %>
<%
	QnA q = (QnA)request.getAttribute("qna");
	/* QnAComment qc = (QnAComment)request.getAttribute("qnacomment"); */
	ArrayList<QnAComment> clist = (ArrayList<QnAComment>)request.getAttribute("clist");
	System.out.println(clist);
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
	<% if(m != null) { %>
	<div id ="boardArea" style="background:white;">
      <label id="board-title">QnA 내용</label>
            <input type="reset" class="board-button" onclick="location.href='selectList.qo'" value="뒤로" >
      <% if(q.getQwriter().equals(m.getUserId())){ %>
            <input type="submit" class="board-button" onclick="location.href='qUpdateView.qo?qno=<%=q.getQno()%>'" value="수정">
            <%} %>
          <div id="board-area">
            <table id="boardWrite"> 
              <tr>
                <td class="board-type">구분</td>
                <td class="board-value" colspan="3" style="float : left; margin-left:15px;"><%= q.getQtype() %>
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
                <%= m.getUserId() %></td>
                
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
              </table><br><br>
              
              <form action="InsertComment.qo" method="post">
              		<input type="hidden" name="cwriter" value="<%=m.getUserId()%>"/>
					<input type="hidden" name="qno" value="<%=q.getQno() %>" />
					<input type="hidden" name="refcno" value="0" />
					<input type="hidden" name="clevel" value="1" />
              		
              <table style="margin-left:3.8%">
              <tr>
              	<td colspan="3" style="float:left">댓글작성</td>
              	
              </tr>
              <tr>
              	<td colspan="3"><textarea name ="ccontent" style="width: 700px; height: 40px; resize:none;" placeholder="댓글 입력란 입니다"></textarea><td>
              	<td width="60px"><button type="submit" style="margin-left: -40%; width:60px; height:46px; margin-bottom: 10%;">작성</button>
              </tr>
              <tr><td colspan="3"><hr></td><tr>
              </table>
              </form>
           <% if(clist != null) { %>
           		<% for(QnAComment qco : clist) {
           			%>
  
 <!-- ************************************************************************************************ -->          			
           <div id="coment00">			
              <table>
              <tr>
	             <td id="pofileimgbox0001" rowspan="2">
	                <div id="profileimg000">
						<% if(m.getProimg() != null) {%>
						     <img id="profileimg00" src="/6Days/resources/proimgUploadFiles/<%= m.getProimg() %>">
						<%}else{ %>
							 <img id="profileimg00" src="/6Days/resources/proimgUploadFiles/proimg.png" >
						<%} %>
	                </div>
	             </td>
	             
	             <td id="userIdText" ><%=qco.getCwriter() %></td>
	             <td id="comentsInsertDate"><%= q.getQdate()  %></td>
              </tr>
              
              <tr>
              	<td colspan="2"><textarea id="innerComments" readonly="readonly"><%=qco.getCcontent() %></textarea></td>
              </tr>
              
			  <tr>
				  <td id="btns000">
				  <% if(m.getUserId().equals(qco.getCwriter())) { %>
					<button style="float:right"onclick="deleteReply(this);">삭제</button>
					<button class="updatebtn" style="float:right" onclick="updateReply(this);">수정</button>
					<button class="updateConfirm" style="float:right; display:none;" onclick="updateConfirm(this);">수정완료</button>
					
				  <% } else if(qco.getClevel() < 3) { %>
					<input type="hidden" name="cwriter" value="<%=qco.getCwriter()%>"/>
					<input type="hidden" name="refcno" value="<%= qco.getCno() %>" />
					<input type="hidden" name="clevel" value="<%=qco.getClevel() %>" />
							<button type="button" class="insertBtn" onclick="reComment(this);">
								댓글 달기
							</button>&nbsp;&nbsp;
								 
							<button type="button" class="insertConfirm" onclick="reConfirm(this);" style="display:none;" >
								댓글 추가 완료
							</button> 
								
				  <% } else {%>
							<span> 마지막 레벨입니다.</span>
				  <% } %>
				  
				  </td>
			  </tr>
              </table>
           </div>   
			<% } %>
			
		<% } %>
<!-- ************************************************************************************************ -->
              
              
          </div>
        </div>
        <script>
    	function updateReply(obj) {
    		// 현재 위치와 가장 근접한 textarea 접근하기

    		$(obj).parent().parent().next().find('textarea').removeAttr('readonly');
    		console.log($(obj).parent().parent().next().find('textarea').val());
    		// 수정 완료 버튼을 화면 보이게 하기
    		$(obj).siblings('.updateConfirm').css('display','inline');
    		
    		// 수정하기 버튼 숨기기
    		$(obj).css('display', 'none');
    	}
    	
    	function updateConfirm(obj) {
    		// 댓글의 내용 가져오기
    		var content
    		  = $(obj).parent().parent().next().find('textarea').val();
    		
    		// 댓글의 번호 가져오기
    		var cno = $(obj).siblings('input').val();
    		
    		// 게시글 번호 가져오기
    		var bno = '<%=q.getQno()%>';
    		
    		location.href="/myWeb/updateComment.bo?"
    				 +"cno="+cno+"&bno="+bno+"&content="+content;
    	}
    	
    	function deleteReply(obj) {
    		// 댓글의 번호 가져오기
    		var cno = $(obj).siblings('input').val();
    		
    		// 게시글 번호 가져오기
    		var bno = '<%=q.getQno()%>';
    		
    		location.href="/myWeb/deleteComment.bo"
    		+"?cno="+cno+"&bno="+bno;
    	}
    	
    	function reComment(obj){
    		// 추가 완료 버튼을 화면 보이게 하기
    		$(obj).siblings('.insertConfirm').css('display','inline');
    		
    		// 클릭한 버튼 숨기기
    		$(obj).css('display', 'none');
    		
    		// 내용 입력 공간 만들기
    		var htmlForm = 
    			'<tr class="comment"><td></td>'
    				+'<td colspan="3" style="background : transparent;">'
    					+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
    				+ '</td>'
    			+ '</tr>';
    		
    		$(obj).parents('table').append(htmlForm);
    		
    	}
    	
    	function reConfirm(obj) {
    		// 댓글의 내용 가져오기
    		
    		// 참조할 댓글의 번호 가져오기
    		var refcno = $(obj).siblings('input[name="refcno"]').val();
    		var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
    		
    		// console.log(refcno + " : " + level);
    		
    		// 게시글 번호 가져오기
    		var bno = '<%=q.getQno()%>';
    		
    		var parent = $(obj).parent();
    		var grandparent = parent.parent();
    		var siblingsTR = grandparent.siblings().last();
    		
    		var content = siblingsTR.find('textarea').val();
    		
    		// console.log(parent.html());
    		// console.log(grandparent.html());
    		// console.log(siblingsTR.html());
    		
    		// console.log(content);

    		// writer, replyContent
    		// bno, refcno, clevel
    		
    		location.href='/6Days/insertComment.qo'
    		           + '?writer=<%= m.getUserId() %>' 
    		           + '&replyContent=' + content
    		           + '&bno=' + bno
    		           + '&refcno=' + refcno
    		           + '&clevel=' + level;
    	}
    	</script>
    	<% } else {
    		request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
    		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
    	}
    	%>
	</body>
</html>