<%@ page import="com.fh.shop.backend.po.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <link rel="stylesheet" href="/bootstrap-fileInput/css/fileinput.min.css">
    <link rel="stylesheet" href="/bootstrap-fileInput/css/fileinput-rtl.min.css">


    <style>
        body {padding-top:50px;}
    </style>
</head>
<body>

<div>
<div>
    <h3 style="color: #66F4DF">您好，<font color="#9acd32">${user.realName}</font>;您上次登录的时间是
        <font color="red"><fmt:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </font>  ;
        今天您是第<font color="red">${user.times}</font>次登录</h3>
</div>
    <div style="float: right">

        <button onclick="quitLogin()" type="button" class="btn btn-sm btn-warning">
            <span class="glyphicon glyphicon-log-out"></span>
          退出
        </button>
    </div>

</div>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">

            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/brand/toFindBrandList.jhtml" id="menu-toggle">
                品牌模块
            </a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" >
            <ul class="nav navbar-nav">
                <li class="active"><a href="<%=request.getContextPath()%>/user/toFindUserList.jhtml">用户模块 <span class="sr-only">(current)</span></a></li>
                <li><a href="<%=request.getContextPath()%>/log/toFindLogList.jhtml">日志模块</a></li>
                <li><a href="<%=request.getContextPath()%>/product/toFindList.jhtml">产品模块</a></li>
                <li><a href="<%=request.getContextPath()%>/area/toFindAreaList.jhtml">地区模块</a></li>
                <li><a href="<%=request.getContextPath()%>/member/toFindMemberList.jhtml">会员模块</a></li>
               <%-- <li><a href="#">明星学员</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">java课程 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">云计算</a></li>
                        <li><a href="#">云应用</a></li>
                        <li><a href="#">云服务</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">大数据</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">数据挖掘</a></li>
                    </ul>
                </li>--%>
            </ul>
        </div><!-- /.navbar-collapse -->

        <div >
            <%--用户登录信息展示--%>

        </div>
    </div><!-- /.container-fluid -->

</nav>
<%--<div class="panel panel-success">
    <div class="panel-heading">
        <%User user=(User)request.getSession().getAttribute("user");%>
        <% SimpleDateFormat sim=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>
        <h3>您好，<%=user.getUserName()%>;您上次登录的时间是 <%=sim.format(user.getLonginTime())%>;今天您是第${user.times+1} 次登录</h3>
    </div>
</div>--%>
<%--==============================================================================================================--%>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title">商品查询</h3>
    </div>
        <div class="panel-body">



    <%--///面板主题--%>
    <div class="container-fluid text-center">
        <form id="productForm">
            <div class="row">
                <div class="col-lg-3">

                    <div class="input-group">
             <span class="input-group-addon">
      产品名称：
      </span>
                        <input type="text" id="productName" class="form-control" aria-label="...">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


            <div class="row">
                <div class="col-lg-6">

                    <div class="input-group">
             <span class="input-group-addon">
      产品价格：
      </span>
                        <input type="text" id="minPrice" class="form-control" aria-label="...">
                        <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                        <input type="text" id="maxPrice" class="form-control" aria-label="...">
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
                        <input type="text" name="createTime" id="maxCreateTime" class="form-control" aria-label="...">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>

            <div class="row">
                <div class="col-lg-6">

                    <div class="input-group">
             <span class="input-group-addon">
      修改时间：
      </span>
                        <input type="text" name="updateTime" id="minUpdateTime" class="input-sm form-control form_datetime">
                        <span class="input-group-addon">
      <span class="glyphicon glyphicon-resize-horizontal"></span>
      </span>
                        <input type="text" name="updateTime" id="maxUpdateTime" class="form-control" style="float: left">
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->

            </div>


            <div class="row">
                <div class="col-lg-3">

                    <div class="input-group">
             <span class="input-group-addon">
      产品品牌：
      </span>
                        <select id="brandSelect" class="form-control">
                            <option value="-1">---请选择---</option>
                        </select>
                    </div><!-- /input-group -->
                </div><!-- /.col-lg-6 -->
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
    <button onclick="exitExcel()" type="button" class="btn btn-sm btn-success">
        <span class="glyphicon glyphicon-save"></span>
        Excel导出
    </button>

    <button onclick="addProduct()" type="button" class="btn btn-sm btn-warning">
        <span class="glyphicon glyphicon-plus"></span>
        添加商品
    </button>

    <button onclick="batchDelete()" type="button" class="btn btn-danger">
        <span class="glyphicon glyphicon-remove"></span>
        批量删除
    </button>
