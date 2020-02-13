<%@page import="com.sixdays.userMember.model.vo.userMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
    
    
<!DOCTYPE html>
<html>
<head>
	<title>Main</title>

	<%@ include file="views/common/header.jsp" %>
	<%@ include file="views/common/left-sidebar.jsp" %>
	<%@ include file="views/common/right-sidebar.jsp" %>
    <link rel="stylesheet" href = "/6Days/resources/css/MainContact.css">
</head>

<body>
                    
<!--    작성자 : 박주완
        작성일 : 2020-01-14
        수정일 : 2020-01-17
        내용 : 메인화면 컨텐츠섹션 수정 -->
        <div id="contentArea">  <!--컨텐츠가 출력될 중앙 영역 (길이값 무한대) -->
            <div id="content">  <!--실제 컨텐츠 각각의 영역 -->
     <label><%= m.getUserId()%></label>
                <div id="userNamebar">  <!--컨텐츠 상단의 유저 프로필사진과 닉네임, 신고버튼 표시 부분-->
                    <img id="showUserProfileImg" src="/6Days/resources/maruta/profileimg.JPG">  <!--유저 프로필 이미지 불러오기-->
                    <p id="showUserName">Juwan_p.193</p>    <!--유저이름, 나중에 쿼리문작성하여 로그인한 계정의 이름 , 프로필사진 불러오기-->
                    <p id="contentSettingbtn" onclick="postModalOpen();">...</p>
                </div>
                <div id="contentMemo">  <!--컨텐츠 이미지 바로 위 컨텐츠 내용 부분-->
                    카페에서는 제발 조용히 통화하고 남에게 피해를 주지 맙시다.
                </div>
                <div id="contentimg" >   <!-- 컨텐츠의 이미지 영역 & css에서 이미지 넣어줌 background-imgage 로  -->
                    <div class="slideshow-container" >
                    <div class="mySlides fade" style="display: block;">
                        <div class="numbertext">1 / 4</div>
                        <img class="contentimgs" src="/6Days/resources/maruta/dummy1.JPG" style="width:100%;">
                    </div>
                    
                    <div class="mySlides fade">
                        <div class="numbertext">2 / 4</div>
                        <img class="contentimgs" src="/6Days/resources/maruta/dummy2.JPG" style="width:100%;">
                    </div>
                    
                    <div class="mySlides fade">
                        <div class="numbertext">3 / 4</div>
                        <img class="contentimgs" src="/6Days/resources/maruta/dummy3.JPG" style="width:100%;">
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext">4 / 4</div>
                        <img class="contentimgs" src="/6Days/resources/maruta/dummy4.JPG" style="width:100%;">
                    </div>
                    
                    <a class="prev" onclick="plusSlides(-1);">&#10094;</a>
                    <a class="next" onclick="plusSlides(1);">&#10095;</a>

                    </div>

                    <div style="text-align:center">
                        <span class="dot" onclick="currentSlide(1);"></span> 
                        <span class="dot" onclick="currentSlide(2);"></span> 
                        <span class="dot" onclick="currentSlide(3);"></span> 
                        <span class="dot" onclick="currentSlide(4);"></span> 
                    </div>                  
                </div>


                <div id="contentMenu"> <!-- 좋아요버튼, 좋아요수, 글쓴시간 등을 표현할 영역  -->
                    <img src="/6Days/resources/icon/whitesmile.png" style="width: 50px; height: 50px; float: left; margin: 0; margin-top: -2%; margin-left: -1%;" id="whitesmile" onclick="like();" >
                    <div style="font-size: 16px; color: gray; float: left; margin: 0; margin-left: 10px;">Juwan 님 외 '</div>
                    <div style="font-size: 16px; color: black; float: left; margin: 0;">214</div>
                    <div style="font-size: 16px; color: gray; float: left; margin: 0;"> '명이 Like합니다.</div>
                    <div style="font-size: 14px; color: gray; float: right; margin: 0; margin-right: 15px;"> 댓글 12</div>

                </div>
                <div id="contentComent"">
                    nobie : 여기에 댓글을 작성할 겁니다<br>
                    nobie : 이런식으로 말이죠.<br>
                    nobie : 사실 무슨 태그로 만들지 못정했어요<br>
                    nobie : 하지만 이런건 대충해도 아무도 모르더라고요<br>
                    nobie : 왜일까요?? 누가 이걸 확인하고 무슨태그 쓸지 정해주면 좋겠어요<br>
                    nobie : 태그안에 대댓글 쓰기 버튼이랑 삭제 버튼같은걸 넣어야하거든요.<br>
                    nobie : 아 그리고 메인 컨텐츠에서 사용할 폰트 구함@@@@@@@@추천좀.<br>
                    <p style="font-size: 13px; color: gray; float: left;">1시간전</p>
                </div>
                <hr style="margin: 5px;">
                    <input id="sendcoment" type="text" placeholder="댓글달기..." style="width: 85%;">
                    <input type="button" style="width: 6%; height: 10%; background-color: white; border: white; font-family: 'Jua', sans-serif; font-size: 15pt; outline:0;"  value="확인">
            </div>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-02-04
        내용 : 포스트 [...] 버튼 클릭시 모달창 오픈 -->
        <div id="postModal">
            <div id="postModalSet">
                <p style="color: red;">부적절한 게시물 신고</p><hr>
                <p style="color: red;">팔로우 취소</p><hr>
                <p onclick="postModalClose();">닫기</p>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-01-21
        내용 : 5초마다 변하는 우측 사이드 배너광고창 -->
        <div class="advertising" >
            <img class="advertising" src="resources/images/1.JPG">
        </div>



