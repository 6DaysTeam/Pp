// $(function() {
//     //초기 상태
//     $('#inputPhone').hide();
//     $('#inputEmail').hide();
    
//     //toggle 직접 구현
//     var check = false;

//     $('#titlePhone').click(function() {
//         console.log(check);

//         if(check) {
//             $('#inputPhone').hide();
//         }else {
//             $('#inputPhone').show();
//         }

//         check = !check;
//     });

//     $('#titleEmail').click(function() {
//         console.log(check);

//         if(check) {
//             $('#inputEmail').hide();
//         }else {
//             $('#inputEmail').show();
//         }

//         check = !check;
//     });

// });


$(function() {
    //초기 상태 설정
    $('.inputEnter').slideUp();

    $('.title').click(function() {

        $('.typeList').attr('class','typeList current');
        
        $('.inputEnter').slideToggle(1000,function() {
            //alert('슬라이드 토글 확인');
        });
    })
});