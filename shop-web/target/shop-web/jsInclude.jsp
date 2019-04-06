<script src="/bootbox/bootbox.locales.min.js"></script>
<script src="/bootbox/bootbox.min.js"></script>
<script src="/bootbox/bootbox.all.min.js"></script>

<%--时间插件--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" ></script>

<link rel="stylesheet"  href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">

class="input-sm form-control form_datetime"

<script>
    $(".form_datetime").datetimepicker({
        format: 'yyyy-mm-dd hh:ii:ss',
        language:'zh-CN',
        });
</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" ></script>
<link rel="stylesheet"  href="<%=request.getContextPath()%>/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">

<%--------------------------------------------------------------------------------------------------%>
<script src="<%=request.getContextPath()%>/DataTables/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/DataTables/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>

<%--------------------------------------------------------------------------------------------------%>




function initTable() {
userTableInfo = $("#userTable").DataTable({
"processing": true,
"serverSide": true,
"fnDrawCallback": function () {//回调函数
checkBoxChecked();
},
"ajax": {
"url": "<%=request.getContextPath()%>/product/selectProduct.jhtml",
"type": "POST"
},
"columns": [
{
"data": "id",
//复选框
render: function (data, type, row, meta) {
return "<input type='checkbox'  value='" + data + "' >";
}
},
{"data": "userName"},
{"data": "errorLoginCount"},
{"data": "errorLoginTime"},
{"data": "loginStatus"},
{"data": "loginTime"},
{"data": "loginCount"},
],
"language": {
"url": "/DataTables/Chinese.json"  //中文注释
},
"lengthMenu": [5, 10, 15], //每页条数大小
"bFilter": false,     //搜索框
});