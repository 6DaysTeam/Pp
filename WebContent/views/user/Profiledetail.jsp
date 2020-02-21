<%@page import="com.sixdays.p_board.model.service.p_BoardService"%>
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

   p_Board pba = (p_Board)request.getAttribute("pb2");

%>

<!DOCTYPE html>
<html lang="ko" >
    <head> 
        <meta charset="UTF-8">
        <title>profile</title>
        
      <%@ include file="/views/common/header.jsp" %>


        <script src="/6Days/resources/js/Profile.js"></script>
        <link rel="stylesheet" href="/6Days/resources/css/profile.css">
      <style type="text/css">
         #top1{
         display: none;
         }
         html{overflow:hidden;}
         
         
      
      </style>

    <body>

<!--    작성자 : 박주완
      수정알 : 2020-02-18
      내용 : 게시물 부분 수정 모달 -->
<!--    ***************************** 컨탠츠 클릭시 나타나는 모달창 영역 ****************************** -->
<!--              개 멍청도 코딩 작성자 박주완 -->
             <% 
             int count = 1;
             
             if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
             && pba.getPhoto4()!=null && pba.getPhoto5()!=null && pba.getPhoto6()!=null){ 
                count = 6;
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()!=null && pba.getPhoto5()!=null && pba.getPhoto6()==null){
                count = 5;
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()!=null && pba.getPhoto5()==null && pba.getPhoto6()==null){
                count = 4;
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
                count = 3;
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()==null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
                count = 2;
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()==null && pba.getPhoto3()==null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
                count = 1;
             }


             %>
      
            <div id="modalcontent">
                <button id="closebtn" onclick="modalclose();">X</button>
                <div id="modalpost">
                    <div id="modalimg" class="slideshow-container" >
                        <div class="mySlides fade" style="display: block;">
                            <div class="numbertext">1 / <%=count %></div>
                            <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto1() %>" >
                        </div>                    

                     <% if(pba.getPhoto2()!=null){ %>
                    <div class="mySlides fade">
                        <div class="numbertext">2 / <%=count %></div>
                        <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto2() %>"  style="width:100%;">
                    </div>
                    <% } %> 
                     <% if(pba.getPhoto3()!=null){ %>
                    <div class="mySlides fade">
                        <div class="numbertext">3 / <%=count %></div>
                        <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto3() %>"  style="width:100%;">
                    </div>
               <% } %>
                <% if(pba.getPhoto4()!=null){ %>
                    <div class="mySlides fade">
                        <div class="numbertext">4 / <%=count %></div>
                        <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto4() %>" style="width:100%;">
                    </div>
                    <% } %>
                    <% if(pba.getPhoto5()!=null){ %>
                    <div class="mySlides fade">
                        <div class="numbertext">5 / <%=count %></div>
                        <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto5() %>" style="width:100%;">
                    </div>
                    <% } %>
                    <% if(pba.getPhoto6()!=null){ %>
                    <div class="mySlides fade">
                        <div class="numbertext">6 / <%=count %></div>
                        <img class="contentimgs" src="/6Days/resources/pboardUploadFiles/<%=pba.getPhoto6() %>" style="width:100%;">
                    </div>
                    <% } %>
                       
                        <a class="prev" onclick="plusSlides(-1);">&#10094;</a>
                        <a class="next" onclick="plusSlides(1);">&#10095;</a>
                        
                        
                        
                        <div id="dotbox" style="text-align:center">
                       
 
