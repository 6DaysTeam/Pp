<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>아이디 찾기</title>

    <script src="/6Days/resources/js/jquery-3.4.1.min.js"></script>
    <script src="/6Days/resources/js/jquery-ui-1.11.4.custom.min.js"></script>
    <script src="/6Days/resources/js/IdPwdSearch.js"></script>
    <link rel="stylesheet" href="/6Days/resources/css/IdPwdSearch.css">

</head>
    <style>
    #idPhoneSearch, #idEmailSearch{
        background: rgb(15, 76, 129);
        border-color: rgb(15, 76, 129);
    }
    </style>

   <body>

<!-- 작성자 : 국영미
   * 작성일 : 2020.01.14
   * 내용 : 아이디 찾기
   * 수정일 : 
-->
<!-- 아이디 찾기 전체 div-->
<div id="idContents" class="center">
    <!-- <form action="" method="POST" onsubmit="return validate();"> -->
        <div id="searchWrap">
            <div class="contentsWrap">
                <!-- 아이디 비밀번호 찾기 title tap -->
                <div class="searchTab">
                    <ul>
                        <li class="current"><a href="#">아이디 찾기</a></li>
                        <li class><a href="/6Days/views/member/PwdSearch.jsp">비밀번호 찾기</a></li>
                    </ul>
                </div>
            <div class="idsearchWrap">
            <div class="notiArea">
                <span>아이디를 찾을 방법을 선택해 주세요</span>
            </div>
            <div class="searchType">
                <ul>
                    <!-- 등록된 휴대폰 번호로 찾기 -->
                    <li class="typeList">
                        <div class="title" id="titlePhone">등록된 휴대폰 번호로 찾기</div>
                        <!-- 등록된 휴대폰 번호로 찾기 입력 부분 // 클릭시 펼쳐짐 -->
                        <div class="inputEnter" id="divPhone">
                            <div class="inputBox">
                                <div class="styleInut">
                                    <!-- 휴대폰 번호 입력 받기 inputBox -->
                                    <input id="inputPhone" name="inputPh" type="text" class="iInput"
                                           placeholder="휴대폰번호 (-없이 입력)">
                                        <!-- inputBox에 입력받은 값 리셋 버튼 -->
                                        <span id="inputPhoneClear" class="delBtn" style="display: none;"></span>
                                        <!-- 에러 메세지 -->
                                        <p class="error" id="errorPhone" style="display: none;"></p>
                                </div>
                            </div>
                            <!-- 휴대폰 번호로 찾기 확인 버튼 -->
                            <div class="btnArea">
                                <button type="submit" id="idPhoneSearch" class="btnRed" onclick="location.href='IdSearchOk.html'">확인</button>
                            </div>
                        </div>
                    </li>
                    <!-- 등록된 이메일로 찾기 -->
                    <li class="typeList">
                        <div class="title" id="titleEmail">등록된 이메일로 찾기</div>
                        <!-- 등록된 이메일로 찾기 입력 부분 // 클릭시 펼쳐짐 -->
                        <div class="inputEnter" id="divEmail">
                            <div class="inputBox">
                                <div class="styleInut">
                                    <!-- 이메일 입력 받기 inputBox -->
                                    <input name="inputEmail" id="inputEmail" type="text"
                                        class="eInput" placeholder="이메일">
                                    <!-- inputBox에 입력받은 값 리셋 버튼 -->
                                    <span id="inputEmailClear" class="delBtn" style="display: none;"></span>
                                    <!-- 이메일 선택 selectBox -->
                                    <!-- <div class="customSelect">
                                        <select class="newSelect" name="memEmail2" id="memEmail2" onchange="chkMemEmail();">
                                            <option value="etc">직접입력</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="chol.com">chol.com</option>
                                            <option value="hanmail.net">hanmail.net</option>
                                            <option value="empal.com">empal.com</option>
                                            <option value="freechal.com">freechal.com</option>
                                            <option value="hanafos.com">hanafos.com</option>
                                            <option value="hanmail.net">hanmail.net</option>
                                            <option value="hanmir.com">hanmir.com</option>
                                            <option value="hotmail.com">hotmail.com</option>
                                            <option value="korea.com">korea.com</option>
                                            <option value="nate.com">nate.com</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                                        </select>
                                        <div class="newSelect">직접입력</div>
                                    </div> -->
                                    <!-- 에러 메시지 -->
                                    <p class="error" id="errorEmail" style="display: none;"></p>
                                </div>
                            </div>
                                <!-- 이메일로 찾기 확인 버튼 -->
                                <div class="btnArea">
                                    <button id="idEmailSearch" class="btnRed">확인</button>
                                </div> 
                            </div>
                        </li>   
                    </ul>
                </div>
            </div>
        </div>
    <!-- </form> -->
</div>
</body>
</html>