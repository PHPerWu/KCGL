//返回顶部
$(function () {
    $(window).scroll(function () {
        if ($(document).scrollTop() > 10) {
            $(".returntop").show().mousemove(function () {
                $("#img2").show();
                $("#img1").hide();
            }).mouseleave(function () {
                $("#img1").show();
                $("#img2").hide();
            }).click(function () {
                $(window).scrollTop(0);
            });
        }
        else {
            $(".returntop").hide();
        }
    });
})
