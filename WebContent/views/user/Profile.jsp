<%@page import="javax.crypto.interfaces.PBEKey"%>
<%@page import="com.sixdays.p_board.model.vo.p_Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.sixdays.userMember.model.vo.userMember" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 사진 게시글 리스트 가져오기
    ArrayList<p_Board> list = (ArrayList<p_Board>)request.getAttribute("list"); 
	p_Board pba = new p_Board();
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>profile</title>
   <%@ include file="/views/common/header.jsp" %>
   <%@ include file="/views/common/left-sidebar.jsp" %>
   <%@ include file="/views/common/right-sidebar.jsp" %>
   
   
        <script src="/6Days/resources/js/Profile.js"></script>
        <link rel="stylesheet" href="/6Days/resources/css/profile.css">


    
    <body>

<input type="hidden" id="userid" name="userid" value="<%=m.getUserId()%>">

<!--    작성자 : 박주완
        작성일 : 2020-01-09
        내용 : 유저 프로필 화면 -->
    <div id="container">
        <div id="profile" class="profile">
            <div id="show-profile">
              <% if(m.getProback() != null) {%>
                <img id="profilebackgound" src="/6Days/resources/probackUploadFiles/<%= m.getProback() %>" style="width: 850px; height: 280px;">
                <%}else{ %>
                <img id="profilebackgound" src="/6Days/resources/probackUploadFiles/proback.png" style="width: 850px; height: 280px;">
               <%} %>

                <div id="profileimgbox">
				<% if(m.getProimg() != null) {%>
				     <img id="profileimg" name="profileimg" src="/6Days/resources/proimgUploadFiles/<%= m.getProimg() %>" onclick="profileModalOpen();" >
				<%}else{ %>
					 <img id="profileimg" name="profileimg" src="/6Days/resources/proimgUploadFiles/proimg.png" onclick="profileModalOpen();" >
				<%} %>
                </div>

                    <div id="profilename">
                        <label id="name" class="profile"><%=m.getUserName() %></label>
                        <hr style="margin-top: -5px; margin-bottom: 5px;">
                        <label id="memo" class="profile"><%=m.getMycomment() %></label>
                    </div>
                    <div id="profileright">
                        <button id="profileSetbtn" class="profile" onclick="profileModalOpen();" >프로필 편집</button><br>
                        <button id="settingbtn" class="profile" onclick="settingbtn();">설정</button><br><br>
                        <label id="postCount" class="profile">게시물</label>
                        <span>5</span><span>   </span><br>
                        <label id="followers" class="profile">팔로워</label>
                        <span>2.6k</span><span>   </span><br>
                        <label id="following" class="profile">팔로우</label>
                        <span>104</span><span>   </span><br>    
                    </div>
                </div>
                
                
            </div>
            
            
            
            <hr id="hr1">
            
<!--    작성자 : 박주완,이서현
        작성일 : 2020-01-09
        내용 : 유저 프로필 화면
	수정일 : 2020-02-19   
-->			
            <div id="postlist">
                <!-- <table align="center">
                    <tr>
                        <td><img class="post" src="/6Days/resources/maruta/dummy8.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy7.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy5.JPG" onclick="modalOpen();"></td>
                    </tr>
                    <tr>
                        <td><img class="post" src="/6Days/resources/maruta/dummy4.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy6.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy3.JPG" onclick="modalOpen();"></td>
                    </tr>
                    <tr>
                        <td><img class="post" src="/6Days/resources/maruta/dummy2.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy1.JPG" onclick="modalOpen();"></td>
                    </tr>
                </table> -->
                <table align="center" style="width: 900px;">
                <tr>
                <% for(p_Board pb : list) {
                	if(pb.getPhoto1() != null){
                	
                	%>
				
				<td style="display: inline-block; float:left; margin-left:2%">		
						<input type="hidden" value="<%= pb.getPbno()%>">
						<img src="/6Days/resources/pboardUploadFiles/<%=pb.getPhoto1() %>" 
						     width="260px" height="260px" style="margin:7px" onclick="modalOpen();">
				
				</td>
				<% 
                	}
                	} %>
				</tr>
            	</table>
        </div>
 		<%-- <script>
 			$(function(){
 				$('.thumb-list').click(function(){
					var bno = $(this).children().children().eq(0).val();
					location.href = "<%=request.getContextPath()%>/selectOne.tn?bno=" + bno;
				});
 			})
 		</script> --%>


