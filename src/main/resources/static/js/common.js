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