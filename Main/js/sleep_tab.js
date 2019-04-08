$(document).ready(function () {
    $("li").each(function () {
        $(this).click(function () {
            $(this).addClass("selected");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
            $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
        });
    });
});