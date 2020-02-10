<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>비밀번호 찾기</title>
    
    <script src="/6Days/resources/js/IdPwdSearch.js"></script>
    <link rel="stylesheet" href="/6Days/resources/css/IdPwdSearch.css">
    
    <style>
        #idPhoneSearch, #idEmailSearch{
            background: rgb(15, 76, 129);
            border-color: rgb(15, 76, 129);
        }
    </style>
</head>

   <body onload="InitializeStaticMenu(),Initializerightsidebar();">
<!-- 작성자 : 국영미, 박주완
   * 작성일 : 2020.01.14
   * 내용 : 비밀번호 찾기
   * 수정일 : 2020.02.10
-->
        
<!-- 비밀번호 찾기 전제 div-->
<div id="idContents" class="center">
    <!-- <form action="" method="POST" onsubmit="return validate();"> -->
        <div id="searchWrap">
            <div class="contentsWrap">
                <!-- 아이디 비밀번호 찾기 title tap -->
                <div class="searchTab">
                    <ul>
                        <li class><a href="/6Days/views/member/IdSearch.jsp">아이디 찾기</a></li>
                        <li class="current"><a href="#">비밀번호 찾기</a></li>
                    </ul>
                </div>
            <div class="idsearchWrap">        
            <div class="notiArea">
                <span>아이디를 찾을 방법을 선택해 주세요</span>
            </div>
            <div class="searchType">
                <ul>
                    <!-- 등록된 아이디로 찾기 -->
                    <li class="typeList">
                        <div class="title" id="titleID">등록된 아이디로 찾기</div>
                        <!-- 등록된 아이디로 찾기 입력 부분 // 클릭시 펼쳐짐 -->
                        <div class="inputEnter" id="divPhone">
                            <div class="inputBox">
                                <div class="styleInut">
                                    <!-- 아이디 입력 받기 inputBox -->
                                    <input id="inputPhone" name="inputPh" type="text" class="iInput"
                                           placeholder="아이디입력">
                                        <!-- inputBox에 입력받은 값 리셋 버튼 -->
                                        <span id="inputPhoneClear" class="delBtn" style="display: none;"></span>
                                        <!-- 에러 메세지 -->
                                        <p class="error" id="errorPhone" style="display: none;"></p>
                                </div>
                            </div>
                            <!-- 휴대폰 번호로 찾기 확인 버튼 -->
                            <div class="btnArea">
                                <button type="submit" id="idPhoneSearch" class="btnRed" onclick="location.href='PwdSearchOk.html'">확인</button>
                            </div>
                        </div>
                    </li>
                    <!-- 등록된 이메일로 찾기 -->
                    <li class="typeList">

                        </li>   
                    </ul>
                </div>
            </div>
        </div>
    <!-- </form> -->
</div>
</body>
</html>