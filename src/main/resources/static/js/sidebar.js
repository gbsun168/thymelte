$(function(){
    $('.sidebar-menu li').each(function () {
        $(this).removeClass("active");
    });

    var pathname = window.location.pathname;
    console.log("pathname=" + pathname);
    if(pathname == "/"){
        $('.sidebar-menu li:first-child').addClass("active");
    }else{
        $('.sidebar-menu li').each(function () {
            var href = $(this).children("a").attr("href");
            console.log("href=" + href);
            if(href != undefined){
                if(pathname.indexOf(href) != -1){
                    $(this).addClass("active");
                    $(this).parents(".treeview").addClass("active");
                }
            }
        });
    }
});