<!--    작성자 : 박주완
        작성일 : 2020-01-09
        내용 : 유저 게시물 클릭시 확대창 -->
        <div id="modal">
            <div id="modalcontent">
                <button id="closebtn" onclick="modalclose();">X</button>
                <div id="modalpost">
                    <div id="modalimg" class="slideshow-container" >
                        <div class="mySlides fade" style="display: block;">
                            <div class="numbertext">1 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy8.JPG" >
                        </div>
                        
                        <div class="mySlides fade">
                            <div class="numbertext">2 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy7.JPG" >
                        </div>
                        
                        <div class="mySlides fade">
                            <div class="numbertext">3 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy6.JPG" >
                        </div>
            
                        <div class="mySlides fade">
                            <div class="numbertext">4 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy5.JPG" >
                        </div>

                        <div class="mySlides fade">
                            <div class="numbertext">5 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy4.JPG" >
                        </div>

                        <div class="mySlides fade">
                            <div class="numbertext">6 / 6</div>
                            <img class="contentimgs" src="/6Days/resources/maruta/dummy3.JPG" >
                        </div>
                        <a class="prev" onclick="plusSlides(-1);">&#10094;</a>
                        <a class="next" onclick="plusSlides(1);">&#10095;</a>
                        
                        
                        
                        <div id="dotbox" style="text-align:center">
                            <span class="dot" onclick="currentSlide(1);"></span> 
                            <span class="dot" onclick="currentSlide(2);"></span> 
                            <span class="dot" onclick="currentSlide(3);"></span> 
                            <span class="dot" onclick="currentSlide(4);"></span>
                            <span class="dot" onclick="currentSlide(5);"></span> 
                            <span class="dot" onclick="currentSlide(6);"></span> 
                        </div>      
                        
                                    
                   </div>
            
               </div>





<!-- 	작성자 : 박주완
		수정알 : 2020-02-18
		내용 : 게시물 부분 수정 -->
<!-- 	***************************** 컨탠츠 클릭시 나타나는 모달창 영역 ****************************** -->

                    <div id="coments">
                        <div id="userprofilshow">
                        	<div id="profileIMG2">
								<% if(m.getProimg() != null) {%>
								     <img id="profileimg2" name="profileimg" src="/6Days/resources/proimgUploadFiles/<%= m.getProimg() %>" onclick="profileModalOpen();" >
								<%}else{ %>
									 <img id="profileimg2" name="profileimg" src="/6Days/resources/proimgUploadFiles/proimg.png" onclick="profileModalOpen();" >
								<%} %>
								<label id="name2" class="profile"><%=m.getUserName() %></label>
							</div>
                        <div id="innercoment">
                            <div id="ment" class="coments">게시글내용들어갈 자리. 님덜 부산가면 요트 꼭타셈 ㄹㅇ 개꿀잼 인생의 추억 짱짱</div>
                        </div>
                        <div id="tagbox">
                            <div id="tag" class="tag">태그 들어갈 자리. #광안리#부산#해운대#데이트#1주년#난멋져#뇌바사삭</div>
                        </div>
                        <div><hr style="margin: 5px;">
                            <button style="font-size: 15px; float: left; border: none; border-radius: 10px; background-color: pink; margin-top: 4px; margin-right: 6px;">좋아요</button>
                            <p style="font-size: 12px; margin-left: 10px;">sakun 님외 2.1k명이 좋아합니다.</p>
                            <p style="font-size: 10px; margin-left: 10px;">1월 13일</p>          
                        </div><hr style="margin: 5px;">
                        <div id="comentarea">
                            <input type="text" id="comentinput" style="border-radius: 5px; border: 0.5px solid lightgray; background-color: whitesmoke; padding: 2px;">
                            <button onclick="" id="comentsend" style="margin-top: -5px; font-size: 15px; background-color: royalblue; border: none; border-radius: 5px; height: 28px;">게시</button>
                        </div>
                    </div>
                    
                </div>
            </div>
         </div>
 <!-- 	***************************** 모달창 영역 끝 ****************************** -->     
        

