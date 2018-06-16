/**
 *
 * User: simon
 * Date: 2018/06/07
 * Time: 13:01
 **/
function setTokenInHeader() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}

var themeLink = document.getElementById("theme_link");

//初始化主题
loadTheme();

function changeTheme(color){
    console.log("color=" + color);
    themeLink.href = "css/theme/"+color+".css";
    //保存主题到cookies
    $.cookie('theme', color);
    //loadTheme();
}

function loadTheme(){
    //从cookies读取主题
    var themeValue = $.cookie('theme');
    if(themeValue == null){
        themeLink.href = "css/theme/default.css";
    }else{
        themeLink.href = "css/theme/" + themeValue + ".css";
    }
}