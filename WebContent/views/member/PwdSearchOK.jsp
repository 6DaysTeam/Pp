<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기 결과</title>

    <script src="/6Days/resources/js/jquery-3.4.1.min.js"></script>
    <script src="/6Days/resources/js/jquery-ui-1.11.4.custom.min.js"></script>
    <script src="/6Days/resources/js/IdPwdSearch.js"></script>
    <link rel="stylesheet" href="/6Days/resources/css/IdPwdSearch.css">

    <style>
        #btnRed{
            background: rgb(15, 76, 129);
            border-color: rgb(15, 76, 129);
        }
    </style>


</head>

   <body onload="InitializeStaticMenu(),Initializerightsidebar();">
<!-- 작성자 : 국영미
   * 작성일 : 2020.01.14
   * 내용 : 비밀번호 찾기 결과
   * 수정일 : 
-->
        
<!-- 비밀번호 찾기 성공 전체 div-->
<div id="idContents" class="center">
    <form action="" method="POST" onsubmit="return validate();">
        <div id="searchWrap">
            <div class="contentsWrap">
                <!-- 아이디 비밀번호 찾기 title tap -->
                <div class="searchTab">
                    <ul>
                        <li class><a href="/6Days/views/member/IdSearch.jsp">아이디 찾기</a></li>
                        <li class="current"><a href="/6Days/views/member/PwdSearch.jsp">비밀번호 찾기</a></li>
                    </ul>
                </div>
            <div class="idsearchWrap">        
            <div class="resultBox">
                <h4>비밀번호 찾기 결과</h4>
            <ul>
                <li>
                    <!-- 찾은 비밀번호 결과 보여주기 -->
                    <div class="radioStyle">
                        <!-- 전체확인 리스트를 위한 라디오 버튼 -> 클릭시 전체확인 allResult 보여줌-->
                        <input type="radio" name="idlist" id="radioId" value="">
                        <!-- 찾은 비밀번호 -->
                        <label for="id">tes****</label>
                    </div>
                    <!-- 가입일 -->
                    <div class="date">2020-01-14 가입</div>
                </li>
            </ul>
            <span class="notiText">개인정보 보호를 위해 비밀번호 뒷자리를 ***로 표시합니다.</span>
            <!-- 로그인 버튼 -> 클릭시 로그인 화면으로 이동 -->
            <div class="btnArea">
                <button type="button" class="btnRed" id="btnRed" onclick="openerLogin();">로그인</button>
            </div>
        </div>
        <!-- 라디오버튼 클릭시 펼쳐짐 -->    
        <div class="allResult">
                <h4>비밀번호 전체 확인하기</h4>
                <ul>

                <li>
                    <span>등록된 이메일로 확인</span>
                    <p class="myinfo">
                        tes******@test.com
                        <button type="button" onclick="location.href='PwdEmailSend.html'">비밀번호 발송</button>
                    </p>
                </li>
            </ul>
                <span class="blNotiText">* 회원정보 상에 등록되어있는 이메일로 전체 비밀번호 정보가 발송됩니다.</span>
            </div>
        </div>
    </div>
    </form>
</div>
</body>
</html>