</div>


    </div>


<%--class="table table-striped table-bordered"--%>
<table id="productTable" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>全选反选</th>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品图片</th>
        <th>商品品牌</th>
        <th>商品价格</th>
        <th>创建时间</th>
        <th>修改时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tfoot>
    <tr>
        <th>全选反选</th>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品图片</th>
        <th>商品品牌</th>
        <th>商品价格</th>
        <th>创建时间</th>
        <th>修改时间</th>
        <th>操作</th>
    </tr>
    </tfoot>
</table>

<%--产品添加隐藏div--%>
<div class="container-fluid" id="addProductFormDiv" style="display: none" >

    <div class="row">

        <div class="col-md-12" id="bodyDiv" style="float: left;width: 100%">

            <form class="form-horizontal" role="form"  method="post"  >
                <fieldset>

                    <div class="form-group">
                        <label class="col-md-2 control-label" for="ds_host">产品名称</label>
                        <div class="col-md-8">
                            <input name="productName" class="form-control" id="ds_host" type="text" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="ds_name">产品价格</label>
                        <div class="col-md-8">
                            <input name="price" class="form-control" id="ds_name" type="text" placeholder="产品价格">
                        </div>
                    </div>
                   <%-- 图片展示--%>
                    <div class="form-group" id="headerImageDiv"></div>
                   <%-- <div class="form-group" style="display: none" id="showImage" >

                            <label class="col-sm-2 control-label">主图</label>
                            <div class="col-sm-7">
                                <div name="childPicture" class="col-sm-3">
                                    <div class="col-sm-2" id="headerImageDiv">



                                    </div>
                                    <div  class="col-sm-2 col-md-offset-2">
                                        <button  onclick="removeHeadImage(this)" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                    </div>

                                </div>
                            </div>
                        </div>--%>
                    <div class="form-group">
                        <label class="col-md-2 control-label">图片添加</label>

                        <div class="col-md-8">
                           <%-- <div class="col-md-10" id="headerImageDiv"></div>--%>
                            <!--=====================================-->
                            <div class="col-md-10">
                                <input id="file" name="uploadfile" type="file" value="上传" multiple/>
                                <input id="ImgPath" name="ImgPath">
                                <p class="help-block">支持jpg、jpeg、png、gif,txt,"docx","zip","xlsx"格式，大小没限制</p>
                            </div>
                            <!--=====================================-->

                        </div>
                        <div class="col-md-1"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                    </div>


                    <div class="form-group">
                        <label class="col-md-2 control-label">品牌添加</label>
                        <div class="col-md-8">
                            <select name="brand.id" id="selectBrand" class="form-control">
                                <option value="-1">---请选择---</option>
                            </select>
                        </div>
                    </div>


                </fieldset>

                <%-- 子图展示--%>
                <div   class="form-group"  id="childImageDiv">



                </div>
                <%--多图片添加--%>
                <div id="imageInput">

                </div>


                <%--隐藏域--%>
                <input type="hidden" name="id" /><br>
                <input type="text" name="ImgPath" /><br>
                <input type="hidden" name="imageCode" id="imageCode"/><br>
                <input type="hidden" name="oldImagePath" id="oldImagePath"/><br>

            </form>




        </div>
    </div>
</div>

