<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sixdays.userMember.model.vo.*"%>
    
<%
		/* ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();
		
		BoardService bs = new BoardService();
		int Rnumber = bs.getListCount();
		
		String category = (String)request.getAttribute("category");
		String keyword = (String)request.getAttribute("keyword");
		System.out.println(Rnumber); */
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>사용자 관리</title>
    <!-- Bootstrap core CSS -->
    <link href="/6Days/resources/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/6Days/resources/css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <!-- <script src="../../assets/js/ie-emulation-modes-warning.js"></script> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

<body>
<%@ include file="../common/header.jsp" %> 
    <!-- 헤더 -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">6Days</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <!-- <ul class="nav navbar-nav navbar-right">
              <li><a href="#">Dashboard</a></li>
              <li><a href="#">Settings</a></li>
              <li><a href="#">Profile</a></li>
              <li><a href="#">Help</a></li>
            </ul> -->
            <!-- <form class="navbar-form navbar-right">
              <input type="text" class="form-control" placeholder="Search...">
            </form> -->
          </div>
        </div>
      </nav>
  
      <!-- 왼쪽 메뉴바 -->
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
              <li><a href="#"onclick="location.href='user_manage.jsp'" id="color_change" style="background: rgb(78, 75, 75); color: white;">사용자관리 </a></li>
              <li><a href="#"onclick="location.href='report.jsp'" id="color_change">신고사항</a></li>
              <li><a href="#"onmouseover="over(this)" id="color_change">페이지관리</a></li>
              <li><a href="#" onmouseover="over(this)" id="color_change">설정</a></li>
            </ul>
            <!-- <ul class="nav nav-sidebar">
              <li><a href="">Nav item</a></li>
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
              <li><a href="">More navigation</a></li>
            </ul>
            <ul class="nav nav-sidebar">
              <li><a href="">Nav item again</a></li>
              <li><a href="">One more nav</a></li>
              <li><a href="">Another nav item</a></li>
            </ul> -->
          </div>

          <h2 class="sub-header" style="margin-left: 19%; font-size: 35px;">사용자관리
            <button style="margin-left: 70%; width: 100px; height: 30px; font-size: 19px; font-weight: lighter; 
            background: white; border: 1px solid gray; border-radius: 5px; color: black;">삭제</button>
          </h2>
          <div id ="checkAll" class="table-responsive">
            <table class="table table-striped" style="text-align: center; width: 70%; margin-left: 23%; margin-top: 4%;">
                <thead>
                  <tr style="font-size: 13pt;">
                      <th style="width: 15%; text-align: center;"><input type="checkbox" class="checkAll"></th>
                      <th style="width: 6%; text-align: center;">NO</th>
                      <th style="width: 23%; text-align: center;">ID</th>
                      <th style="width: 23%; text-align: center;">닉네임</th>
                      <th style="width: 10%; text-align: center;">댓글수</th>
                      <th style="width: 10%; text-align: center;">게시물수</th>
                      <th style="width: 15%; text-align: center;">최근접속일</th>
                  </tr>
              </thead>
              <tbody>
                <%
        	/* 	for(Board b : list) { */
        		%>
                <tr style="cursor: pointer;">
                    <td><input type="checkbox" class="chkbox"></td>
                    <td class="next"><%=m.getOtype() %></td class="next">
                    <td class="next"><%=m.getUserId() %></tdㅍ>
                    <td class="next"><%=m.getUserName() %></td class="next">
                    <td class="next"><%=m.getProimg() %></td class="next">
                    <td class="next"><%=m.getProback() %></td class="next">
                    <td class="next"><%=m.getEnrolldate() %></td class="next">
                </tr>        
           <%--       <% } %>    --%>
              </tbody>
            </table>
          </div>
        </div>
    </div>
  

    <div class="text-center" style="margin-right: -10%;">
        <ul class="pagination">
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
      </ul>
    </div>
  
     <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- <script src="../../dist/js/bootstrap.min.js"></script> -->
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <!-- <script src="../../assets/js/vendor/holder.js"></script> -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <!-- <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->

    <script>        
      //메뉴바 선택하기 
      $(function(){
            //이벤트 연결(바인딩)
            $('#color_change').bind('mouseenter',function(){
                $(this).css({
                'background': rgb(15, 76, 129),
                'color':'white'
                });
            }).bind('mouseleave',function(){
                $(this).css({
                    'background': rgb(15, 76, 129),
                    'color':'white'
                });
            });

            //이벤트 제거
            $('#color_change').bind('click',function(){
                $(this).unbind('mouseenter').unbind('mouseleave').css({
                    'background': rgb(15, 76, 129),
                    'color':'white'
                });
            });
        });

       // 전체 체크 / 체크 하나 풀렸을 때 전체 체크 해제
       window.onload = function() {
      var checkAll = document.getElementById('checkAll');
      var check = checkAll.getElementsByTagName('input');
      checkAll.addEventListener('click',function(e) {
          var target = e.target,
          checkNum = 0;
          if(target === check[0]) {
              if(target.checked) {
                  for(var i=1; i<check.length; i++) {
                      check[i].checked = true;
                  };
              } else {
                  for(var i=1; i<check.length; i++) {
                      check[i].checked = false;
                  };
               };
          } else {
              for(var i=1; i<check.length; i++) {
                  if(check[i].checked) {
                      checkNum++;
                  };
              };
              if(checkNum >= check.length - 1) {
                  check[0].checked = true;
              } else {
                  check[0].checked = false;
              };
          };
        });
      };

      // td(class=next) 클릭시 페이지 이동
      $(".next").click(function(){   
        location.href='user_managedetail.jsp';
      });

    </script>
</body>
</html>