// <!--    작성자 : 박주완
//         작성일 : 2020-01-09
//         내용 : 유저 게시물 클릭시 확대창 쿼리문-->
            function modalOpen(){
                var ulr = $(this).attr("src");
                $("#modalimg").attr("src", ulr);            
                $('#modal').show();

                
            }

            function modalclose(){
                $('#modal').css("display","none");
            }

// <!--    작성자 : 박주완
//         작성일 : 2020-01-14
//         내용 : 자신의프로필에서 세팅 버튼 클릭시 모달창 온오프기능-->
            function settingbtn(){
                var ulr = $(this).attr("src");
                $("#setting").attr("src",ulr);
                $("#setting").show();
            }

            function settinglistclose(){
                $('#setting').css("display",'none');
            }
    
// <!--    작성자 : 박주완
//         작성일 : 2020-01-14
//         내용 : 프로필 세팅 변경 모달 온오프 기능-->
            function profileModalOpen(){
                var ulr = $(this).attr("src");
                $('#nameSetModal').css("display",'none');
                $("#profileModal").attr("src",ulr);
                $("#profileModal").show();
                $('#nameSetModal').css("display",'none');
                $('#comentSetModal').css("display",'none');
            }

            function profileModalClose(){
                $('#profileModal').css("display",'none');
                $('#comentSetModal').css("display",'none');
            }

// <!--    작성자 : 박주완
//         작성일 : 2020-01-16
//         내용 : 공개범위 및 보안 클릭시 모달 온오프 -->
            function PublicScopeModal(){
                var url = $(this).attr("src");
                $("#Public_Scope_Modal").attr("src",url);
                $("#Public_Scope_Modal").show();
            }

            function PublicScopeModalclose(){
                $('#Public_Scope_Modal').css("display",'none');
            }

// <!--    작성자 : 박주완
//         작성일 : 2020-01-16
//         내용 : 코멘트 변경 모달 로직-->
        function comentsetopen(){
            var url = $(this).attr("src");
            $("#comentSetModal").attr("src",url);
            $("#comentSetModal").show();
        }

        function comentsetclose(){
            $('#comentSetModal').css("display",'none');
        }

// <!--    작성자 : 박주완
//         작성일 : 2020-01-16
//         내용 : 코멘트 변경 함수-->
        function comentInput() {
            var coment = document.getElementById('memo');
            var resetcoment = document.getElementById("comenttextarea");
            coment.innerHTML = " ";
            coment.innerHTML += resetcoment.value;
        }

// <!--    작성자 : 박주완
//         작성일 : 2020-01-16
//         내용 : 닉네임 변경 모달 로직-->
            function nameSetopen(){
                var url = $(this).attr("src");
                $("#nameSetModal").attr("src",url);
                $("#nameSetModal").show();
            }
    
            function nameSetclose(){
                $('#nameSetModal').css("display",'none');
            }
    
// <!--    작성자 : 박주완
//         작성일 : 2020-01-16
//         내용 : 닉네임 변경 함수-->
            function nameInput() {
                var name = document.getElementById('name');
                var resetname = document.getElementById("nametextarea");
                name.innerHTML = " ";
                name.innerHTML += resetname.value;
            }




/*<!--  작성자 : 박주완
        작성일 : 2020-02-011
        내용 : 사용자화면 게시글 클릭시 확대되는 창 내부 사진 좌우 슬라이드 쿼리문 -->*/

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