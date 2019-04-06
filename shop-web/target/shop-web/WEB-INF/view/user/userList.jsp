<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>用户展示</title>
   <%-- css样式引入--%>
<jsp:include page="/WEB-INF/common/cssReference.jsp"/>
</head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>商品展示</title>
</head>
<body>

<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/2/27
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>

<%--==============================================================================================================--%>

<div class="container-fluid">
    <div class="col-md-3">

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">部门
                    <button type="button" onclick="addDept()" class="btn btn-xs btn-warning">
                        <span class="glyphicon glyphicon-plus"></span>
                        添加部门
                    </button>
                    <button type="button" onclick="updateDeptInfo()" class="btn btn-xs btn-success">
                        <span class="glyphicon glyphicon-pencil"></span>
                        修改部门
                    </button>

                    <button type="button" onclick="batchDeleteDept()" class="btn btn-xs btn-danger">
                        <span class="glyphicon glyphicon-remove"></span>
                        删除部门
                    </button>

                </h3>
            </div>
            <div class="panel-body">


                <div class="content_wrap">
                    <div class="zTreeDemoBackground left" id="TreeDiv1">
                        <ul id="deptTree" class="ztree"></ul>
                    </div>
                </div>


                树状图
            </div>
        </div>

    </div>

    <div class="col-md-9">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">用户查询</h3>
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
                                    <input type="text" id="brandName" class="form-control" aria-label="...">
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>


                        <div class="row">
                            <div class="col-lg-6">

                                <div class="input-group">
             <span class="input-group-addon">
      生日：
      </span>
                                    <input type="text" id="minBirthday" class="input-sm form-control form_datetime"
                                           aria-label="...">
                                    <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                                    <input type="text" id="maxBirthday" class="input-sm form-control form_datetime"
                                           aria-label="...">
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>

                        <div class="row">
                            <div class="col-lg-6">

                                <div class="input-group">
             <span class="input-group-addon">
      薪水：
      </span>
                                    <input type="text" id="minSalary" class="form-control">
                                    <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                                    <input type="text" id="maxSalary" class="form-control" style="float: left">
                                </div><!-- /input-group -->
                            </div><!-- /.col-lg-6 -->

                        </div>


                        <div class="row" style="margin-top: 20px">

                            <div class="col-lg-2">
                                <button onclick="query()" type="button" class="btn  btn-success" id="queryButton">
                                    <span class="glyphicon glyphicon-search"></span>高级查询
                                </button>
                            </div>
                                <div class="col-lg-2">
                                <button type="button" onclick="resetTree()" class="btn   btn-warning">
                                    <span class="glyphicon glyphicon-repeat"></span>重置
                                </button>
                            </div>
                        </div>

                    </form>
                </div>

            </div>


        </div>

        <%--------------------------------------------------------------------------------------------------%>

        <div class="row">

            <div style="background:lightskyblue;text-align:left;">
                <button type="button" onclick="addUser()" class="btn  btn-warning">
                    <span class="glyphicon glyphicon-plus"></span>
                    添加用户
                </button>
                <button type="button" onclick="updateUser()" class="btn  btn-success">
                    <span class="glyphicon glyphicon-pencil"></span>
                    用户修改
                </button>

                <button type="button" onclick="batchDelete()" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span>
                    批量删除
                </button>

                <button type="button" onclick="batchChangeDept()" class="btn btn-success">
                <span class="glyphicon glyphicon-pencil"></span>
                批量换部门
            </button>

                <button type="button" onclick="exportExcelByDept()" class="btn btn-success">
                    <span class="glyphicon glyphicon-pencil"></span>
                    按部门导出excel
                </button>
            </div>
        </div>


        <%--------------------------------------------------------------------------------------------------%>

        <table id="userTable" class="table table-striped table-bordered" style="width:100%">
            <thead>
            <tr>
                <th>全选反选</th>
                <th>编号</th>
                <th>用户名</th>
                <th>真实姓名</th>
                <th>生日</th>
                <th>性别</th>
                <th>部门</th>
                <th>薪水</th>
                <th>登录状态</th>

            </tr>
            </thead>
            <tfoot>
            <tr>
                <th>全选反选</th>
                <th>编号</th>
                <th>用户名</th>
                <th>真实姓名</th>
                <th>生日</th>
                <th>性别</th>
                <th>部门</th>
                <th>薪水</th>
                <th>登录状态</th>
            </tr>
            </tfoot>
        </table>
    </div>

