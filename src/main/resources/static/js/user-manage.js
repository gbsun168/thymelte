$(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function (e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    window.hideHint = function () {
        $('#hint').css('visibility', 'hidden');
    };

    window.ban = function(id) {
        $.post('/users/' + id + '/ban', function (data) {
            $('#hint').text(data.msg);
            $('#hint').css('visibility', 'visible');
            setTimeout('hideHint()', 2000);
            $("#table").bootstrapTable('refresh', {silent: false});
        });
    };

    window.unban = function (id) {
        $.post('/users/' + id + '/unban', function (data) {
            $('#hint').text(data.msg);
            $('#hint').css('visibility', 'visible');
            setTimeout('hideHint()', 2000);
            $("#table").bootstrapTable('refresh', {silent: false});
        });
    };

    $("#table").bootstrapTable({
        url: '/users/all',
        search: true,
        showRefresh: true,
        showToggle: false,
        showColumns: true,
        showFooter: false,
        showFullscreen: true,
        pagination: true,
        sidePagination: 'server',
        pageList: [10, 25, 50, 100],
        showPaginationSwitch: true,
        clickToSelect: true,
        striped: false,
        showExport: true,
        exportDataType: 'all',
        exportTypes: ['json', 'xml', 'png', 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],
        exportOptions:{
            //pdf格式导出显示不全，只能先忽略列
            ignoreColumn: [0, 5],  //忽略某一列的索引
            //fileName: questionNaireName,  //文件名称设置
            //worksheetName: 'sheet1',  //表格工作区名称
            //tableName: questionNaireName,
            //excelstyles: ['background-color', 'color', 'font-size', 'font-weight'], 设置格式
        },
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
        }]
    });
});