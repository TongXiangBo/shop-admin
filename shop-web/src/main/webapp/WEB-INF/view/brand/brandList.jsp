<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>商品展示</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">

</head>
<body>

<%--==============================================================================================================--%>


<div class="panel panel-primary" >
    <div class="panel-heading">
        <h3 class="panel-title">品牌查询</h3>
    </div>
    <div class="panel-body" >

    <%--///面板主题--%>
    <div class="container-fluid text-center" >
        <form id="productForm">
            <div class="row"  >
                <div class="col-lg-3">

                    <div class="input-group">
             <span class="input-group-addon">
     品牌名称：
      </span>
                        <input type="text" id="brandName" class="form-control" aria-label="...">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>



            <div class="row">
                <div class="col-lg-6">

                    <div class="input-group">
             <span class="input-group-addon">
      创建时间：
      </span>
                        <input type="text" name="createTime" id="minCreateTime" class="input-sm form-control form_datetime" aria-label="...">
                        <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                        <input type="text"  name="createTime" id="maxCreateTime" class="input-sm form-control form_datetime" aria-label="...">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-6">

                    <div class="input-group">
             <span class="input-group-addon">
      修改时间：
      </span>
                        <input type="text" name="updateTime" id="minUpdateTime" class="input-sm form-control form_datetime" >
                        <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                        <input type="text" name="updateTime" id="maxUpdateTime" class="input-sm form-control form_datetime" style="float: left">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>



            <div class="row">

                <div class="col-lg-2"><button onclick="query()" type="button" class="btn btn-success" id="queryButton" >
                    <span class="glyphicon glyphicon-search"></span>高级查询</button>

                    <button type="reset" class="btn  btn-warning" >
                        <span class="glyphicon glyphicon-repeat"></span>重置</button>
                </div>
            </div>

        </form>
    </div>

</div>

<div style="background:#d8d8d8;text-align:right;">
    <button onclick="exitExcel()" type="button" class="btn btn-sm btn-success">
        <span class="glyphicon glyphicon-save"></span>
        Excel导出</button>

    <button onclick="toAdd()" type="button" class="btn btn-sm btn-warning">
        <span class="glyphicon glyphicon-plus"></span>
        添加用户</button>

    <button onclick="batchDalete()" type="button" class="btn btn-danger">
        <span class="glyphicon glyphicon-remove"></span>
        批量删除</button>
</div>


</div>


<%--------------------------------------------------------------------------------------------------%>

<table id="brandTable"  class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>全选反选</th>
        <th>品牌编号</th>
        <th>品牌名称</th>
        <th>品牌图片</th>
        <th>创建时间</th>
        <th>修改时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>全选反选</th>
        <th>品牌编号</th>
        <th>品牌名称</th>
        <th>品牌图片</th>
        <th>创建时间</th>
        <th>修改时间</th>
        <th>操作</th>
    </tr>
    </tfoot>
</table>


<%--------------------------------------------------------------------------------------------------%>
<script src="<%=request.getContextPath()%>/DataTables/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>


<script src="<%=request.getContextPath()%>/bootbox/bootbox.min.js"></script>
<script type="text/javascript" src="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" ></script>
<script>

    ///时间插件
    $("[name='createTime']").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",
        showClean: true


    });


    $("[name='updateTime']").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd hh:00:00",
        todayBtn: true,
        autoclose: true,
        minView: 0,//最低视图 小时视图
        maxView: 4, //最高视图 十年视图
        showSecond : true,
        showHours : true,
        minuteStep:1,
        showClean: true

    });



    //查看子图
    function viewChildImages(obj) {
        location.href="<%=request.getContextPath()%>/brandImage/viewChildImages.jhtml?id="+obj;
    }



    //增加
    function  toAdd(){
        location.href="<%=request.getContextPath()%>/brand/toAdd.jhtml";
    }
    //删除
    function  deleteBrand(obj){
        $.ajax({
            url:"<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
            type:"post",
            async:true,
            data:{"id":obj},
            success:function (data){
                alert(data)
                queryByWhere(1);

            }
        })
    }
    //批量删除
    function  batchDalete(){
        var v_ids="";
        $("input[name='checkboxSingle']:checkbox:checked").each(function(){
            v_ids+=","+this.value;

        })
        var ids=v_ids.substring(1);
        $.ajax({
            url:"<%=request.getContextPath()%>/brand/batchDalete.jhtml",
            type:"post",
            data:{"ids":ids},
            async:true,
            success:function(result){
                alert(result);
                queryByWhere(1);
            }

        })

    }

    //修改回显
    function toUpdateBrand(obj){
        location.href="<%=request.getContextPath()%>/brand/toUpdateBrand.jhtml?id="+obj;

    }


    $(function () {
    //查询ajax
    seach();

    //初始化表格
    initTable();
})

