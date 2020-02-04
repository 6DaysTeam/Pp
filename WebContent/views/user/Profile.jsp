<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>profile</title>
        
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/left-sidebar.jsp" %>
	<%@ include file="../common/right-sidebar.jsp" %>
	
	
        <script src="/6Days/resources/js/Profile.js"></script>
        <link rel="stylesheet" href="/6Days/resources/css/profile.css">


    
    <body>


<!--    작성자 : 박주완
        작성일 : 2020-01-09
        내용 : 유저 프로필 화면 -->
    <div id="container">
        <div id="profile" class="profile">
            <div id="show-profile">
                <!-- <img id="profilebackgound" src="../resources/icon/profilebackground.JPG"> -->
                <div id="profileimgbox">
                    <img id="profileimg"src="/6Days/resources/maruta/profileimg.JPG" onclick="profileModalOpen();" >
                </div>

                    <div id="profilename">
                        <label id="name" class="profile">Juwan_P</label>
                        <hr style="margin-top: -5px; margin-bottom: 5px;">
                        <label id="memo" class="profile">메모</label>
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
            <hr style="margin: 8px 0px 8px 0px; width: 850px;">
            

            <div id="postlist">
                <table align="center">
                    <tr>
                        <td><img class="post" src="/6Days/resources/maruta/dummy1.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy2.JPG" onclick="modalOpen();"></td>
                        <td><img class="post" src="/6Days/resources/maruta/dummy3.JPG" onclick="modalOpen();"></td>
                    </tr>
                    <tr>
                        <td><img class="post" src="/6Days/resources/maruta/dummy4.JPG" onclick="modalOpen();"></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>


<!--    작성자 : 박주완
        작성일 : 2020-01-09
        내용 : 유저 게시물 클릭시 확대창 -->
        <div id="modal">
            <div id="modalcontent">
                <button id="closebtn" onclick="modalclose();">X</button>
                <div id="modalpost">
                    <img id="modalimg" src="/6Days/resources/maruta/dummy3.JPG">
                    <div id="coments">
                        <div id="userprofilshow">
                            [사진]
                            Juwan_P
                        </div><hr style="margin: 5px;">
                        <div id="innercoment">
                            <div class="coments">댓글1</div><br>
                            <div class="coments">댓글2</div><br>
                            <div class="coments">댓글3</div><br>
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

<!--    작성자 : 박주완
        작성일 : 2020-01-14
        내용 : 계정설정 및 보안 신고 메뉴화면 (세팅버튼 클릭시) -->
        <div id="setting">
            <div id="settinglist">
                <div>
                    <p class="settingitem" align="center" onclick="location.href='Update.html'">개인정보 변경</p>
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
                <p style="color: royalblue;">프로필 사진 바꾸기</p><hr>
                <p style="color: royalblue;">프로필 배경 사진 바꾸기</p><hr>
                <p style="color: red;">현재 프로필 사진 삭제</p><hr>
                <p style="color: red;">현재 프로필 배경 사진 삭제</p><hr>
                <p onclick="profileModalClose();">닫기</p>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-01-16
        내용 : 코멘트 변경 모달 화면-->
        <div id="comentSetModal">
            <div id="comentSet">
                <p>변경할 코멘트</p><hr>
                <textarea id="comenttextarea"></textarea><br>
                <P onclick="comentInput();" style="margin: 8px 0px 8px 0px; color: blue;">변경</P><hr>
                <p onclick="comentsetclose();">닫기</p>
            </div>
        </div>

<!--    작성자 : 박주완
        작성일 : 2020-01-16
        내용 : 닉네임 변경 모달 화면-->
        <div id="nameSetModal">
            <div id="nameSet">
                <p>변경할 닉네임</p><hr>
                <input type="text" id="nametextarea"><br>
                <P onclick="nameInput();" style="margin: 8px 0px 8px 0px; color: blue;">변경</P><hr>
                <p onclick="nameSetclose();">닫기</p>
            </div>
        </div>

    
    
    
    
</body>
</html>