<%--产品修改隐藏div--%>
<%--<div class="container-fluid" >

    <div class="row">

        <div class="col-sm-8" style="float: left;width: 100%">

            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/product/updateProduct.jhtml" method="post" enctype="multipart/form-data" >
                <fieldset>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">产品名称</label>
                        <div class="col-sm-4">
                            <input value="${product.productName}" name="productName" class="form-control"  type="text" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_name">产品价格</label>
                        <div class="col-sm-4">
                            <input value="${product.price}" name="price" class="form-control"  type="text" placeholder="产品价格">
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-sm-2 control-label">主图</label>
                        <div class="col-sm-7">
                            <div name="childPicture" class="col-sm-3">
                                <div class="col-sm-2">
                                    &lt;%&ndash;<button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>&ndash;%&gt;
                                    <img src="<%=request.getContextPath()%>${product.imagePath}" width="50px" height="50px">
                                    <input type="hidden" name="imagePath" value="${product.imagePath}">
                                </div>
                                <div  class="col-sm-2 col-md-offset-2">
                                    <button  onclick="removeHeadImage(this)" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">图片添加</label>
                        <div class="col-sm-4">

                            <!--=====================================-->
                            <div class="col-sm-12">
                                <input id="file" name="uploadImgFile" type="file" value="上传" multiple/>
                                <input id="ImgPath" name="ImgPath">
                                <p class="help-block">支持jpg、jpeg、png、gif,txt,"docx","zip","xlsx"格式，大小没限制</p>
                            </div>
                            <!--=====================================-->

                        </div>
                        <div class="col-md-3"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">品牌添加</label>
                        <div class="col-sm-4">
                            <select name="brand.id" id="brandSelect" class="form-control">
                                <option value="-1">---请选择---</option>
                            </select>
                        </div>
                    </div>


                </fieldset>

                <div class="form-group" >
                    <div class="col-md-offset-3">
                        <button  class="btn btn-success  col-sm-2" type="submit">
                            <i class="glyphicon glyphicon-ok"></i>
                            Submit
                        </button>
                    </div>
                    <div class=" col-md-offset-3">
                        <button class="btn btn-group-lg  col-sm-2" type="reset">
                            <i class="glyphicon glyphicon-refresh"></i>
                            Reset
                        </button>
                    </div>
                </div>
                &lt;%&ndash; 子图展示&ndash;%&gt;
                <div   class="form-group" style="margin-left: 200px">

                    <c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
                        <c:if test="${product.id==imageVO.productId}">
                            <div name="childPicture" class="col-sm-3">
                                <div class="row">
                                        &lt;%&ndash;<button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>&ndash;%&gt;
                                    <img src="<%=request.getContextPath()%>${imageVO.productImagePath}" width="50px" height="50px">

                                </div>
                                <div  class="row">
                                    <button  onclick="removeInputRemove(this,'${imageVO.productImagePath}','${imageVO.id}')" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-remove"></span></button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>

                &lt;%&ndash;多图片添加&ndash;%&gt;
                <div id="imageInput">

                </div>





                &lt;%&ndash;隐藏域&ndash;%&gt;
                <input type="hidden" name="id" value="${product.id}"/><br>
                &lt;%&ndash;  <input type="hidden" name="imagePath" value="${product.imagePath}"/><br>&ndash;%&gt;
                <input type="hidden" name="imageCode" id="imageCode"/><br>
                <input type="hidden" name="oldImagePath" id="oldImagePath"/><br>
            </form>




        </div>
    </div>
</div>--%>



<%--------------------------------------------------------------------------------------------------%>


<script src="<%=request.getContextPath()%>/DataTables/jquery-3.3.1.js"></script>
<script src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
<script src="/bootbox/bootbox.all.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js" ></script>

<script src="/bootstrap-fileInput/js/fileinput.min.js"></script>





<script>


    $(document).ready(function () {
        //查询ajax
        seach();
        //下拉框
        initSelect("brandSelect");
        //初始化表格
        initTable();
    });


    /*退出登录*/