var ids=[];
function initCheckbox() {
    //回填复选框
    $("#brandTable tbody ").find("input[type='checkbox']").each(function () {

        for (var i = 0; i < ids.length; i++) {
            // alert(this.value)
            /* alert(ids)
             alert(555)*/
            if(this.value==ids[i]){
                alert(this.value)
                this.checked=true;
                $(this).parents("tr").css("background","red");
            }

        }




    })


}


function initTable(){


    $("#brandTable tbody ").on("click","tr",function () {
        var singleCheckbox=$(this).find("input[type='checkbox']")[0];
        //行点击变色 选中复选框
        if(!singleCheckbox.checked){
            $(this).css("background","red");
            singleCheckbox.checked=true;
            ///向数组中添加新id元素
            ids.push(singleCheckbox.value)
            console.log(ids)


        }else{
            $(this).css("background","");
            singleCheckbox.checked=false;
            //删除数组中的元素
            for (var i = ids.length-1; i>=0 ; i--) {
                if(singleCheckbox.value==ids[i]){
                    ids.splice(i,1);
                }
            }

            console.log(ids)
        }
    })

}




/*模糊查询*/
function query(){
    var    param ={};
    param.brandName=$("#brandName").val();
    param.minCreateTime=$("#minCreateTime").val();
    param.maxCreateTime=$("#maxCreateTime").val();
    param.minUpdateTime=$("#minUpdateTime").val();
    param.maxUpdateTime=$("#maxUpdateTime").val();
    brandTable.settings()[0].ajax.data=param ;
    brandTable.ajax.reload();
}





var brandTable;
    function seach(){
        brandTable=   $("#brandTable").DataTable({

            ///回调函数
            "fnDrawCallback": function (oSettings) {
                console.log(oSettings);
                initCheckbox();

            },


            //汉化
            language: {
                url :"/datatable/Chinese.json"
            },


            "lengthMenu":[5,10,15],
            "bFilter": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<%=request.getContextPath()%>/brand/findBrandList.jhtml",
                "type": "POST",
                "dataSrc": function (result) {
                    if (result.code==200) {
                        result.draw=result.data.draw;
                        result.recordsFiltered=result.data.recordsFiltered;
                        result.recordsTotal=result.data.recordsTotal;
                        return result.data.data;
                    }

                }


            },



            "columns": [
                {    "data": "id",
                    //复选框
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' value='" + data + "' id='singleCheckbox' name='checkboxSingle'  >";
                    }
                },

                { "data": "id" },
                { "data": "brandName" },
                { "data": "brandImagePath" ,
                    render: function (data, type, row, meta) {
                        return "<img src='" + data + "'  >";
                    }
                },

                { "data": "createTime" },
                { "data": "updateTime" },
                {
                    //删除
                    render: function (data, type, row, meta) {

                        return "<button onclick='toUpdateBrand("+row.id+")'  type=\"button\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-pencil\">修改</button>" +
                            "<button onclick='deleteBrand("+row.id+")'  type=\"button\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-remove\"> 删除</button>" +
                            "<button onclick='viewChildImages(\""+row.brandImagePath+"\")' type=\"button\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-search\">查看子图</button>";

                    }

                },
            ],


        });
    }


</script>




</body>
</html>