/**
 *
 * User: simon
 * Date: 2018/06/06
 * Time: 19:48
 **/
window.hideHint = function () {
    $('#hint').css('visibility', 'hidden');
};

window.showHint = function (message) {
    $('#hint').text(message);
    $('#hint').css('visibility', 'visible');
};