function quitLogin() {
    location.href="<%=request.getContextPath()%>/user/quitLogin.jhtml"

}
    function initBrandSelect(elementSelect,brandId){
        alert(111)
        $.ajax({
            url:contextPath+"/brand/findBrandSelect.jhtml",
            type:"post",
            success:function(result){
                var brandList=result.data
                alert(result.code)
                if(result.code==200){
                    for (var i = 0; i < brandList.length; i++) {
                        $("#"+elementSelect,dialog).append("<option value='"+brandList[i].id+"'>"+brandList[i].brandName+"</option>")
                    }
                }
                //alert(!undefined)
                if(brandId){
                    $("#"+elementSelect,dialog).val(brandId);

                }


            }

        })

    }
   //回显产品
    var v_product
    function toUpdateProduct(id){


        $.ajax({
            type:"post",
            url:"<%=request.getContextPath()%>/product/toUpdateProduct.jhtml",
            data:{"id":id},
            success:function (result) {
                 v_product=result.data

                if(result.code==200) {
                    $("input[name='id']",dialog).val(v_product.id);
                    $("input[name='productName']",dialog).val(v_product.productName);
                    $("input[name='price']",dialog).val(v_product.price);
                    $("input[name='ImgPath']",dialog).val(v_product.imagePath);
                    $("#selectBrand",dialog).val(v_product.brand.id);
                   // $("#showImage").css("display","");
                   // $("#headerImageDiv",dialog).html("<img src='"+<%=request.getContextPath()%>v_product.imagePath+"'></img>")
                    $("#headerImageDiv",dialog).html("<label class=\"col-sm-2 control-label\">主图</label>\n" +
                        "                        <div class=\"col-sm-7\">\n" +
                        "                            <div name=\"childPicture\" class=\"col-sm-3\">\n" +
                        "                                <div class=\"col-sm-2\">\n" +
                        "<img src='"+<%=request.getContextPath()%>v_product.imagePath+"'></img>"+

                        "                                    \n" +
                        "                                </div>\n" +
                        "                                <div  class=\"col-sm-2 col-md-offset-2\">\n" +
                        "                                    <button  onclick=\"removeHeadImage(this)\" class=\"btn btn-group-lg  \" type=\"button\"><span class=\"glyphicon glyphicon-remove\"></span></button>\n" +
                        "                                </div>\n" +
                        "\n" +
                        "                            </div>\n" +
                        "                        </div>")
                }


            }
        })


    }
    /* 删除主图*/
    function removeHeadImage(obj) {
        $(obj,dialog).closest(".form-group").remove()

    }

    //删除原有inputFile
    function removeInputRemove(obj, uuid, id) {

        v_imageCode += "#" + uuid;
        v_imageId += "#" + id;

        $("#imageCode",dialog).val(v_imageCode)
        $("#oldImagePath",dialog).val(v_imageId)
        $(obj,dialog).parents("div[name='childPicture']").remove();
    }


   /* 子图回显*/
   function showChildImage(id){

       $.ajax({
           type:"post",
           url:"<%=request.getContextPath()%>/product/toUpdateImage.jhtml",
           data:{"id":id},
           success:function (result) {
               var v_image=result.data

               if(result.code==200) {
                var item
                   for (var i = 0; i < v_image.length; i++) {
                       var imageVO=v_image[i]


                           item+="<div name=\"childPicture\" class=\"col-sm-3\">\n" +
                               "    <div class=\"row\">\n" +
                               "        <img src='"+imageVO.productImagePath+"' width='50px' height='50px'>" +
                               "\n" +
                               "    </div>\n" +
                               "    <div  class=\"row\">\n" +
                               "        <button  onclick='removeInputRemove(this,"+imageVO.productImagePath+","+imageVO.id+")' class='btn btn-group-lg'  type='button'><span class='glyphicon glyphicon-remove'></span></button>" +
                               "    </div>\n" +
                               "</div>"



                   }


                   $("#childImageDiv",dialog).html(item)

                           }


                   }






       })


   }



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


    function initFileInput(obj) {

        $("#file",obj).fileinput({
            //初始化上传文件框
            language: "zh",//配置语言
            showUpload : true, //显示整体上传的按钮
            showRemove : true,//显示整体删除的按钮
            uploadAsync: true,//默认异步上传
            uploadLabel: "上传",//设置整体上传按钮的汉字
            removeLabel: "移除",//设置整体删除按钮的汉字
            uploadClass: "btn btn-primary",//设置上传按钮样式
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            uploadUrl: "<%=request.getContextPath()%>/file/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize : 2000,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions : ["jpg", "png","gif","docx","zip","xlsx","txt"],/*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            console.log(data);
            $("#ImgPath",dialog).val($("#ImgPath",dialog).val()+","+data.response.msg);
        });

    }



    //动态提交form表单 poi导出
    function exitExcel() {
        var productForm = document.getElementById("productForm");
        productForm.action = "<%=request.getContextPath()%>/product/exitExcel.jhtml";
        productForm.submit();
    }


    //详细图片展示
    function lookPicture(obj) {

        location.href = "<%=request.getContextPath()%>/product/lookPicture.jhtml?id=" + obj;

    }
    var dialog
    /*  添加/!**!/  */
    function addProduct() {
       // location.href = "<%=request.getContextPath()%>/product/toAdd.jhtml"
        var v_source_form=$("#addProductFormDiv form").clone()
        dialog = bootbox.dialog({
            title: '修改产品',
            message:v_source_form ,  //获取隐藏表单
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

                        var param={};
                        param.productName=$("input[name='productName']",dialog).val();
                        param.price=$("input[name='price']",dialog).val();
                        param.ImgPath=$("input[name='ImgPath']",dialog).val();
                        param["brand.id"]=$("#selectBrand",dialog).val();


                        $.ajax({
                            type:"post",
                            url:"<%=request.getContextPath()%>/product/addProduct.jhtml",
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

         /*图片上传*/
        initFileInput(dialog);
        //下拉框
        initBrandSelect("selectBrand");



    }


    /*修改*/

    function updateProduct(productId) {

        // location.href = "<%=request.getContextPath()%>/product/toUpdateProduct.jhtml?id=" + obj;
        var v_source_form=$("#addProductFormDiv form").clone()
        dialog = bootbox.dialog({
            title: '修改产品',
            message:v_source_form ,  //获取隐藏表单
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

                        var param={};
                        param.productName=$("input[name='productName']",dialog).val();
                        param.price=$("input[name='price']",dialog).val();
                        param.ImgPath=$("input[name='ImgPath']",dialog).val();
                        param["brand.id"]=$("#selectBrand",dialog).val();


                        $.ajax({
                            type:"post",
                            url:"<%=request.getContextPath()%>/product/addProduct.jhtml",
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

        /*图片上传*/
        initFileInput(dialog);
        //下拉框
        initBrandSelect("selectBrand");
        toUpdateProduct(productId);
        showChildImage(productId);




    }


    /*  删除 */
    function deleteProduct(obj) {


       /* bootbox.alert("This is an alert with a callback!", function(){
            console.log('This was logged in the callback!');
        });*/

       bootbox.confirm({
            message: "你确定删除吗?",
             size:  "small",
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
            console.log("==============="+result);
                if (result) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/product/deleteProduct.jhtml",
                        dataType: "json",
                        type: "POST",

                        data: {"id": obj},
                        async: true,
                        success: function (result) {
                            //alert(result.code)
                            if (result.code == 200) {

                                query();

                            } else {
                                bootbox.alert("<span class='glyphicon glyphicon-bell'></span> "+result.msg+"!", function(){

                                })
                            }

                            <%--     	location.href="<%=request.getContextPath()%>/product/findProductList.jhtml"	--%>
                        },
                        error: function () {
                        }
                    })
                }

            }
        });


    }


    /* 批量删除 */

    function batchDelete() {
        //不能用全局变量
        var v_ids = "";
        $("input[name='checkboxSingle']:checkbox:checked").each(function () {
            v_ids += "," + this.value
        })
        var ids = v_ids.substring(1)
        //是否为空

        if (ids.length > 0) {


            bootbox.confirm({
                message: "你确定删除吗?",
                size:  "small",
                buttons: {
                    confirm: {
                        label: '确定',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: '取消',
                        className: 'btn-danger'
                    }
                },
                callback: function (result) {
                    console.log("==============="+result);
            if (result) {
                $.ajax({
                    url: "<%=request.getContextPath()%>/product/batchDelete.jhtml",
                    type: "post",
                    //dataType:"json",
                    data: {"ids": ids},
                    async: true,
                    success: function (result) {
                        //alert(result.code)
                        if (result.code == 200) {

                            query();

                        } else {
                            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> "+result.msg+"!", function(){

                            })

                        }
                        <%-- alert(data)
                        location.href="<%=request.getContextPath()%>/product/findProductList.jhtml"	 --%>
                    }

                })
            }
                }
            })



        } else {
            bootbox.alert("<span class='glyphicon glyphicon-bell'></span> 请选择需要删除的数据!", function(){

            })

        }


    }




    /* 查看子图*/


    var ids = [];

    function initCheckbox() {
        //回填复选框
        $("#productTable tbody ").find("input[type='checkbox']").each(function () {

            for (var i = 0; i < ids.length; i++) {

                if (this.value == ids[i]) {
                  //  alert(this.value)
                    this.checked = true;
                    $(this).parents("tr").css("background", "red");
                }

            }


        })


    }


    function initTable() {


        $("#productTable tbody ").on("click", "tr", function () {
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
        param.productName = $("#productName").val();
        param.minPrice = $("#minPrice").val();
        param.maxPrice = $("#maxPrice").val();
        param.minCreateTime = $("#minCreateTime").val();
        param.maxCreateTime = $("#maxCreateTime").val();
        param.minUpdateTime = $("#minUpdateTime").val();
        param.maxUpdateTime = $("#maxUpdateTime").val();
        param.brandId = $("#brandSelect").val();
        productTable.settings()[0].ajax.data = param;
        productTable.ajax.reload();
    }


    var productTable;

    function seach() {
        productTable = $("#productTable").DataTable({






            //所有禁用排序
            /*order:false,*/
           // 排序
            columnDefs:[{
                'targets' : [0,1,2,3,4,8],
                'orderable' : false
            }],

            "oAria": {
                "sSortAscending": "asc",
                "sSortDescending": "desc",
            },
            ///回调函数
            "fnDrawCallback": function (oSettings) {

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
                "url": "<%=request.getContextPath()%>/product/findProductListByDatatable.jhtml",
                "type": "POST",
                dataSrc: function (result) {
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
                {"data": "productName"},
                {
                    "data": "imagePath",
                    render: function (data, type, row, meta) {
                        return "<img src='"+data+"' style='width: 90px' >";
                    }
                },
                {"data": "brand.brandName"},
                {"data": "price"},
                {"data": "createTime",
                    "render": function (data, type, row, meta) {
                        //时间格式化
                        var date = new Date(data);
                        return date.toLocaleString();
                    }

                },
                {"data": "updateTime",
                    "render": function (data, type, row, meta) {
                        //时间格式化
                        var date = new Date(data);
                        return date.toLocaleString();
                    }

                },
                {  "data": "id",
                    //删除
                    render: function (data, type, row, meta) {

                        return "<button onclick='updateProduct(" + data + ")'  type=\"button\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-pencil\">修改</button>" +
                            "<button onclick='deleteProduct(" + data + ")'  type=\"button\" class=\"btn btn-danger\"><span class=\"glyphicon glyphicon-remove\"> 删除</button>" +
                            "<button onclick='lookPicture(\""+data+"\")'  type=\"button\" class=\"btn btn-success\"><span class=\"glyphicon glyphicon-search\">查看子图</button>";

                    }

                },
            ],


        });
    }
</script>
</body>
</html>