</div>
<%-- 添加部门div隐藏--%>

<div id="deptFormDiv" style="display: none">
    <%--///面板主题--%>
    <div class="container-fluid text-center">
        <form id="deptForm">
            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       部门名：
      </span>
                        <input type="text" id="deptName" name="deptName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       详情描述：
      </span>

                        <textarea id="remark" class="form-control"></textarea>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


        </form>
    </div>

</div>

<%-- 修改用户div隐藏--%>

<div id="UpdateUserFormDiv" style="display: none">
    <%--///面板主题--%>
    <div class="container-fluid text-center">
        <form id="UpdateUser">
            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
              <span class="input-group-addon">
              部门名：
               </span>
                        <input type="text"    name="deptNameClone" class="form-control" aria-label="...">
                         <input type="text" name="deptId" >

                    </div><!-- /input-group -->


                </div><!-- /.col-lg-6 -->

                <div class="col-lg-1" >
                    <button type="button" onclick="addDeptTree()" class="btn btn-xs btn-success">
                        <span class="glyphicon glyphicon-pencil"></span>
                        部门选择
                    </button>
                </div>

            </div>


            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       用户名：
      </span>
                        <input type="text"   name="userName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       真实名称：
      </span>
                        <input type="text"   name="realName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>




            <div class="row">
                <div class="col-lg-12 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       性别：
      </span>

                        <div class="col-lg-2" >    <input type="radio" value="0"   name="sex"  > 女</div>

                        <div class="col-lg-2"  > <input type="radio" value="1"   name="sex" > 男</div>

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div>




            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       生日：
      </span>
                        <input type="text"   name="birthday" class="input-sm form-control form_datetime" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       薪水：
      </span>
                        <input type="text"   name="salary" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


        </form>
    </div>

</div>


<%-- 添加用户div隐藏--%>
<div id="userFormDiv" style="display: none">
    <%--///面板主题--%>
    <div class="container-fluid text-center">
        <form id="userForm">
            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
              <span class="input-group-addon">
              部门名：
               </span>
                        <input type="text"    name="deptNameClone" class="form-control" aria-label="...">
                        <input type="text" name="deptId" >

                    </div><!-- /input-group -->


                </div><!-- /.col-lg-6 -->

                <div class="col-lg-1" >
                    <button type="button" onclick="addDeptTree()" class="btn btn-xs btn-success">
                        <span class="glyphicon glyphicon-pencil"></span>
                        部门选择
                    </button>
                </div>

            </div>


            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       用户名：
      </span>
                        <input type="text"   name="userName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       真实名称：
      </span>
                        <input type="text"   name="realName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       密码：
      </span>
                        <input type="text"   name="password" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       确认密码：
      </span>
                        <input type="text"   name="confirmPassword" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                    <!-- /.col-lg-6 -->

                </div>
            </div>




            <div class="row">
                <div class="col-lg-12 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       性别：
      </span>

                        <div class="col-lg-2" >    <input type="radio" value="0"   name="sex"  > 女</div>

                        <div class="col-lg-2"  > <input type="radio" value="1"   name="sex" > 男</div>

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
            </div>




            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       生日：
      </span>
                        <input type="text"   name="birthday" class="input-sm form-control form_datetime" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       薪水：
      </span>
                        <input type="text"   name="salary" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


        </form>
    </div>

</div>

<%--树隐藏div--%>


<%--
<div class="content_wrap" id="treeClone"  style="display: none">
    <div class="zTreeDemoBackground left" >
        <ul id="deptTreeClone" class="ztree"></ul>
    </div>