<!--    작성자 : 박주완
        작성일 : 2020-01-14
        내용 : 계정설정 및 보안 신고 메뉴화면 (세팅버튼 클릭시) -->
        <div id="setting">
            <div id="settinglist">
                <div>
                    <p class="settingitem" align="center" onclick="location.href='/6Days/views/member/Update.jsp'">개인정보 변경</p>
                    <hr>
                    <p class="settingitem" align="center" onclick="location.href='Pwdupdate.html'">비밀번호 변경</p>
                    <hr>
                    <p class="settingitem" align="center" onclick="PublicScopeModal();">공개 범위 및 보안</p>
                    <hr>
                    <P class="settingitem" align="center">로그인 활동</P>
                    <hr>
                    <p class="settingitem" align="center">문제 신고</p>
                    <hr>
                    <P class="settingitem" align="center">로그아웃</P>
                    <hr>
                    <p class="settingitem" align="center" onclick="settinglistclose();">취소</p>
                </div>
            </div>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-01-16
        내용 : 공개 범위 및 보안 모달창 메뉴화면-->
        <div id="Public_Scope_Modal">
            <div id="Public_scope">
                <div>
                    <p style="font-size: 24px;">공개 범위 설정</p><hr>
                    <input id="public" type="checkbox" class="checkBox">
                    <label for="public">전체공개</label><hr>
                    <input id="followerss" type="checkbox" class="checkBox">
                    <label for="followerss">팔로워만</label><hr>
                    <input id="private" type="checkbox" class="checkBox">
                    <label for="private">비공개</label><hr>
                    <p onclick="PublicScopeModalclose();">닫기</p>
                </div>
            </div>
        </div>


<!--    작성자 : 박주완
        작성일 : 2020-01-14
        내용 : 프로필 설정화면 -->
        <div id="profileModal">
            <div id="profileSet">
                <p style="font-size: 25px;">프로필 편집</p><hr>
                <p onclick="nameSetopen();">닉네임 변경</p><hr>
                <p onclick="comentsetopen();">코멘트 변경</p><hr>
                <p onclick="proImgChange();"style="color: royalblue;" >프로필 사진 바꾸기</p><hr>
                <p onclick="proBackChange();" style="color: royalblue;">프로필 배경 사진 바꾸기</p><hr>
                <form id="proImgDeleteForm" name="proimg" action="/6Days/pimgDelete.me" method="post" enctype="multipart/form-data">
                <p onclick="proImgDelete();" style="color: red;">현재 프로필 사진 삭제</p><hr></form>
                <form id="proBackDeleteForm" name="proback" action="/6Days/pbackDelete.me" method="post" enctype="multipart/form-data">
                <p onclick="proBackDelete();" style="color: red;">현재 프로필 배경 사진 삭제</p><hr></form>
                <p onclick="profileModalClose();">닫기</p>
        </div>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-01-16
        내용 : 코멘트 변경 모달 화면-->
    <form id="commentupdateForm" action="/6Days/coUpdate.me" method="post">
        <div id="comentSetModal">
            <div id="comentSet">
                <p>변경할 코멘트</p><hr>
                <textarea id="comenttextarea" name="mycomment"></textarea><br>
                <P onclick="comentInput();" style="margin: 8px 0px 8px 0px; color: blue;">변경</P><hr>
                <p onclick="comentsetclose();">닫기</p>
            </div>
        </div>
   </form>
