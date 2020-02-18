<%@page import="com.sixdays.userMember.model.vo.userMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
    <%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함
    
    HttpSession session = request.getSession();
 
    
   userMember m = (userMember)session.getAttribute("member");
    
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>

	<script src="/6Days/resources/js/sidebar.js"></script>
    <script src="/6Days/resources/js/jquery-3.4.1.min.js"></script>
    <script src="/6Days/resources/js/jquery-ui-1.11.4.custom.min.js"></script>
    <script src="/6Days/resources/js/Right_sidebar.js"></script>
    <script src="/6Days/resources/js/Infadd.js"></script>
    
    <script src="https://unpkg.com/vue@2.6.6/dist/vue.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/6Days/resources/css/sidebar.css">
    <link rel="stylesheet" href="/6Days/resources/css/Right_sidebar.css">
    <link rel="stylesheet" href="/6Days/resources/css/main.css">
    <link rel="stylesheet" href = "/6Days/resources/css/Infadd.css">
    <link rel="stylesheet" href = "/6Days/resources/css/MainContact.css">
    <link rel="stylesheet" href = "/6Days/resources/css/Scrollbar.css">
    <link rel="stylesheet" href = "/6Days/resources/css/main-header.css">
</head>

<body>

<!--작성자 : 이서현,박주완
    작성일 : 2020.1.14 시작
    내용 : 메인 로고 딴따라
    수정일 : 
	-->
    <header>
        <div id="top1" class="top">
            <img id="logo" src="/6Days/resources/icon/logoletter.png" onclick="location.href='/6Days/main.jsp'">


<!--  작성자 : 윤석훈
	   작성일 : 2020.02.03 
	   내용 : 검색창 구현
	  수정일 : -->
            <div id="headersearch" >
                 <input id="searchInput" type="text" placeholder="검색어를 입력해주세요.">
			     <button id="searchBtn">검색</button>
            </div>
            


            <img id="loca" class="top-btn" src="/6Days/resources/icon/UPloadbtn.png"  title="게시글추가" onclick="Infopen();" style="margin-left: 265px;">
            <img id="mg" class="top-btn" src="/6Days/resources/icon/4.png" title="마이페이지" onclick="location.href='/6Days/views/user/Profile.jsp'">
            <img id="myp" class="top-btn" src="/6Days/resources/icon/outbtn.png" title="로그아웃" onclick="logout();">
            
<!--    작성자 : 이서현, 신경섭 
  		작성일 : 2020.1.14 시작
   	 	내용 : 게시물 업로드
  	 	수정일 : 2020.02.10
			-->
		   <form>
                <div id="Infmodal">
                    <div id="Infcontent">
                        <div id="Infmenu">
                            <label style="font-size: 1.8em; margin-top: 0;">&nbsp; &nbsp;게시글 업로드</label>
                            <button id="Infclosebtn" onclick="Infclose();">X</button>
                        </div>
                        <hr>
                        <div id="Infleft" style="overflow: auto;" >
                                <input type="file" id='uploadFile' multiple='multiple'> <br/>
                                <table class="table" style="width: 100%; height: 100%;">
                                   <tr  v-for="item in fileList">
                                    <td align="center"><img v-bind:src="item.url" style="height:480px; width:480px;"/></td>
                                   </tr>
 
                        
                                </table>
								<!-- 
                                <input type="file" id="uploadFile" multiple='multiple' onchange="changeValue(this)"/>
                                <button type="button" id="btn-upload">
                                    사진/동영상
                                    <img src="/6Days/resources/icon/photo.png"style="width: 12%; height=12%;">
                                </button> -->


                                
                            <!-- <div id="filebox" style="position: absolute; bottom: 10px; width: 30%; height: 8%;">
                                    <img src="/6Days/resources/icon/photo.png"style="width: 12%; height=12%;">
                                    <label for="file_upload">사진/동영상</label>
                                    <input type="file" id="uploadFile" multiple='multiple'>
                            </div>
                                 -->
                            
                        </div>         


                        <div id="Infright">
                            <textarea id="Infcomment" placeholder="오늘 하루를 기록해 보세요"></textarea>
                            <textarea id="Infhashtag" placeholder="#태그"></textarea>
                            <button id="Infupload" onclick="">업로드</button>
                        </div>
                        
                        <div>
                            
                            
                        </div>
                        
                    </div>
                </div>
            </form>
        </div>
    </header>
</body>
<script>
$('#Infadd')
.on("dragover", dragOver)
.on("dragleave", dragOver)
.on("drop", uploadFiles);

function dragOver(e){
e.stopPropagation();
e.preventDefault();
}

function uploadFiles(e){
e.stopPropagation();
e.preventDefault();
}

function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $(e.target).css({
            "background-color": "black",
            "outline-offset": "-20px"
        });
    } else {
        $(e.target).css({
            "background-color": "gray",
            "outline-offset": "-10px"
        });
    }
}

function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e); //1
 
    e.dataTransfer = e.originalEvent.dataTransfer; //2
    var files = e.target.files || e.dataTransfer.files;
 
    if (files.length > 1) {
        alert('하나만 올려라.');
        return;
    }
    if (files[0].type.match(/image.*/)) {
        
    }else{
        alert('이미지가 아닙니다.');
        return;
    }

    if (files[0].type.match(/image.*/)) {
        $(e.target).css({
            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
            "outline": "none",
            "background-size": "100% 100%"
        });
    }else{
      alert('이미지가 아닙니다.');
      return;
    }

}
	function logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="/6Days/logout.me";
		}
		
		
	}
	
	   var uploadApp = new Vue({
           el: '#Infleft',
           data:{
               fileList:[]
           }
       })
       $("#uploadFile").change(function(event){
           console.log($(this)[0].files);
           var files=$(this)[0].files;
           uploadApp.fileList =[];

           $.each(files,function(i,item){
               var fileReader = new FileReader();
               fileReader.onload=function(e){
                   var img ={
                       url:e.target.result,
                       name:item.name,
                       // size:item.size
                   };
                   uploadApp.fileList.push(img);
               }
               fileReader.readAsDataURL(item);
           });
       });


</script>
</html>