</div>--%>


<div >
   <form id="deptUser" method="post">
      <input type="text" name="sheetName"/>
       <input type="text" name="cellIds"/>

   </form>

</div>


<div id="treeDiv"></div>

<%--------------------------------------------------------------------------------------------------%>
 //js引入
<jsp:include page="/WEB-INF/common/jsReference.jsp"></jsp:include>

<script>


    $(function () {
        //查询ajax
        seach();

        //初始化表格
        initTable();
        /*ztree树*/
        areaZTree();

        areaZTreeClone()
     //时间插件
        initDate()
    })

    // 按部门导出excel
    /*function exportExcelByDept() {

        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes =  treeObj.getSelectedNodes();
       if(nodes.length!=1){
            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个部门!", function () {

            })
            return false;
        }
        //获取第一级子级节点
      var sonNodes = treeObj.getNodesByParam("pid", nodes[0].id, null);
        var sonIds="";
        //分别递归获取第一级子级节点下的所有子级节点

        for (var i = 0; i < sonNodes.length; i++) {
            //创建子级数组


            var nodes = treeObj.transformToArray(sonNodes[i]);
            //递归子级节点下所有子级节点

            sonIds=sonIds+nodes.toString()+"#"
        }

        console.log(sonIds)



        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/user/exportExcelByDept.jhtml",
            data:{"sonIds":sonIds},
            success: function (result) {
                if(result.code==200){
                    bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 导出成功!", function () {

                    })
                }else{
                    bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 导出失败!", function () {

                    })
                }

            }

        })


    }*/



    var sheetName="";
    var cellIds="";
    function exportExcelByDept(){
        sheetName="";
        cellIds="";
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var checked = treeObj.getSelectedNodes();
        if(checked.length==1){
            var nodes = treeObj.getNodesByParam("pid",checked[0].id);
            for (var i = 0; i < nodes.length; i++) {
                var sheetIds=[];
                sheetName+=nodes[i].deptName+",";
                var cellId=treeObj.transformToArray(nodes[i]);
                for (var j = 0; j <cellId.length ; j++) {
                    sheetIds.push(cellId[j].id)
                }
                cellIds+=sheetIds.join(",")+";";
            }
            $("input[name='sheetName']").val(sheetName)
            $("input[name='cellIds']").val(cellIds)
            var userForm = document.getElementById("deptUser");
            userForm.action = "<%=request.getContextPath()%>/user/exportExcelByDept.jhtml"
            userForm.submit();
        }
    }







    //重置树查询信息
    function resetTree() {
        //清空form表单
        //$("#productForm input").val("");
         document.getElementById("productForm").reset()

        //重置树
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
         treeObj.cancelSelectedNode();

        //重置datatable
        query();

    }

    //批量换部门
    function batchChangeDept() {
        if(ids.length>0){
        var   v_ids=ids.toString()

            var dialog = bootbox.dialog({
                title: '批量换部门',
                message: $("#deptTreeClone").append($("#treeDiv").clone(true)),  //获取隐藏表单
                size: 'middle',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                        callback: function () {




                        }
                    },

                    ok: {
                        label: "确定",
                        className: 'btn-info',
                        callback: function () {
                            var treeObj = $.fn.zTree.getZTreeObj("deptTreeClone");
                            var nodes = treeObj.getSelectedNodes();
                            v_deptNameClone = nodes[0].deptName
                            var  v_deptId = nodes[0].id
                            var param={};
                            param.deptId=v_deptId;
                            param.ids=v_ids;

                            $.ajax({
                                type:"post",
                                url:"<%=request.getContextPath()%>/user/batchChangeDept.jhtml",
                                data:param,
                                success:function (result) {
                                   if(result.code==200) {
                                       query();
                                   }


                                }
                            })

                        }
                    }
                }
            });



        }else{

            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个员工!", function () {

            })
        }


    }


    /*  用户删除*/
    function batchDelete() {
        var v_ids = ids.toString()
        bootbox.confirm({
            message: "你确定删除吗?",
            size: "small",//大小尺寸
            buttons: {
                confirm: {
                    label: '<span class="glyphicon glyphicon-minus-sign"/>确定',
                    className: 'btn-success'
                },
                cancel: {
                    label: '<li class="glyphicon glyphicon-check"/>取消',
                    className: 'btn-danger'
                }
            },
            callback: function (result) {

                if (result) {

                    if (v_ids == "" || v_ids == null) {

                        bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 删除项 不能为空，请选择您要删除的数据！！!", function () {

                        })
                    } else {

                        $.ajax({
                            type:"post",
                            url:"<%=request.getContextPath()%>/user/batchDelete.jhtml",
                            data:{
                                "ids":v_ids,
                            },
                            success:function (result) {
                                if(result.code==200){

                                    query();
                                }
                            }

                        })




                    }
                }
            }
        })
    }



    var  v_userid;
    //修改用户
    function updateUser() {

        //判断只能选择一个用户
        var v_deptIds=ids
        if(v_deptIds.length==1){

        var v_source_form=$("#UpdateUserFormDiv form").clone()


        dialog_dept = bootbox.dialog({
            title: '用户修改',
            message: v_source_form,//获取隐藏表单
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {

                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {

                        var deptId  =   $("input[name='deptId']",dialog_dept ).val()
                        var userName  =   $("input[name='userName']",dialog_dept ).val()
                        var realName  =   $("input[name='realName']",dialog_dept ).val()
                        var birthday  =   $("input[name='birthday']",dialog_dept ).val()
                        var salary  =    $("input[name='salary']",dialog_dept ).val()
                        var sex  =   $("input[name='sex']:checked",dialog_dept ).val()

                        console.log(deptId+"=="+userName+"=="+realName+"=="+birthday+"=="+salary+"==")



                        $.ajax({
                            type: "post",
                            url: "<%=request.getContextPath()%>/user/updateUserDept.jhtml",
                            data: {
                                "id":v_userid,
                                "dept.id": deptId,
                                "userName":userName ,
                                "realName":realName ,
                                "birthday":birthday ,
                                "salary":salary ,
                                "sex":sex
                            },
                            success: function (result) {
                                if (result.code == 200) {

                                    query();



                                }
                            }

                        })

                    }
                }
            }


        });


       //绑定时间插件
        initDate()




       //ajax  回显

            v_deptIds=  v_deptIds.toString()
            $.ajax({
              type:"post",
              url:"<%=request.getContextPath()%>/user/findUserById.jhtml",
              data:{"ids":v_deptIds},
                success: function (result) {
                  if(result.code==200){
                  v_userid  =   result.data[0].id;
                 var  v_userName  =   result.data[0].userName;
                 var  v_realName  =   result.data[0].realName;
                 var  v_birthday  =   result.data[0].birthday;
                 var  v_salary  =     result.data[0].salary;
                  var  v_deptId  =     result.data[0].dept.id;
                 var  v_deptName  =     result.data[0].dept.deptName;
                 var  v_sex  =     result.data[0].sex;


                      $("input[name='userName']",dialog_dept ).val(v_userName)
                      $("input[name='realName']",dialog_dept ).val(v_realName)
                      $("input[name='birthday']",dialog_dept ).val(v_birthday)
                      $("input[name='salary']",dialog_dept ).val(v_salary)
                      $("input[name='deptId']",dialog_dept ).val(v_deptId)
                      $("input[name='deptNameClone']",dialog_dept ).val(v_deptName)
                      //$("input[value="+v_sex+"] [type='radio']").attr("checked",true);
                     $("input[name='sex']",dialog_dept ).each(function () {
                          if(this.value==v_sex){
                              $(this).attr("checked",true);
                          }


                      })




                  }

                }

            })

        }else{

            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个部门!", function () {

            })

        }




    }






    var   v_deptNameClone;
    //添加部门树
    function addDeptTree() {
       /* $("#deptTreeClone").append($("#treeDiv").clone(true))*/
      //  var v_source_tree= $("#treeClone").html()
        var dialog = bootbox.dialog({
            title: '部门树状图',
            message: " <ul id=\"deptTreeClone\" class=\"ztree\"></ul>",  //树
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {




                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {
                        var treeObj = $.fn.zTree.getZTreeObj("deptTreeClone");
                        var nodes = treeObj.getSelectedNodes();
                        v_deptNameClone = nodes[0].deptName
                         var  v_deptId = nodes[0].id
                       /* $("input[name='deptNameClone']",dialog_dept ).attr("value",v_deptNameClone);
                        $("input[name='deptId']",dialog_dept ).attr("value",v_deptId);*/
                        $("input[name='deptNameClone']" ).val(v_deptNameClone);
                        $("input[name='deptId']" ).val(v_deptId);

                    }
                }
            }
        });
      //初始化树
       areaZTreeClone();

    }



    //用户添加
    var dialog_dept
    function addUser() {
     var v_source_form=$("#userFormDiv form").clone()


       dialog_dept = bootbox.dialog({
            title: '用户添加',
            message: v_source_form,//获取隐藏表单
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {

                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {

                   var deptId  =   $("input[name='deptId']",dialog_dept ).val()
                   var userName  =   $("input[name='userName']",dialog_dept ).val()
                   var realName  =   $("input[name='realName']",dialog_dept ).val()
                   var birthday  =   $("input[name='birthday']",dialog_dept ).val()
                   var salary  =    $("input[name='salary']",dialog_dept ).val()
                    var sex  =   $("input[name='sex']:checked",dialog_dept ).val()
                        var password  =   $("input[name='password']",dialog_dept ).val()




                      $.ajax({
                            type: "post",
                            url: "<%=request.getContextPath()%>/user/addUserDept.jhtml",
                            data: {
                                "dept.id": deptId,
                                "userName":userName ,
                                "realName":realName ,
                                "birthday":birthday ,
                                "salary":salary ,
                                "sex":sex,
                                "password":password
                            },
                            success: function (result) {
                                if (result.code == 200) {

                                    query();



                                }
                            }

                        })

                    }
                }
            }
        });


     //绑定时间插件
        initDate()

    }




    //部门删除
    function batchDeleteDept() {
        var v_ids = []
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");


        var nodes = treeObj.getSelectedNodes();

       //递归获取所有子级元素
        var nodesArray = treeObj.transformToArray(nodes);
        for (var i = 0; i < nodesArray.length; i++) {
            v_ids.push(nodesArray[i].id)

        }

        v_ids.push(nodes[0].id)
        v_ids = v_ids.toString()


        var dialog = bootbox.dialog({
            title: '部门删除',
            message: "您确认删除吗？",//获取隐藏表单
            size: 'middle',
            buttons: {
                cancel: {
                    label: "取消",
                    className: 'btn-danger',
                    callback: function () {

                    }
                },

                ok: {
                    label: "确定",
                    className: 'btn-info',
                    callback: function () {
                        $.ajax({
                            type: "post",
                            url: "<%=request.getContextPath()%>/dept/batchDeleteDept.jhtml",
                            data: {"ids": v_ids},
                            success: function (result) {
                                if (result.code == 200) {

                                    var treeObj = $.fn.zTree.getZTreeObj("deptTree");

                                    if (nodes.length > 0) {
                                        treeObj.removeChildNodes(nodes[0]);
                                        treeObj.removeNode(nodes[0]);
                                    }


                                     //刷新Datatable
                                     query();
                                }
                            }

                        })

                    }
                }
            }
        });


    }


    //部门修改
    function updateDeptInfo() {
        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();



        //  console.log(nodes[0].deptName)
        if (nodes.length == 1) {


            var v_dialog = bootbox.dialog({
                title: '部门修改',
                message: $("#deptFormDiv").html(),//获取隐藏表单
                size: 'middle',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                        callback: function () {

                        }
                    },

                    ok: {
                        label: "确定",
                        className: 'btn-info',
                        callback: function () {

                            /* 因为页面存在两个一样form表单 取值时要指明区域*/
                            /* 方法一
                             var inputDeptName=$("input[name='deptName']")
                             var  deptName=inputDeptName.last().val(  )*/
                            // 方法二
                            var v_deptName = $("input[name='deptName']", v_dialog).val();
                            var v_remark = $("#remark").val();

                            $.ajax({
                                type: "post",
                                url: "<%=request.getContextPath()%>/dept/updateDeptInfo.jhtml",
                                data: {
                                    "id": nodes[0].id,
                                    "pid": nodes[0].pid,
                                    "deptName": v_deptName,
                                    "remark": v_remark
                                },
                                success: function (result) {
                                    if (result.code == 200) {

                                        if (nodes.length > 0) {
                                            nodes[0].deptName = v_deptName;
                                            treeObj.updateNode(nodes[0]);
                                        }


                                        /* //刷新ztree
                                         areaZTree();*/

                                    }

                                }


                            })


                        }
                    }
                }


            });

            /* var inputDeptName=$("input[name='deptName']")
             inputDeptName.last().val(nodes[0].deptName)
 */
            $("input[name='deptName']",v_dialog).attr("value", nodes[0].deptName)
            $("#remark",v_dialog).html(nodes[0].remark)

        } else {
            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个部门!", function () {

            })
        }


    }


    //部门添加

    function addDept() {

        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
        var nodes = treeObj.getSelectedNodes();




        if (nodes.length == 1) {


            var v_dialog = bootbox.dialog({
                title: '部门添加',
                message: $("#deptFormDiv").html(),//获取隐藏表单
                size: 'middle',
                buttons: {
                    cancel: {
                        label: "取消",
                        className: 'btn-danger',
                        callback: function () {

                        }
                    },

                    ok: {
                        label: "确定",
                        className: 'btn-info',
                        callback: function () {
                            /* var  input=   $("input[name='deptName']");
                             var   deptName =  input.last().val()
                             console.log("====="+deptName)*/
                            // alert($("[name='deptName']").html())

                            var v_deptName = $("input[name='deptName']", v_dialog).val()
                            var v_remark = $("#remark", v_dialog).val();

                            $.ajax({
                                type: "post",
                                url: "<%=request.getContextPath()%>/dept/addDeptInfo.jhtml",
                                data: {
                                    "pid": nodes[0].id,
                                    "deptName": v_deptName,
                                    "remark": v_remark
                                },
                                success: function (result) {
                                    //后台反射新增下条id
                                   var v_id = result.data;
                                    console.log(result.data)
                                    if (result.code == 200) {

                                        var treeObj = $.fn.zTree.getZTreeObj("deptTree");
                                        //新建子节点
                                        //赋值方式一
                                      //  var newNode = {id:v_id,deptName: v_deptName,pid:nodes[0].id,remark: v_remark};
                                        //赋值方式二
                                        var param={}
                                        param.id=v_id;
                                        param.pid=nodes[0].id;
                                        param.deptName=v_deptName;
                                        param.remark=v_remark;
                                        var newNode = param;


                                        treeObj.addNodes(nodes[0], newNode);

                                    }

                                }


                            })


                        }
                    }
                }
            });

        } else {
            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个部门!", function () {

            })
        }

    }


    //时间格式转换
