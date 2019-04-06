
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/common/cssReference.jsp"/>
    <title>Title</title>
</head>
<body>

<div class="container-fluid">


<div class="col-md-4">
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">地区
            <button type="button" onclick="addArea()" class="btn btn-xs btn-warning">
                <span class="glyphicon glyphicon-plus"></span>
                添加地区
            </button>
            <button type="button" onclick="updateAreaInfo()" class="btn btn-xs btn-success">
                <span class="glyphicon glyphicon-pencil"></span>
                修改地区
            </button>

            <button type="button" onclick="batchDeleteArea()" class="btn btn-xs btn-danger">
                <span class="glyphicon glyphicon-remove"></span>
                删除地区
            </button>

        </h3>
    </div>
    <div class="panel-body">


        <div class="content_wrap">
            <div class="zTreeDemoBackground left" id="TreeDiv">
                <ul id="areaTree" class="ztree"></ul>
            </div>
        </div>


        树状图
    </div>
</div>
</div>
</div>

<%-- 添加地区div隐藏--%>

<div id="areaFormDiv" style="display: none">
    <%--///面板主题--%>
    <div class="container-fluid text-center">
        <form id="deptForm">
            <div class="row">
                <div class="col-lg-7 col-md-offset-2">

                    <div class="input-group">
             <span class="input-group-addon">
       地区名：
      </span>
                        <input type="text" id="cityName" name="cityName" class="form-control" aria-label="...">

                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>




        </form>
    </div>

</div>



<%--//js引入--%>
<jsp:include page="/WEB-INF/common/jsReference.jsp"></jsp:include>

<script>
   $(function () {
    //加载地区树
    areaZTree();
})
   //加载地区树
    function areaZTree() {

        var setting = {


            data: {
                simpleData: {
                    enable: true,
                    pIdKey: "pid",
                },
                key: {
                    name: "cityName"
                }
            },


        };


        $.ajax({
            url: "<%=request.getContextPath()%>/area/findZTreeArea.jhtml",
            data: {},
            type: "post",

            success: function (result) {
             //   console.log(result.data)

                $.fn.zTree.init($("#areaTree"), setting, result.data);
            },

        })



    }

   //三级联动
   function initCity() {
       //省
       //alert(1111)
       $.ajax({
           type:"post",
           // url:"/api/member/findShengList.jhtml",
           url:"http://192.168.1.62:8082/api/member/toAddMember.jhtml",
           dataType:"jsonp",
           data:{"pid":1},
           success:function (result) {
               console.log(result) ;
               var  city=result.data;
               var   cityOption="<option value=\"-1\">=省=</option>"
               for (var i = 0; i < city.length; i++) {
                   cityOption+="<option value='"+city[i].id+"'>"+city[i].cityName+"</option>";

               }

               $("#shengid").html(cityOption)
           }
       })

       //市
       $("#shengid").on("change",function () {


           $.ajax({
               type:"post",
               // url:"/api/member/findShengList.jhtml",
               url:"http://192.168.1.62:8082/api/member/toAddMember.jhtml",
               dataType:"jsonp",
               data:{"pid":$("#shengid").val()},
               success:function (result) {
                   console.log(result) ;
                   var  city=result.data;
                   var   cityOption="<option value=\"-1\">=市=</option>"
                   for (var i = 0; i < city.length; i++) {
                       cityOption+="<option value='"+city[i].id+"'>"+city[i].cityName+"</option>";

                   }
                   $("#shiid").html(cityOption)

               }
           })


       })

       //县
       $("#shiid").on("change",function () {


           $.ajax({
               type:"post",
               // url:"/api/member/findShengList.jhtml",
               url:"http://192.168.1.62:8082/api/member/toAddMember.jhtml",
               dataType:"jsonp",
               data:{"pid":$("#shiid").val()},
               success:function (result) {
                   console.log(result) ;
                   var  city=result.data;
                   var   cityOption="<option value=\"-1\">=县=</option>"
                   for (var i = 0; i < city.length; i++) {
                       cityOption +="<option value='"+city[i].id+"'>"+city[i].cityName+"</option>";

                   }

                   $("#xianid").html(cityOption)
               }
           })


       })





   }


   //添加地区
    function addArea() {

        var treeObj = $.fn.zTree.getZTreeObj("areaTree");
        var nodes = treeObj.getSelectedNodes();




        if (nodes.length == 1) {


            var v_dialog = bootbox.dialog({
                title: '地区添加',
                message: $("#areaFormDiv").html(),//获取隐藏表单
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


                            var v_cityName = $("input[name='cityName']", v_dialog).val()
                            var v_remark = $("#remark", v_dialog).val();

                            $.ajax({
                                type: "post",
                                url: "<%=request.getContextPath()%>/area/addAreaInfo.jhtml",
                                data: {
                                    "pid": nodes[0].id,
                                    "cityName": v_cityName,

                                },
                                success: function (result) {
                                    //后台反射新增下条id
                                    var v_id = result.data;
                                    console.log(result.data)
                                    if (result.code == 200) {

                                        var treeObj = $.fn.zTree.getZTreeObj("areaTree");
                                        //新建子节点
                                        //赋值方式一
                                        //  var newNode = {id:v_id,cityName: v_cityName,pid:nodes[0].id,remark: v_remark};
                                        //赋值方式二
                                        var param={}
                                        param.id=v_id;
                                        param.pid=nodes[0].id;
                                        param.cityName=v_cityName;

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
            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个地区!", function () {

            })
        }



    }

   //地区删除
   function batchDeleteArea() {
       var v_ids = []
       var treeObj = $.fn.zTree.getZTreeObj("areaTree");


       var nodes = treeObj.getSelectedNodes();

       //递归获取所有子级元素
       var nodesArray = treeObj.transformToArray(nodes);
       for (var i = 0; i < nodesArray.length; i++) {
           v_ids.push(nodesArray[i].id)

       }

       v_ids.push(nodes[0].id)
       v_ids = v_ids.toString()


       var dialog = bootbox.dialog({
           title: '地区删除',
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
                           url: "<%=request.getContextPath()%>/area/batchDeleteArea.jhtml",
                           data: {"ids": v_ids},
                           success: function (result) {
                               if (result.code == 200) {

                                   var treeObj = $.fn.zTree.getZTreeObj("areaTree");

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


   //地区修改
   function updateAreaInfo() {
       var treeObj = $.fn.zTree.getZTreeObj("areaTree");
       var nodes = treeObj.getSelectedNodes();



       //  console.log(nodes[0].cityName)
       if (nodes.length == 1) {


           var v_dialog = bootbox.dialog({
               title: '地区修改',
               message: $("#areaFormDiv").html(),//获取隐藏表单
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
                            var inputAreaName=$("input[name='cityName']")
                            var  cityName=inputAreaName.last().val(  )*/
                           // 方法二
                           var v_cityName = $("input[name='cityName']", v_dialog).val();


                           $.ajax({
                               type: "post",
                               url: "<%=request.getContextPath()%>/area/updateAreaInfo.jhtml",
                               data: {
                                   "id": nodes[0].id,
                                   "pid": nodes[0].pid,
                                   "cityName": v_cityName,

                               },
                               success: function (result) {
                                   if (result.code == 200) {

                                       if (nodes.length > 0) {
                                           nodes[0].cityName = v_cityName;
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

           /* var inputAreaName=$("input[name='cityName']")
            inputAreaName.last().val(nodes[0].cityName)
*/
           $("input[name='cityName']",v_dialog).attr("value", nodes[0].cityName)

       } else {
           bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择一个地区!", function () {

           })
       }


   }






</script>

</body>
</html>
