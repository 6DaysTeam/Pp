<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">사용자관리</h1>


          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="/6Days/resources/images/profile1.PNG" style="width: 284px; height: 284px;" class="img-responsive" alt="Generic placeholder thumbnail">
            
              
              <span class="text-muted"></span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder" style="text-align: left; padding-right: 20px;">
                <br><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 25%;">ID</label> <label>abc123</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">닉네임</label> <label>에이비씨</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">이메일</label> <label>abc123@test.com</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">코멘트</label><label>안녕하세요^^</label>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder1"  style="text-align: left; width: 30%;">
              <!-- <br><br><br>
              <label style="font-size: 20px; font-weight: bold; padding-right: 5%;">정지사유</label>
              <label>부적적할 홍보 게시물로 정지</label><br><br>
              <span class="text-muted"></span> -->
              
              <!-- <label style="font-size: 20px; font-weight: bold; padding-right: 5%;">정지유무</label><br><br>
              <button style="width: 80px;">3개월</button>
              <button style="width: 80px;">6개월</button>
              <button style="width: 80px;">9개월</button>
              <br><br>
              <input type="text" placeholder="직접입력">
              <button style="width: 60px;">확인</button>
              <span class="text-muted"></span> -->
              <br><br><br>
              <label>      Comment </label> <br><br><br> 
              <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">Fllowing &nbsp; &nbsp;&nbsp;&nbsp; 2.9K</label> 
              <br><br>
              <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">Fllowers &nbsp;&nbsp;&nbsp;&nbsp; 2</label>
            </div>
          </div>

          <h2 class="sub-header">최근 게시물</h2>
          <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                  <tr>
                      <th style="width: 40%;">작성일</th>
                      <th style="width: 60%;">게시글 내용</th>
                      <th></th>
                  </tr>
              </thead>
              <tbody>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>#selfie #daily</td>
                 
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>#럽스타그램</td>
                  
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>일상 온천에서</td>
                  
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>오예~~~~~~</td>
                  
                </tr>    
              </tbody>
            </table>
          </div>
          <h2 class="sub-header">접속일</h2>
          <div class="table-responsive2">
            <table class="table table-striped2">
              <thead>
                <tr>
                    <th style="width: 40%;">작성일</th>
                    <th style="width: 60%;">내용</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td></td>
                 
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td> </td>
                  
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>  </td>
                  
                </tr>
                <tr>
                    <td>2020-01-21 02:07 오전</td>
                    <td>  </td>
                  
                </tr>    
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
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

      //이벤트 제거
      $('#color_change').bind('click',function(){
          $(this).unbind('mouseenter').unbind('mouseleave').css({
              'background':'rgb(15, 76, 129)',
              'color':'white'
          });
      });
  });
    
    </script>
  </body>
</html>
