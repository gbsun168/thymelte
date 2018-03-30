$(function(){
    $('.sidebar-menu li').each(function () {
        $(this).removeClass("active");
    });
    $('#li-coffee-type').addClass("active");
    var pathname = window.location.pathname;
    console.log("pathname=" + pathname);
    if(pathname == "/"){
        $('.sidebar-menu li:first-child').addClass("active");
    }else{
        $('.sidebar-menu li').each(function () {
            var href = $(this).children("a").attr("href");
            console.log(href);
            if(href != undefined){
                if(href.indexOf(pathname) != -1){
                    $(this).addClass("active");
                    $(this).parents(".treeview").addClass("active");
                }
            }
        });
    }
});