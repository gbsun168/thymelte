/**
 *
 * User: simon
 * Date: 2018/07/08
 * Time: 10:01
 **/
$().ready(function() {
    //createCode();
    setTokenInHeader();

    jQuery.validator.addMethod("password", function (value, element, param) {
        var rex = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,16}$/;
        return this.optional(element) || (rex.test(value));
    }, "必须包含数字、字母或特殊字符");

    $("#registerForm").validate({
        debug: false,
        onkeyup: false,
        rules:{
            username: {
                required: true,
                minlength: 1,
                remote: {
                    type: 'POST',
                    url: 'users/checkExists',
                    data: {
                        username: function () {
                            return $('#username').val();
                        }
                    }
                }
            },
            password: {
                required: true,
                rangelength: [6,20],
                password: true
            },
            verifyPassword: {
                required: true,
                rangelength: [6,20],
                password: true,
                equalTo: '#password'
            }
        },
        messages: {
            username:{
                required: "用户名必填",
                remote: "用户名已存在"
            },
            password: {
                required: '密码必填'
            },
            verifyPassword: {
                equalTo: '密码不相同'
            }
        },
        errorPlacement: function(error, element) {
            error.appendTo(element.parent());
        },
        errorElement: "span"
    });
});