<!--    작성자 : 이서현
        작성일 : 2020-01-31
        내용 : 클릭시 변하는 스마일아이콘 -->
        <script>

        var slideIndex = 1;
        var result= 1;
        function like(){
            if(result==1){
           document.getElementById("whitesmile").src="/6Days/resources/icon/yellowsmile.png"
                result=2;
        }else if(result==2){
            document.getElementById("whitesmile").src="/6Days/resources/icon/whitesmile.png"
            result=1;
        }
     }
 
// <!--    작성자 : 박주완
//        	 작성일 : 2020-01-23
//        	  내용 : 광고배너-->
	
            var arr = new Array();
            
            arr[0] ="arr1임"
            arr[1] ="arr2임"
            arr[2] ="arr3임"
            arr[3] = "<a href='http:// 이동할 광고주 사이트'target = _new><class='advertising' src='/6Days/resources/advertising/4.JPG></a>;"
            // arr[4] = "<a href='http:// 이동할 광고주 사이트'target = _new><class='advertising' src='/6Days/resources/advertising/5.JPG></a>;"
            var num = 0; /* 바꿀 화면 넘버 기본값*/

            //window.onload = function(){ /*윈도우 온로드로 시간초 경과 체크*/
            //    setInterval(update(),5000);
           // }

         /*    function update(){
                num++;
                console.log(arr[num]);                
                if(num == arr.length) num=0;
            } */


/*<!--  작성자 : 박주완
        작성일 : 2020-02-03
        내용 : 사용자 게시물 좌우로 이미지 슬라이드쇼 쿼리문  -->*/

        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            if (n > slides.length) {slideIndex = 1}    
            if (n < 1) {slideIndex = slides.length}
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";  
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";  
            dots[slideIndex-1].className += " active";
        }


// <!--    작성자 : 박주완
//         작성일 : 2020-02-04
//         내용 : 포스트 [...]버튼 클릭시 모달창 온오프 코드-->
            function postModalOpen(){
                var ulr = $(this).attr("src");
                $("#postModal").attr("src",ulr);
                $("#postModal").show();
            }

            function postModalClose(){
                $('#postModal').css("display",'none');
            }

        </script>


</body>
</html>