function initDate(){
    $(".form_datetime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",
        showClean: true

    });
}


/*=======================================================================*/

    var  v_ids=[];

    ///点击树按部门查询
  function zTreeOnClick(event, treeId, treeNode) {
      //每次点击清空数组
      v_ids=[];
      //获取被选中的节点
      var treeObj = $.fn.zTree.getZTreeObj("deptTree");
      var nodes = treeObj.getSelectedNodes();

     //递归获取所有子级元素

      var nodesArray = treeObj.transformToArray(nodes);

      for (var i = 0; i < nodesArray.length; i++) {

         if(!isExit(nodesArray[i].id)){

              v_ids.push(nodesArray[i].id)

          }

          }


    //v_ids.push(nodes[0].id)
 console.log("+++=="+v_ids)
      var  param={};

      param.ids = v_ids.toString()
      userTable.settings()[0].ajax.data = param;
      userTable.ajax.reload();



    };
   //ids 是否存在
    function isExit(id) {
        for (var i = 0; i < v_ids.length; i++) {
            if (v_ids[i]==id){

                return true;
            }
                }
    }

    /*ztree树*/
    function areaZTree() {


        var setting = {

          callback: {
                onClick: zTreeOnClick
            },

            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "pid",
                },
                key: {
                    name: "deptName"
                }
            },


        };


        $.ajax({
            url: "<%=request.getContextPath()%>/dept/findZTreeDept.jhtml",
            data: {},
            type: "post",

            success: function (result) {
                console.log(result.data)


                $.fn.zTree.init($("#deptTree"), setting, result.data);
               // $.fn.zTree.init($("#deptTreeClone"), setting, result.data);
            },

        })


    }

  function areaZTreeClone() {

      var setting = {


          data: {
              simpleData: {
                  enable: true,
                  pIdKey: "pid",
              },
              key: {
                  name: "deptName"
              }
          },


      };


      $.ajax({
          url: "<%=request.getContextPath()%>/dept/findZTreeDept.jhtml",
          data: {},
          type: "post",

          success: function (result) {
              console.log(result.data)

              $.fn.zTree.init($("#deptTreeClone"), setting, result.data);
          },

      })



  }


    <%--------------------------------------------------------------------------------------------------%>


    var ids = [];

    function initCheckbox() {
        //回填复选框
        $("#userTable tbody ").find("input[type='checkbox']").each(function () {

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


    function initTable() {


        $("#userTable tbody ").on("click", "tr", function () {
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
        param.userName = $("#brandName").val();
        param.minBirthday = $("#minBirthday").val()
        param.maxBirthday = $("#maxBirthday").val()
        param.minSalary = $("#minSalary").val()
        param.maxSalary = $("#maxSalary").val()
        userTable.settings()[0].ajax.data = param;
        userTable.ajax.reload();
    }


    var userTable;

    function seach(result) {
        userTable = $("#userTable").DataTable({
            //所有禁用排序
            order: false,
            // 排序
            columnDefs: [{
                'targets': [0, 1, 3, 4, 5, 8],
                'orderable': false
            }],


            ///回调函数
            "fnDrawCallback": function (oSettings) {
                console.log(oSettings);
                initCheckbox();

            },


            //汉化
            language: {
                url: "/DataTables/Chinese.json"
            },


            "lengthMenu": [5, 10, 15],
            "bFilter": false,
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<%=request.getContextPath()%>/user/findUserList.jhtml",
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
                {
                    "data": "id",
                    //复选框
                    render: function (data, type, row, meta) {
                        return "<input type='checkbox' value='" + data + "' id='singleCheckbox' name='checkboxSingle'  >";
                    }
                },

                {"data": "id"},
                {"data": "userName"},
                {"data": "realName"},
                {"data": "birthday"},


                {
                    "data": "sex",
                    render: function (data, type, row, meta) {
                        var sex;
                        if (data == 1) {
                            sex = "男"
                        } else {
                            sex = "女"
                        }
                        return sex;
                    }
                },

                {"data": "deptName"},
                {"data": "salary"},
                {
                    "data": "loginStatus",
                    render: function (data, type, row, meta) {
                        var logStatus;
                        if (data == 200) {
                            logStatus = "ok"
                        } else {
                            logStatus = "error"
                        }
                        return logStatus;
                    }
                },

            ],


        });
    }


    /*用户添加  */



    /*  用户修改*/



</script>


</body>
</html>