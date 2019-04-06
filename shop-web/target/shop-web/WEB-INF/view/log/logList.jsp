<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>日志展示</title>

</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">

<%--
<link rel="stylesheet"  type="text/css" href="<%=request.getContextPath()%>/datatable/dataTables.bootstrap.min.css/">
--%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">

<body>

<%--==============================================================================================================--%>


<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">日志展示</h3>
    </div>
    <div class="panel-body">


        <%--///面板主题--%>
        <div class="container-fluid text-center">
            <form id="productForm">
                <div class="row">
                    <div class="col-lg-3">

                        <div class="input-group">
                         <span class="input-group-addon">
                         用户名：
                      </span>
                            <input type="text" id="userName" class="form-control" aria-label="...">
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->

                </div>


                <div class="row">
                    <div class="col-lg-3">

                        <div class="input-group">
                         <span class="input-group-addon">
                         方法名：
                      </span>
                            <input type="text" id="method" class="form-control" aria-label="...">
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->

                </div>


                <div class="row">
                    <div class="col-lg-3">

                        <div class="input-group">
                         <span class="input-group-addon">
                         类名：
                      </span>
                            <input type="text" id="classPath" class="form-control" aria-label="...">
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->

                </div>





                <div class="row">
                    <div class="col-lg-6">

                        <div class="input-group">
              <span class="input-group-addon">
       开始时间：
       </span>
                            <input type="text" id="minStartTime" class="input-sm form-control form_datetime"  aria-label="...">
                            <span class="input-group-addon">
       <span class="glyphicon glyphicon-resize-horizontal"></span>
       </span>
                            <input type="text" id="maxStartTime" class="input-sm form-control form_datetime"  aria-label="...">
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->

                </div>

                <div class="row">
                    <div class="col-lg-6">

                        <div class="input-group">
              <span class="input-group-addon">
       结束时间：
       </span>
                            <input type="text" id="minEndTime" class="input-sm form-control form_datetime" >
                            <span class="input-group-addon">
       <span class="glyphicon glyphicon-resize-horizontal"></span>
       </span>
                            <input type="text" id="maxEndTime" class="input-sm form-control form_datetime"  style="float: left">
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->

                </div>


                <div class="row">

                    <div class="col-lg-2">
                        <button onclick="query()" type="button" class="btn btn-success" id="queryButton">
                            <span class="glyphicon glyphicon-search"></span>高级查询
                        </button>

                        <button type="reset" class="btn  btn-warning">
                            <span class="glyphicon glyphicon-repeat"></span>重置
                        </button>
                    </div>
                </div>

            </form>
        </div>

    </div>

    <div style="background:#d8d8d8;text-align:right;">


    </div>

</div>


<%--------------------------------------------------------------------------------------------------%>

<table id="logTable" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>全选反选</th>
        <th>编号</th>
        <th>用户名</th>
        <th>方法名</th>
        <th>类名</th>
        <th>开始时间</th>
        <th>结束时间</th>


    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>全选反选</th>
        <th>编号</th>
        <th>用户名</th>
        <th>方法名</th>
        <th>类名</th>
        <th>开始时间</th>
        <th>结束时间</th>
    </tr>
    </tfoot>
</table>


<%--------------------------------------------------------------------------------------------------%>
<script src="<%=request.getContextPath()%>/DataTables/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>


<script src="<%=request.getContextPath()%>/bootbox/bootbox.min.js"></script>


<%--
<script type="text/javascript" src="/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
--%>

<script type="text/javascript" src="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" ></script>


<script>




    $(function () {
        //查询ajax
        seach();

        //初始化表格
        initTable();
    })

    var ids = [];

    function initCheckbox() {
        //回填复选框
        $("#logTable tbody ").find("input[type='checkbox']").each(function () {

            for (var i = 0; i < ids.length; i++) {
                // alert(this.value)
                /* alert(ids)
                 alert(555)*/
                if (this.value == ids[i]) {
                    alert(this.value)
                    this.checked = true;
                    $(this).parents("tr").css("background", "red");
                }

            }


        })


    }


///时间格式
    $(".form_datetime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd hh:ii:00",
        todayBtn: true,
        autoclose: true,
        minView: 0,//最低视图 小时视图
        maxView: 4, //最高视图 十年视图
        showSecond : true,
        showHours : true,
        minuteStep:1,
        showClean: true

    });




    function initTable() {


        $("#logTable tbody ").on("click", "tr", function () {
            var singleCheckbox = $(this).find("input[type='checkbox']")[0];
            //行点击变色 选中复选框
            if (!singleCheckbox.checked) {
                $(this).css("background", "red");
                singleCheckbox.checked = true;
                ///向数组中添加新id元素
                ids.push(singleCheckbox.value)
                console.log(ids)


            } else {
                $(this).css("background", "");
                singleCheckbox.checked = false;
                //删除数组中的元素
                for (var i = ids.length - 1; i >= 0; i--) {
                    if (singleCheckbox.value == ids[i]) {
                        ids.splice(i, 1);
                    }
                }

                console.log(ids)
            }
        })

    }


    /*模糊查询*/
    function query() {
        var param = {};
        param.userName = $("#userName").val();
        param.method=$("#method").val();
        param.classPath=$("#classPath").val()
        param.minStartTime=$("#minStartTime").val()
        param.maxStartTime=$("#maxStartTime").val()
        param.minEndTime=$("#minEndTime").val()
        param.maxEndTime=$("#maxEndTime").val()

        logTable.settings()[0].ajax.data = param;
        logTable.ajax.reload();
    }


    var logTable;

    function seach() {
        logTable = $("#logTable").DataTable({

            ///回调函数
            "fnDrawCallback": function (oSettings) {
                console.log(oSettings);
                initCheckbox();

            },


            //汉化
            language: {
                url: "/datatable/Chinese.json"
            },


            "lengthMenu": [5, 10, 15],
            "bFilter": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<%=request.getContextPath()%>/log/findLogList.jhtml",
                "type": "POST"

            },


            "columns": [
                {
                    "data": "id",
                    //复选框
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' value='" + data + "' id='singleCheckbox' name='checkboxSingle'  >";
                    }
                },

                {"data": "id"},
                {"data": "userName"},
                {"data": "method"},
                {"data": "classPath"},
                {"data": "startTimeStr"},
                {"data": "endTimeStr"}

            ],


        });
    }


</script>


</body>
</html>