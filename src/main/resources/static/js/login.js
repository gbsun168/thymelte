$(function(){
    $(".switchMode").on({
        click:function(){
            if($(this).attr("src").indexOf('qrcode-40x40.png') != -1){
                $(this).attr("src", "img/pc-40x40.png");
                window.location.href = "login?qrcode=true";
            }else {
                $(this).attr("src", "img/qrcode-40x40.png");
                window.location.href = "login";
            }
        }
    });
});