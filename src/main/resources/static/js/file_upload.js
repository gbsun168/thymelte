/**
 *
 * User: simon
 * Date: 2018/06/06
 * Time: 14:45
 **/
$(function () {
    'use strict';

    //必须加这段代码，不然无法上传
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    var uploader = $('#file_upload');
    uploader.fileupload({
        url: "uploadFiles/upload",
        dataType: 'json',
        type: "post",
        multipart: true,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        maxFileSize: 1000 * 1024 * 1024,
        maxNumberOfFiles: 50,
        change: function (e, data){
            $('.preview').empty();
            $('.progress-bar').css('width', '0%');
            $('.proportion').html('');
            $('input[name="imageUrl"]').remove();
        },
        done: function (e, data) {
            var result = data.result;
            //done方法就是上传完毕的回调函数，其他回调函数可以自行查看api
            //注意data要和jquery的ajax的data参数区分，这个对象包含了整个请求信息
            //返回的数据在data.result中，这里dataType中设置的返回的数据类型为json
            if(200 == result.code) {
                // 上传成功：
                $(".preview").append('<div style="margin-top:10px;"><img src="uploadFiles/file/'+result.data[0] + '"></div>');
                $(".preview").append("<div><button class='delete_file' type='button'>删除</button></div>");

                //设置filePath
                $('#file_paths').append('<input type="hidden" name="imageUrl" value="uploadFiles/file/' + result.data[0] + '">');
            } else {
                // 上传失败：
                $(".upstatus").append("<div style='color:red;'>"+result.msg+"</div>");
            }
        },messages: {
            maxFileSize: '文件大小超过限制',
            acceptFileTypes: '文件格式不支持'
        },progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $(".progress-bar").css("width", progress + "%");
            $(".proportion").html("上传总进度："+progress+"%");
        },processfail: function (e, data) {
            var currentFile = data.files[data.index];
            if (data.files.error && currentFile.error) {
                alert(currentFile.error);
            }
        }
    });

    $(document).on('click', '.delete_file', function () {
        console.log("clicked");
        $('.preview').empty();
        $('.progress-bar').css('width', '0%');
        $('.proportion').html('');
        $('input[name="imageUrl"]').remove();
    });
});