<!--    작성자 : 박주완
        작성일 : 2020-01-16
        내용 : 닉네임 변경 모달 화면-->
    <form id="nameupdateForm" action="/6Days/unUpdate.me" method="post">
        <div id="nameSetModal">
            <div id="nameSet">
                <p>변경할 닉네임</p><hr>
                <input type="text" id="nametextarea" name="userName"><br>
                <P onclick="nameInput();" id="namebtn" style="margin: 8px 0px 8px 0px; color: blue;">변경</P><hr>
                <p onclick="nameSetclose();">닫기</p>
            </div>
        </div>
    </form>
        
<!--    작성자 : 신지영
        작성일 : 2020-02-13
        내용 : 프로필사진 변경 모달 화면-->
    <form id="proImgupdateForm" action="/6Days/proimage.me" method="post"  enctype="multipart/form-data">
      <div id="proImgModal">
         <div id="proImgSet">
            <p>프로필 사진</p>
            <input type="file" id="proimgarea" name="proimg"><br><br>
            <p onclick="proimgInput();" style="margin: 3px 0px 8px 0px; color: blue;">변경</p><hr>
            <p onclick="proimgSetclose();">닫기</p>
         </div>
      </div>
    </form>
    
  <!--   <!--    작성자 : 신지영
        작성일 : 2020-02-16
        내용 : 프로필사진 변경 모달 화면-->
    <form id="proBackupdateForm" action="/6Days/proback.me" method="post"  enctype="multipart/form-data">
      <div id="proBackModal">
         <div id="proBackSet">
            <p>프로필 사진</p>
            <input type="file" id="probackarea" name="proback"><br><br>
            <p onclick="probackInput();" style="margin: 3px 0px 8px 0px; color: blue;">변경</p><hr>
            <p onclick="probackSetclose();">닫기</p>
         </div>
      </div>
    </form>
    
    
    
    
    <script>
    
    /*<!--  작성자 : 박주완
    작성일 : 2020-02-03
    내용 : 사용자 게시물 좌우로 이미지 슬라이드쇼 쿼리문  -->*/
/*     var plusSlides = 1; */
    var slideIndex = 1;


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
//     작성일 : 2020-02-04
//     내용 : 포스트 [...]버튼 클릭시 모달창 온오프 코드-->
        function postModalOpen(){
            var ulr = $(this).attr("src");
            $("#postModal").attr("src",ulr);
            $("#postModal").show();
        }

        function postModalClose(){
            $('#postModal').css("display",'none');
        }

    
    
    
 /*    -----------------------------------------------------------------------     */
    
    
    
    var username = document.getElementById('nametextarea');
    var comment = document.getElementById('comenttextarea');
    var proimage = document.getElementById('proimgarea');
    var proback = document.getElementById('probackarea');

    
    function nameInput(){
       if(username.value != ""){
          document.getElementById("nameupdateForm").submit();
       }else{
          alert("닉네임을 입력해주세요.");        
       }
    }
    
    function comentInput(){
       if(comment.value != ""){
       document.getElementById("commentupdateForm").submit();
       }else if(comment.value == ""){
          comment.value = " ";
       document.getElementById("commentupdateForm").submit();
      
          
       } 
    }
    
    function proimgInput(){
       if(proimage.value != ""){
          document.getElementById("proImgupdateForm").submit();
       }else{
          alert("선택된 사진이 없습니다.");
       }
    }
    function probackInput(){
       if(proback.value != ""){
       document.getElementById("proBackupdateForm").submit();
       }else{
          alert("선택된 사진이 없습니다.");
       }
    }
    function proImgDelete(){
       document.getElementById("proImgDeleteForm").submit();
    }
    function proBackDelete(){
       document.getElementById("proBackDeleteForm").submit();
    }
    

    </script>
    
</body>
</html>