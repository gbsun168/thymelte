//扫码登录
$(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    var qrCode = new QRCode(document.getElementById("qrcode"), {
        width : 200,
        height : 200
    });

    var qrCodeData = $.cookie('qrCodeData');
    console.log(qrCodeData);
    if(!qrCodeData || "null" == qrCodeData){
        refreshQrCode();
    }else{
        qrCode.makeCode(qrCodeData);
        loop();
    }

    function refreshQrCode() {
        $.getJSON("users/uuid", function (data) {
            //存cookie
            var expiresDate= new Date();
            expiresDate.setTime(expiresDate.getTime() + (2 * 60 * 1000));//2分钟过期
            $.cookie('qrCodeData', JSON.stringify(data),{
                expires: expiresDate
            });

            qrCode.makeCode(JSON.stringify(data));
            loop();
        });
    }

    //循环检查是否被扫码
    function loop() {
        var loop = setInterval(function () {
            //获取qrCodeData
            var qrCodeData = $.cookie('qrCodeData');
            //检查qrCodeData是否失效
            if(!qrCodeData){
                console.log("二维码已失效");
                clearInterval(loop);
                $("#refreshQrCode").css("visibility","visible");
            }else{
                var cookieQrCode = JSON.parse(qrCodeData);
                var sid = cookieQrCode.sid;

                $.getJSON("users/loopCheck/" + sid, function(data){
                    console.log(data);
                    if(data['code'] == 200){
                        clearInterval(loop);
                        $.cookie('qrCodeData', null);//赋值"null"字符串
                        $("#refreshQrCode").css("display", "none");
                        $("#jumpHint").css("display", "block");
                        setTimeout(function(){
                            window.location.href = "/index";
                        },2000);
                    }else if(data['code'] == 500){
                        clearInterval(loop);
                        console.log(data['msg']);
                    }
                });
            }
        }, 1000);
    }

    $("#refreshQrCode > a").click(function () {
        $("#refreshQrCode").css("visibility","hidden");
        refreshQrCode();
    });
});