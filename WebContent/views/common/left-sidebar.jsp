<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
</head>
<body onload="InitializeStaticMenu(),Initializerightsidebar();">
<!--    작성자 : 윤석훈, 박주완
		작성일 : 2020-01-14
		내용 : 좌측 메뉴바 -->
        <aside class="sidebar" style="line-height:15px;">
            <div class="sidebar-content">
                <p onclick="location.href='selectList.bo'" style="cursor: pointer;">공지사항</p>
                <br>
                <p onclick="location.href='QnAlist.html'" style="cursor: pointer;">Q & A</p>
                <br>
                <p onclick="location.href=''" style="cursor: pointer;">둘러보기</p>
                <br>
                <p onclick="location.href='/6Days/view/Profile.html'" style="cursor: pointer;">내 프로필</p>

                <input type="text" list="menusearch" style="position:absolute; top:300px; left:-11px; width:185px; height:22px; margin-top: 5.5%; " placeholder="검색 내용을 입력하세요.">
                <datalist id="menusearch" style="width:1000px;">
                    <option>프로필수정</option>
                    <option>프로필수정</option>
                    <option>프로필수정</option>
                    <option>프로필수정</option>
                </datalist>
                <span><img src="/6Days/resources/images/search.png" style="position:absolute; width:28px; height:28px; top:300px; right:-28px; margin-top: 5.5%;"></span>
                
                <div style="height:28%;"></div>

                <span id="footer" style="font-size:12px; text-align:left;">
                CopyRight Six Days Company<br>
                박주완    윤석훈    신경섭<br>
                    이서현    신지영<br>
                Tel : 010-1234-5678 <br>
                Email : ABCD @ gmail.com
                </span>
                <p onclick="location.href='/6Days/views/admin/user_manage.jsp'" style="cursor: pointer;">관리자 화면</p>
            </div>
            <button><span class="sidebar-btn">메뉴</span></button>
        </aside>

</body>
</html>