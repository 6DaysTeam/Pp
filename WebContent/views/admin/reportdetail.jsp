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
    

    <title>신고사항 관리</title>

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
      </div>
    </nav>

    <!-- 왼쪽 메뉴바 -->
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="#"onclick="location.href='user_manage.jsp'">사용자관리 </a></li>
            <li><a href="#"onclick="location.href='report.jsp'" style="background-color: rgb(78, 75, 75); color: white;">신고사항</a></li>
            <li><a href="#">페이지관리</a></li>   
            <li><a href="#">설정</a></li>
          </ul>
        </div>

        <!-- 헤더 아래 제목? 부분 -->
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">신고사항
            <button style="float: right; width: 150px; height: 40px; font-size: 22px; font-weight: lighter; 
            background: white; border: 1px solid gray; border-radius: 5px; color: black;">정지해제</button>
          </h1>


          <div class="row placeholders">
            <!-- 프로필 사진 -->
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="/6Days/resources/images/profile2.PNG" style="width: 284px; height: 284px;" class="img-responsive" alt="Generic placeholder thumbnail">
              <span class="text-muted"></span>
            </div>

            <!-- 프로필 정보 -->
            <div class="col-xs-6 col-sm-3 placeholder" style="text-align: left; padding-right: 20px;">
                <br><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 25%;">ID</label> <label>abc123</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">닉네임</label> <label>에이비씨</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">이메일</label> <label>abc123@test.com</label><br><br>
                <label style="font-size: 20px; font-weight: bold; padding-right: 10%;">코멘트</label><label>안녕하세요^^</label>
            </div>

            <!-- 정지관련 부분  -->
            <div class="col-xs-6 col-sm-3 placeholder1"  style="text-align: left; width: 30%;">
              <br><br><br>
              <label style="font-size: 20px; font-weight: bold; padding-right: 5%;">정지사유</label>
              <select style="height:30px">
                <option value="naver">부적절한 홍보 게시물로 정지</option>
                <option value="gmail">음란물입니다.</option>
                <option value="daum">모욕,욕설이 포함되었습니다.</option>
              </select><br><br>
              <input type="text" placeholder=" 기타" style="width: 100%; border-top: 0; border-right:0; 
              border-left:0; border-bottom: 1; border-color:black; outline: none;"><br><br><br>



              <span class="text-muted"></span>
              
              <label style="font-size: 20px; font-weight: bold; padding-right: 5%;">정지유무</label><br>
              <button style="width: 80px; height: 28px; background: white; border: 1px solid gray; border-radius: 5px; color: black;">3개월</button>
              <button style="width: 80px; height: 28px; background: white; border: 1px solid gray; border-radius: 5px; color: black;">6개월</button>
              <button style="width: 80px; height: 28px; background: white; border: 1px solid gray; border-radius: 5px; color: black;">9개월</button>
              <br><br>
              <input type="text" placeholder="직접입력" style="height: 30px;">
              <button style="width: 60px; height:30px; background: white; border: 1px solid gray; border-radius: 5px; color:  black;"">확인</button>
              <span class="text-muted"></span>
            </div>
          </div>

          <!-- 신고된 게시글 -->
          <h2 class="sub-header">신고된 게시글
            <button style="float: right; width: 80px; height: 35px; font-size: 16px; font-weight: lighter; 
            background: white; border: 1px solid gray;  border-radius: 5px; color: black;">삭제</button>
          </h2>
          <div class="table-responsive">
            <table id="checklist" class="table table-striped" style="width: 95%;">
              <thead>
                <tr>
                  <th><input class="list" type="checkbox" style="width: 45px;"onclick="rcheck();" id="chk1_all"></th>
                  <th>작성일</th>
                  <th>신고일</th>
                  <th>내용</th>
                  <th style="width: 200px;">신고자</th>
                </tr>
              </thead>
              <tbody>
                <tr>   
                  <td><input class="list" type="checkbox"name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                   <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                   <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr> 
                  <td><input class="list" type="checkbox" name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="list" type="checkbox" name="chk1"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
              </tbody>
            </table>

          <!-- 신고된 댓글 -->
          <h2 class="sub-header" >신고된 댓글
            <button style="float: right; width: 80px; height: 35px; font-size: 16px; font-weight: lighter; 
            background:white; border: 1px solid gray;  border-radius: 5px; color: black;">삭제</button>
          </h2>
          <div class="table-responsive2">
            <table id="checkreply" class="table table-striped2" style="width: 95%;">
              <thead>
                <tr>
                  <th><input class="reply" type="checkbox" style="width: 45px;" onclick="rcheck2();" ></th>
                  <th>작성일</th>
                  <th>신고일</th>
                  <th>내용</th>
                  <th style="width: 200px;">신고자</th>
                </tr>
              </thead>
              <tbody>
                <tr>  
                  <td><input class="reply" type="checkbox" name="chk"></td> 
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr> 
            <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox" name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
                <tr>
                  <td><input class="reply" type="checkbox"name="chk"></td>
                  <td>2020-01-21 02:07 오전</td>
                  <td>2020-01-21 04:09 오후</td>
                  <td>2개 사면 1개 더!! 무조건 사야해요!!</td>
                  <td>홍길동</td>
                </tr>
              </tbody>
            </table>

	
          </div>
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

      // 전체 체크 / 체크 하나 풀렸을 때 전체 체크 해제 (게식글)
      window.onload = function() {
      var checkAll = document.getElementById('checklist');
      var check = checkAll.getElementsByClassName('list');
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

      // 전체 체크 / 체크 하나 풀렸을 때 전체 체크 해제(댓글)
      window.onload = function() {
      var rcheckAll = document.getElementById('checkreply');
      var rcheck = rcheckAll.getElementsByClassName('reply');
      rcheckAll.addEventListener('click',function(e) {
          var target = e.target,
          rcheckNum = 0;
          if(target === rcheck[0]) {
              if(target.checked) {
                  for(var i=1; i<rcheck.length; i++) {
                      rcheck[i].checked = true;
                  };
              } else {
                  for(var i=1; i<rcheck.length; i++) {
                      rcheck[i].checked = false;
                  };
               };
          } else {
              for(var i=1; i<rcheck.length; i++) {
                  if(rcheck[i].checked) {
                      rcheckNum++;
                  };
              };
              if(rcheckNum >= rcheck.length - 1) {
                  rcheck[0].checked = true;
              } else {
                  rcheck[0].checked = false;
              };
          };
        });
      };

      var result = 0;
      function rcheck(){
        var check = document.getElementsByClassName('list');

        if(result == 1){
          for(var i=0; i<check.length; i++){
          check[i].checked = true;

          }
          result = 0;

        }else{
          for(var i=0; i<check.length; i++){
          check[i].checked = false;

          }
          result = 1;

        }
      }

      $(".list").click(function(){
        if($("input[name='chk1']:checked").length == 8){
          $("#chk1_all").prop("checked",true);
        }else{
          $("#chk1_all").prop("checked",false);
        }
      })
     
    </script>
  </body>
</html>