$(function(){
    setTokenInHeader();

    window.hideHint = function () {
        $('#hint').css('visibility', 'hidden');
    };

    window.ban = function(id) {
        $.post('users/' + id + '/ban', function (data) {
            $('#hint').text(data.message);
            $('#hint').css('visibility', 'visible');
            setTimeout('hideHint()', 2000);
            refreshTable('table');
        });
    };

    window.unban = function (id) {
        $.post('users/' + id + '/unban', function (data) {
            $('#hint').text(data.message);
            $('#hint').css('visibility', 'visible');
            setTimeout('hideHint()', 2000);
            refreshTable('table');
        });
    };

    initTable('table', {
        url: 'users/all',
        columns: [{
            field: 'state',
            checkbox: true
        },{
            field: 'username',
            title: '用户名',
            align: 'center'
        },{
            field: 'enabled',
            title: '有效',
            align: 'center',
            formatter: function (value, row, index, field) {
                if(value){
                    return '<span style="color: lawngreen;">正常</span>';
                }else{
                    return '<span style="color: red;">已封</span>';
                }
            }
        },{
            field: 'phone',
            title: '手机号',
            align: 'center'
        },{
            field: 'email',
            title: '邮箱',
            align: 'center'
        },{
            field: 'enabled',
            title: '封号/解封',
            align: 'center',
            formatter: function (value, row, index, field) {
                if(value){
                    return '<button class="btn btn-danger" onclick="ban(' + row.id + ')">封号</button>';
                }else{
                    return '<button class="btn btn-default" onclick="unban(' + row.id + ')">解封</button>';
                }
            }
        }],
        ignoreColumn: [0, 5]
    });

});