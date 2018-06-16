/**
 *
 * User: simon
 * Date: 2018/06/06
 * Time: 19:23
 **/
$(function(){
    setTokenInHeader();

    initTable('table', {
        url: 'newsInfos/pageable',
        columns: [{
            field: 'state',
            checkbox: true
        },{
            field: 'title',
            title: '标题',
            align: 'center',
            searchable: true
        },{
            field: 'imageUrl',
            title: '缩略图',
            align: 'center',
            formatter: function (value, row, index, field) {
                return '<img src="' + value + '" />';
            }
        },{
            field: 'content',
            title: '内容',
            align: 'center',
            formatter: function (value, row, index, field) {
                //console.log(decodeURIComponent(value));
                return '<div style="max-width:600px; text-align: center">' + decodeURIComponent(value) + '</div>';
            }
        },{
            field: 'publishDate',
            title: '发布时间',
            align: 'center',
            formatter: function (value) {
                return new Date(value).format("yyyy-MM-dd hh:mm:ss");
            }
        }],
        ignoreColumn: [0, 2]
    });

    $('#commit_change').click(function () {
        $.ajax({
            cache: true,
            type: "POST",
            url:"newsInfos",
            data:$('#form_add').serialize(),// 你的form id
            async: true,
            error: function(request) {
                alert("Connection error:"+request.error);
            },
            success: function(data) {
                $('#myModal').modal('hide');
                showHint(data.message);
                setTimeout('hideHint()', 2000);
                refreshTable('table');
            }
        });
    });

    $('#plus').click(function () {
        $('#form_add input[name="id"]').val('');
        $('#form_add input[name="title"]').val('');
        $("#form_add .preview").empty();
        $('#file_paths').empty();
        $('#form_add input[name="content"]').val('');

        $('.preview').empty();
        $('.progress-bar').css('width', '0%');
        $('.proportion').html('');
        $('input[name="imageUrl"]').remove();

        $('#myModal').modal('show');
    });

    $('#edit').click(function () {
        var $select = $('#table').bootstrapTable('getSelections');
        if($select.length <= 0){
            alert('请至少选中一项');
        }else if($select.length > 1){
            alert('请选择一项');
        }else{
            $('#form_add input[name="id"]').val($select[0].id);
            $('#form_add input[name="title"]').val($select[0].title);
            $("#form_add .preview").empty();
            $("#form_add .preview").append('<div style="margin-top:10px;"><img src="' +$select[0].imageUrl + '"></div>');
            //$('#form_add input[name="content"]').val($select[0].content);//对froalaEditor无效
            $('textarea').froalaEditor('html.set', $select[0].content);
            //设置filePath
            $('#file_paths').empty();
            $('#file_paths').append('<input type="hidden" name="imageUrl" value="' + $select[0].imageUrl + '">');
            $('#myModal').modal('show');
        }
    });

    $('#minus').click(function () {
        var $select = $('#table').bootstrapTable('getSelections');
        if ($select.length <= 0) {
            alert('请至少选中一项');
        } else if ($select.length > 1) {
            var i;
            var ids = [];
            for(i = 0; i < $select.length; i++){
                ids[i] = $select[i].id;
            }
            $.get('newsInfos/delete/ids/' + ids.join(','), function(data){
                if(200 == data['code']){
                    showHint(data.message);
                    setTimeout('hideHint()', 2000);
                }
                refreshTable('table');
            });
        } else {
            $.get('newsInfos/delete/id/'+$select[0].id, function(data){
                if(200 == data['code']){
                    showHint(data.message);
                    setTimeout('hideHint()', 2000);
                }
                refreshTable('table');
            });
        }
    });
});