<!-- /*              쌉 멍청도식 코드 2 ㅎㅎ */ -->
           <% 
              if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
             && pba.getPhoto4()!=null && pba.getPhoto5()!=null && pba.getPhoto6()!=null){ 
               %><span class="dot" onclick="currentSlide(1);"></span>
              <span class="dot" onclick="currentSlide(2);"></span>
              <span class="dot" onclick="currentSlide(3);"></span>
              <span class="dot" onclick="currentSlide(4);"></span>
              <span class="dot" onclick="currentSlide(5);"></span>
              <span class="dot" onclick="currentSlide(6);"></span><%
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()!=null && pba.getPhoto5()!=null && pba.getPhoto6()==null){
              %><span class="dot" onclick="currentSlide(1);"></span>
             <span class="dot" onclick="currentSlide(2);"></span>
             <span class="dot" onclick="currentSlide(3);"></span>
             <span class="dot" onclick="currentSlide(4);"></span>
             <span class="dot" onclick="currentSlide(5);"></span><%
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()!=null && pba.getPhoto5()==null && pba.getPhoto6()==null){
              %><span class="dot" onclick="currentSlide(1);"></span>
             <span class="dot" onclick="currentSlide(2);"></span>
             <span class="dot" onclick="currentSlide(3);"></span>
             <span class="dot" onclick="currentSlide(4);"></span><%
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()!=null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
              %><span class="dot" onclick="currentSlide(1);"></span>
             <span class="dot" onclick="currentSlide(2);"></span>
             <span class="dot" onclick="currentSlide(3);"></span><%
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()!=null && pba.getPhoto3()==null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
              %><span class="dot" onclick="currentSlide(1);"></span>
             <span class="dot" onclick="currentSlide(2);"></span><%
             }else if(pba.getPhoto1()!=null && pba.getPhoto2()==null && pba.getPhoto3()==null 
                       && pba.getPhoto4()==null && pba.getPhoto5()==null && pba.getPhoto6()==null){
                   %><span class="dot" onclick="currentSlide(1);"></span><%
             }

          if(count >= 7){
                count = 1;
             }
             %>
             <input type="hidden" id="countDot" name="userid4" value="<%=count%>">          
                        </div>      
                        
                                    
                   </div>

            
               </div>






                    <div id="coments">
                        <div id="userprofilshow">
                           <div id="profileIMG2">
                             <img id="profileimg2" name="profileimg" src="/6Days/resources/proimgUploadFiles/<%=pba.getPproimg() %>">
                        <label id="name2" class="profile"><%=pba.getPnickname() %></label>
                     </div>
                        <div id="innercoment">
                            <span id="ment" class="coments"><%=pba.getPcontent() %></span>
                            <span id="tag" class="tag"><%=pba.getHashtag() %></span>
<!--                  *******************************   여기서부터 댓글 들어갈 자리!!   *******************************  -->







<!--                  *******************************   여기서까지 댓글   *******************************  -->
                        </div>

                      <div id="toolsbox"> <!-- 좋아요버튼, 좋아요수, 글쓴시간 등을 표현할 영역  -->
                          <img id="whitesmile"  src="/6Days/resources/icon/whitesmile.png" onclick="like();" >
                          <div id="likerUsersName" >좋아요 </div>
                          <div id="likeCount" ><%=pba.getLike_count() %></div>
                          <div id="likeMent" >개</div>
                          <div id="comentsCount" > 댓글 <%=pba.getPbcomment() %></div>
                          <div id="postmakeDate"><%=pba.getPbdate() %></div>
                      </div>

                        <div id="comentarea">
                            <input type="text" id="comentinput" placeholder="댓글 달기..." >
                            <button onclick="" id="comentsend">게시</button>
                        </div>
                    </div>
                    
                </div>
            </div>

         

 <!--    ***************************** 모달창 영역 끝 ****************************** -->     
   <script >
          /*<!--  작성자 : 박주완
          작성일 : 2020-02-03
          내용 : 사용자 게시물 좌우로 이미지 슬라이드쇼 쿼리문  -->*/
      /*     var plusSlides = 1; */
          var slideIndex = 1;
         var countCk = document.getElementById('countDot').value;

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
              for (i = 0; i < countCk; i++) {
                  dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";  
              dots[slideIndex-1].className += " active";
          }

    </script>
    
</body>
</html>