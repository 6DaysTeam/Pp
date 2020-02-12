<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--     <% 
    boolean result = (boolean)request.getAttribute("result");
    	String userId = (String)request.getAttribute("userId");
    %> --%>
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
        <img src="/6Days/resources/images/logoletter.png" onclick="location.href='/6Days/login.jsp'" style="padding-top: 7%; width: 170px; height: 50px;">
    </div>
    <form id="joinForm" action="${pageContext.request.contextPath}/mInsert.me" method="post">
         <div id="registerpage">
        <div id="idregister">
            <label>아이디</label><br><br>
          
            <input type="text" id="idok" class="redata" name="uesrId" placeholder="아이디" onchange="change();"/>
             <input type="button" id="idokbtn" onSubmit="return false" value="중복확인">
            <br><br>
        </div>

        <div id="pwd">
		 <label >비밀번호</label><br><br>
            <input type="password" id="pwd1" name="password2" class="redata" placeholder="비밀번호(8~16자)"/><br><br>
            <input type="password" id="pwd2" name="password" class="redata" placeholder="비밀번호 재입력" onchange="change();"/><br>
            <label id="pwdresult" style="font-size:xx-small;"></label><br><br>
            <label>닉네임</label><br><br>
            <input type="text" id="nickname" name="userName" class="redata" placeholder="닉네임을 입력해주세요." onchange="change();"/><br><br>
        </div>
          <div id="email">
            <label>이메일</label><br><br>
            <input type="text" id="email1" class="redata" name="email" placeholder="이메일을 입력해주세요." onchange="change();"/>
            <br><br>
        </div>
        <div id="phone">
            <label>전화번호</label><br><br>
            <input type="text" id="auth" class="redata" name="phone" placeholder="전화번호" maxlength="13" onchange="change();"/>

            <button id="authbtn">인증번호 받기</button><br><br>
            <input type="text" id="authtext" placeholder="인증번호를 입력하세요.">&nbsp&nbsp<button style="float:none; cursor: pointer; background: rgb(15, 76, 129); 
    color:white; border: 0px; width: 80px; height: 30px;">확인</button>
        </div>
        <div id="gender">
            <br>
            <label>성별</label><br><br>
            <input type="radio" name="gender" id="man" value="M" onchange="change();"/><label for="man" style="font-size:12px" >남자</label>&nbsp;
            <input type="radio" name="gender" id="woman" value="F" onchange="change();"/><label for="woman" style="font-size:12px">여자</label>
        </div><br><br>
        <div id="introduction">
            <label>소개</label><br><br>
            <input type="text" class="redata" name="comment" placeholder="소개를 입력해주세요"/><br><br><br>
        </div>
        <div id="rebtn">
            <button id="registerbtn" onclick="return insertMember();" >가입</button>
        </div>
	</div>
    </form>
    <script>
    
    
    
    var result1 = document.getElementById("idok");
    var result2 = document.getElementById("pwd2");
    var result3 = document.getElementById("nickname");
    var result4 = document.getElementById("email1");
    var result5 = document.getElementById("auth");
    var result6 = document.getElementById("man");
    var result7 = document.getElementById("woman");
    
	var button = document.getElementById('registerbtn');
    
	
	window.onload = function(){
		
		
		button.disabled = true;
		button.style.opacity = 0.2;
		button.style.cursor = 'not-allowed';
	
	}
	
	function change(){
		
		if(result1.value != "" && result2.value != "" && result3.value != "" && result4.value != "" && result5.value != "" && (result6.checked || result7.checked) )
		{
			button.disabled = false;
			button.style.opacity = 1;
			button.style.cursor = 'pointer';
	
		}else{
			button.disabled = true;
			button.style.opacity = 0.2;
			button.style.cursor = 'not-allowed';
		}

	
	}

    
    </script>
    
    <script>
	$('#idokbtn').click(function(){
		
		var user_id = $('#idok').val();
		$.ajax({
			url:"/6Days/user.rc",
			type:"get",
			data:{
				name:$('#idok').val()
			},
			success : function(data) {
				console.log("중복체크 : " + data);							
				
				if (data == 1) {
					
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
					$("#registerbtn").attr("disabled", true);
				} else if(data == 0 && user_id!=""){
					
					$("#id_check").text("사용 가능한  아이디입니다 :p");
					$("#id_check").css("color", "green");
					$("#registerbtn").attr("disabled", false);
					
				} else if(user_id == ""){
					
					$('#id_check').text('아이디를 입력해주세요 :)');
					$('#id_check').css('color', 'red');
					$("#registerbtn").attr("disabled", true);				
						
					}
					
				
			}, error : function() {
					console.log("실패");
			}
		});
		});
</script>
	
	<script>
    $(function(){
        $('#pwd2').change(function(){
            if($('#pwd1').val() == $(this).val()){
                $('#pwdresult').html("");
            }else{
                $('#pwdresult').html("비밀번호 확인 값이 일치하지 않습니다.").css('color','red');
                $('#pwd2').val('');
                $(this).select();
            }
        });      
    });
    </script>
    <script>
        $('#auth').keydown(function(event) {
        var key = event.charCode || event.keyCode || 0;
        $text = $(this);
        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3) {
                $text.val($text.val() + '-');
            }
            if ($text.val().length === 8) {
                $text.val($text.val() + '-');
            }
        }
     
        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
    });
    </script>
    <div id="bottom"></div>
</body>
</html>