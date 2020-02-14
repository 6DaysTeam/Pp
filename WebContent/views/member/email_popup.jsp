<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>

</head>
<body style="font-family: 'Jua', sans-serif; background-color: whitesmoke;">

 <!-- 팝업창 만들기 -->

    <h1><center>인증번호 확인</center></h1>

   <center>
    <input type="text" id="email1" style="width: 150px; height: 30px;">
    <input type="submit" value="확인" onclick="confirm();" 
            style="width: 70px; height: 40px; background-color: whitesmoke; border: none;
            font-size: 20px; font-family: 'Jua', sans-serif;" >
    </center>
    
    <br><br>

   
    <script>
        function confirm(){
           var check= document.getElementById("email1").value; //text값 불러오기 
           var temp = "${temp}"; 
           
           var reult = 0;  //0이면 미완료, 1이면 완료
           
           if(temp == check){
              alert("이메일 인증 완료 ! ");
              result=1;
              window.close();
           }else{
              alert("인증번호 다시 입력 ");
              result=0;
           }
           
           
           <a href="Register.jsp?name=result " >
           }
    </script>

</body>
</html>