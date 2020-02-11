<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/6Days/resources/css/Register.css">
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	<script src="/6Days/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
    <div id="top">
        <img src="/6Days/resources/images/logoletter.png" style="padding-top: 7%; width: 170px; height: 50px;">
    </div>
    <form id="joinForm" action="${pageContext.request.contextPath}/mInsert.me" method="post">
    <div id="registerpage">
        <div id="idregister">
            <label>아이디</label><br><br>
            <input type="text" id="idok" class="redata" name="uesrId" placeholder="아이디"/>
            <input type="button" id="idokbtn" onSubmit="return false" value="중복확인">
            <br><br>
        </div>

        
        <div id="pwd">
            <label style="font-family: 'Jua', sans-serif;" >비밀번호</label><br><br>
            <input type="password" name="password" class="redata" placeholder="비밀번호(8~16자)"/><br><br>
            <input type="password" class="redata" placeholder="비밀번호 재입력"/><br><br>
        </div>
        <div id="nicname">
            <label>닉네임</label><br><br>
            <input type="text" name="userName" class="redata" placeholder="닉네임을 입력해주세요."/><br><br>
        </div>
        <div id="email">
            <label>이메일</label><br><br>
            <input type="text" class="emaildata" name="email" placeholder="이메일을 입력해주세요."/>
            <select id="emailselect">
                <option value="naver">@naver.com</option>
                <option value="gmail">@gmail.com</option>
                <option value="daum">@daum.net</option>
                <option value="chol">@chol.com</option>
                <option value="yahoo">@yahoo.com</option>
                <option value="nate">@nate.com</option>
            </select>
            <br><br>
        </div>
        <div id="phone">
            <label>전화번호</label><br><br>
            <input type="text" id="auth" class="redata" name="phone" placeholder="전화번호"/>
            <button id="authbtn">인증번호 받기</button><br><br>
            <input type="text" id="authtext" placeholder="인증번호를 입력하세요.">&nbsp&nbsp<button style="float:none; cursor: pointer; background: rgb(15, 76, 129); 
    color:white; border: 0px; width: 80px; height: 30px;">확인</button>
        </div>
        <div id="gender">
            <br>
            <label>성별</label><br><br>
            <input type="radio" name="gender" id="man" value="M"/><label for="man" style="font-size:12px">남자</label>&nbsp;
            <input type="radio" name="gender" id="woman" value="F"/><label for="woman" style="font-size:12px">여자</label>
        </div><br><br>
        <div id="introduction">
            <label>소개</label><br><br>
            <input type="text" class="redata" name="comment" placeholder="소개를 입력해주세요"/><br><br><br>
        </div>
        <div id="rebtn">
            <button id="registerbtn" onclick="return insertMember();">가입</button>
        </div>
    </div>
    </form>
    
    <script>
	$('#idokbtn').click(function(){
		$.ajax({
			url:"/6Days/user.rc",
			type:"get",
			data:{
				name:$('#idok').val()
			},
			success:function(data) {
				console.log("전송 성공");
			},
			error:function(){
				console.log("전송 실패");
			}

		});
	});
	</script>
    <div id="bottom"></div>
</body>
</html>