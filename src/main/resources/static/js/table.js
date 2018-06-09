/**
 *
 * User: simon
 * Date: 2018/06/07
 * Time: 12:34
 **/
function initTable(tableId, option) {
    $('#' + tableId).bootstrapTable({
        url: option.url,
        toolbar: '#toolbar',
        toolbarAlign: 'left',
        undefinedText: '',
        search: true,
        showRefresh: true,
        searchAlign: 'right',
        showToggle: false,
        showColumns: true,
        showHeader: true,
        showFooter: false,
        showFullscreen: true,
        pagination: true,
        sidePagination: 'server',
        pageNumber: 1,
        pageSize: 5,
        pageList: [10, 25, 50, 100],
        showPaginationSwitch: true,
        minimumCountColumns: 1,
        smartDisplay: true,
        clickToSelect: true,
        sortable: true,
        striped: false,
        rowStyle: function rowStyle(row, index) {
            return {
                classes: 'text-nowrap another-class',
                css: {"color": "black"}
            };
        },
        showExport: true,
        exportDataType: 'all',
        exportTypes: ['json', 'xml', 'png', 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf'],
        exportOptions:{
            //pdf格式导出显示不全，只能先忽略列
            ignoreColumn: ((!option.ignoreColumn)? [0] : option.ignoreColumn),  //忽略某一列的索引
            fileName: "报表",  //文件名称设置
            worksheetName: 'sheet1',  //表格工作区名称
            tableName: "报表",
            excelstyles: ['background-color', 'color', 'font-size', 'font-weight']
        },
        columns: option.columns
    });
}

function refreshTable(tableId) {
    $('#' + tableId).bootstrapTable('refresh', {silent: false});
}