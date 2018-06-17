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

//左侧菜单栏选中事件初始化
$('.sidebar-menu li').each(function () {
    $(this).removeClass("active");
});
var pathValue = window.location.href;
var pathName = pathValue.substring(pathValue.lastIndexOf('/') + 1);
$('.sidebar-menu li').each(function () {
    if(pathName == '' && $(this).children('a').attr('href').indexOf('index') != -1){
        $(this).addClass("active");
        $(this).parents(".treeview").addClass("active");
    }else if(pathName != ''&& $(this).children('a').attr('href').indexOf(pathName) != -1){
        $(this).addClass("active");
        $(this).parents(".treeview").addClass("active");
    }
});