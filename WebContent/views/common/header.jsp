<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

	<script src="/6Days/resources/js/sidebar.js"></script>
    <script src="/6Days/resources/js/jquery-3.4.1.min.js"></script>
    <script src="/6Days/resources/js/jquery-ui-1.11.4.custom.min.js"></script>
    <script src="/6Days/resources/js/Right_sidebar.js"></script>
    <script src="/6Days/resources/js/Infadd.js"></script>
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

<!--작성자 : 이서현,박주완
    작성일 : 2020.1.14 시작
    내용 : 메인 로고 딴따라
    수정일 : 
	-->
    <header>
        <div id="top" class="top">
            <img id="logo" src="/6Days/resources/icon/logoletter.png" onclick="location.href='/6Days/main.jsp'">


<!--  작성자 : 윤석훈
	   작성일 : 2020.02.03 
	   내용 : 검색창 구현
	  수정일 : -->
            <div id="headersearch" >
                 <input id="searchInput" type="text" placeholder="검색어를 입력해주세요.">
			     <button id="searchBtn">검색</button>
            </div>
            


            <img id="loca" class="top-btn" src="/6Days/resources/icon/UPloadbtn.png"  title="게시글추가" onclick="Infopen();" style="margin-left: 11%;">

            
<!--    작성자 : 신경섭
  		작성일 : 2020.1.14 시작
   	 	내용 : 게시물 업로드
  	 	수정일 : 
			-->
             <div id="Infmodal">
                <div id="Infcontent">
                    <button id="Infclosebtn" onclick="Infclose();">X</button>
                    <div id="Infleft">
                        <div id="Infadd">
                            <img src = "/6Days/resources/images/add.png" id="infimg"> 
                            Drop image here or click to upload
                        </div>
                    </div>

                    <div id="Infright">
                       	 <input type="text" id="Infcomment" placeholder="Comment..."/>
                    </div>
                    <button id="Infupload" onclick="">업로드</button>
                </div>
            </div>



            <img id="mg" class="top-btn" src="/6Days/resources/icon/4.png" title="마이페이지" onclick="location.href='/6Days/views/user/Profile.jsp'">
            <img id="myp" class="top-btn" src="/6Days/resources/icon/outbtn.png" title="로그아웃" onclick="logout();">

        </div>
    </header>
</body>
</html>
