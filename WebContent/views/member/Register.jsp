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
          
            <input type="text" id="idok" class="redata" name="userId" placeholder="아이디(4~12자 영문 포함)" onchange="change(); idcheck();"/>
             <input type="button" id="idokbtn" onSubmit="return false" value="중복확인">
            <br><br>
        </div>

        <div id="pwd">
		 <label >비밀번호</label><br><br>
            <input type="password" id="pwd1" name="password2" class="redata" placeholder="비밀번호(8~16자)" onchange="pwdCheck();"/><br><br>
            <input type="password" id="pwd2" name="password" class="redata" placeholder="비밀번호 재입력" onchange="change();"/><br>
            <label id="pwdresult" style="font-size:xx-small;"></label><br><br>
            <label>닉네임</label><br><br>
            <input type="text" id="nickname" name="userName" class="redata" placeholder="닉네임을 입력해주세요." onchange="change(); "/><br><br>
        </div>
          <div id="email">
            <label>이메일</label><br><br>
            <input type="text" id="email1" class="redata" name="email" placeholder="이메일을 입력해주세요." onchange="change(); emailCheck();"/>
            <br><br>
        </div>
        <div id="phone">
            <label>전화번호</label><br><br>
            <input type="text" id="auth" class="redata" name="phone" placeholder="전화번호" maxlength="13" onchange="change(); phoneCheck();"/>

            <button id="authbtn" onclick="return test();">인증번호 받기</button><br><br>
            <input type="text" id="authtext" placeholder="인증번호를 입력하세요.">&nbsp&nbsp<button style="float:none; cursor: pointer; background: rgb(15, 76, 129); 
    color:white; border: 0px; width: 80px; height: 30px;" >확인</button>
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
    
    var idCheck = 0; //아이디 중복확인
    
    var result1 = document.getElementById("idok");
    var result2 = document.getElementById("pwd2");
    var result3 = document.getElementById("nickname");
    var result4 = document.getElementById("email1");
    var result5 = document.getElementById("auth");
    var result6 = document.getElementById("man");
    var result7 = document.getElementById("woman");
    
	var button = document.getElementById('registerbtn'); //값이 입력되지 않으면 안보이고 클릭되지 않게 로직 처리
    
	
	window.onload = function(){ //초기버튼 누르지않게 함
		
		
		button.disabled = true;
		button.style.opacity = 0.2;
		button.style.cursor = 'not-allowed';
	
	}
	
	function idcheck(){ //아이디 중복확인 및 유효성 검사
		var re = /^[a-zA-Z0-9]{4,12}$/;
		var id = document.getElementById("idok");
		
		if(!re.test(id.value)){
			alert("아이디를 다시 입력해주세요.");
			id.focus();
		}
		idCheck = 0;
	}
	
	
	function CheckEmail(str) //이메일 확인
	{                                                 
	     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	     if(!reg_email.test(str)) {                            
	          return false;         
	     }                            
	     else {                       
	          return true;         
	     }                            

	     
	} 
	
	function emailCheck(){ //이메일 유효성 검사
		var obEmail = document.getElementById("email1"); //이메일 확인
		if (!obEmail.value) {             
			alert("이메일을 입력하세요!");
			obEmail.focus();	
			return false;
		}               

		else   {          
			if(!CheckEmail(obEmail.value))	{
				alert("이메일 형식이 잘못되었습니다");
				obEmail.focus();
				return false;

			}                

		}  
	}
	

	
	function pwdCheck(){ //패스워드 유효성 검사
		
	var passRule = /^[A-Za-z0-9]{8,16}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
	
	var pwd = document.getElementById("pwd1");
	
	if(!passRule.test(pwd.value)) {
	    //경고
	 	alert("비밀번호를 다시 입력하세요.");
	    pwd.focus();
	
	  }
	}
	
	function phoneCheck(){ //휴대폰 유효성 검사
		
		var rgEx = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

		
		var phone = document.getElementById("auth");
		
		if(!rgEx.test(phone.value)){
			
			alert("휴대폰 번호를 다시 입력하세요.");
			phone.focus();
		}
	}

                     

	
	function change(){ //값이 들어가있는지 확인
		
		
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
	
    
    
    $("#idokbtn").click(function(){ //아이디 중복확인
    	
		var user_id = $('#idok').val();
		      

		$.ajax({
			url:"/6Days/idDup.me",
			type:"post",
			data:{userId: $('#idok').val()},
			success:function(data){
				
				
				if(data =='ok' && user_id != ""){
					alert('사용 가능한 아이디입니다.');
					idCheck = '1';
					
				}else if(data == 'no'){
					alert('이미 사용중인 아이디입니다.');
					$('#idok').select();
					idCheck = '0';

				}else if(user_id == ""){
					alert('아이디를 입력해주세요.');
					$('#idok').select();
					idCheck = '0';
				}
			},error:function(){
				console.log("Error 입니다.");
			}
		});
	});
    
	function insertMember(){

		
		if(idCheck == '1'){
			alert("회원가입이 완료되었습니다.");
			return true;
		
		}else if(idCheck == '0'){
			alert("아이디 중복확인을 확인해주세요.");
			
			return false;
			
		}
		      
	}
	
	     

</script>
	
	<script>
	
    $(function(){ //비밀번호 일치여부
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
        $('#auth').keydown(function(event) { //비밀번호 체크
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