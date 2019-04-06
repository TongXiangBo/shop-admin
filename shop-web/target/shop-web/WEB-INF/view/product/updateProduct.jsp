<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>、
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/bootstrap-fileInput/css/fileinput.min.css">
    <link rel="stylesheet" href="/bootstrap-fileInput/css/fileinput-rtl.min.css">
    <title>Insert title here</title>

</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
<body>
<%--
<center>
    <h3>修改产品</h3>
    <form action="<%=request.getContextPath()%>/product/updateProduct.jhtml" method="post"
          enctype="multipart/form-data">
        <table border="1" cellpadding="0" cellspacing="0">
            <tr>
                <td>产品名称:
                    <input type="text" name="productName" value="${product.productName}"/></td>
            </tr>
            <tr>
                <td>产品价格:
                    <input type="text" name="price" value="${product.price}"/></td>
            </tr>
            <tr>
                <td>产品品牌:
                    <select name="brand.id" id="brandSelect">
                        <option value="-1">---请选择---</option>
                    </select>
                </td>
            </tr>

           &lt;%&ndash;图片展示&ndash;%&gt;
            <tr>
                <td>
                    <div style="width: 400px">
                        <c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
                            <c:if test="${product.imagePath==imageVO.productId}">
				    <span>
					<img src="<%=request.getContextPath()%>${imageVO.productImagePath}" width="50px" height="50px">
					&lt;%&ndash;<input   type="file" name="pictureName" onclick="findImagePath('${imageVO.productImagePath}','${imageVO.id}')"/>&ndash;%&gt;
					<input type="button" value="-"
                           onclick="removeInputRemove(this,'${imageVO.productImagePath}','${imageVO.id}')"/>
					</span>
                            </c:if>
                        </c:forEach>
                    </div>
                </td>
            </tr>


            <input type="hidden" name="id" value="${product.id}"/><br>
            <input type="hidden" name="imagePath" value="${product.imagePath}"/><br>
            <input type="hidden" name="imageCode" id="imageCode"/><br>
            <input type="hidden" name="oldImagePath" id="oldImagePath"/><br>

            <tr>
                <td>添加新图片
                    <input type="button" value="+" onclick="addInputFile()"/></td>
            </tr>

            <tr>
                <td>&lt;%&ndash;/图片div&ndash;%&gt;
                    <div id="imageInput">
                    </div>
                </td>

            </tr>

            <tr>


                <td>操作
                    <input type="submit" value="修改产品">
                    <input type="reset" value="重置">
                </td>
            </tr>


        </table>
    </form>
</center>
--%>

<div style="margin-left: 280px"><h1>产品修改</h1></div>
<div class="container-fluid" >

    <div class="row">

        <div class="col-sm-8" id="bodyDiv" style="float: left;width: 100%">

            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/product/updateProduct.jhtml" method="post" enctype="multipart/form-data" >
                <fieldset>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_host">产品名称</label>
                        <div class="col-sm-4">
                            <input value="${product.productName}" name="productName" class="form-control" id="ds_host" type="text" placeholder="产品名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_name">产品价格</label>
                        <div class="col-sm-4">
                            <input value="${product.price}" name="price" class="form-control" id="ds_name" type="text" placeholder="产品价格">
                        </div>
                    </div>



                    <div class="form-group">
                        <label class="col-sm-2 control-label">主图</label>
                        <div class="col-sm-7">
                            <div name="childPicture" class="col-sm-3">
                                <div class="col-sm-2">
                                    <%--<button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>--%>
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
               <%-- 子图展示--%>
                <div   class="form-group" style="margin-left: 200px">

                <c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
                    <c:if test="${product.id==imageVO.productId}">
                     <div name="childPicture" class="col-sm-3">
                        <div class="row">
                            <%--<button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>--%>
                            <img src="<%=request.getContextPath()%>${imageVO.productImagePath}" width="50px" height="50px">

                        </div>
                         <div  class="row">
                             <button  onclick="removeInputRemove(this,'${imageVO.productImagePath}','${imageVO.id}')" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-remove"></span></button>
                         </div>
                     </div>
                    </c:if>
                </c:forEach>

                </div>

                <%--多图片添加--%>
                <div id="imageInput">

                </div>





                   <%--隐藏域--%>
                <input type="hidden" name="id" value="${product.id}"/><br>
             <%--  <input type="hidden" name="imagePath" value="${product.imagePath}"/><br>--%>
                <input type="hidden" name="imageCode" id="imageCode"/><br>
                <input type="hidden" name="oldImagePath" id="oldImagePath"/><br>
            </form>




        </div>
    </div>
</div>

<script src="/bootstrap-fileInput/js/fileinput.min.js"></script>


<script type="text/javascript">

    $(function () {
        initFileInput()
    })

    function initFileInput() {
        $("#file").fileinput({
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
            uploadUrl: "<%=request.getContextPath()%>/product/uploadFile.jhtml",//这个是配置上传调取的后台地址，本项目是SSM搭建的
            maxFileSize : 2000,//文件大小限制
            maxFileCount: 10,//允许最大上传数，可以多个，
            enctype: 'multipart/form-data',
            allowedFileExtensions : ["jpg", "png","gif","docx","zip","xlsx","txt"],/*上传文件格式限制*/
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            showBrowse: true,
            browseOnZoneClick: true,
        }).on("fileuploaded", function (event, data, previewId, index) {
            console.log(data);
            $("#ImgPath").val($("#ImgPath").val()+","+data.response.msg);
        });
    }



</script>



<script type="text/javascript">

    $(function () {
        alert("wwww")
        initSelect("brandSelect", '${product.brand.id}');
    })

    //动态修改图片
    var v_imageCode = ""
    var v_imageId = ""

    function findImagePath(obj, id) {
        v_imageCode += "#" + obj;
        v_imageId += "#" + id;

        $("#imageCode").val(v_imageCode)
        $("#oldImagePath").val(v_imageId)
    }

    //删除原有inputFile
    function removeInputRemove(obj, uuid, id) {

        v_imageCode += "#" + uuid;
        v_imageId += "#" + id;

        $("#imageCode").val(v_imageCode)
        $("#oldImagePath").val(v_imageId)
        $(obj).parents("div[name='childPicture']").remove();
    }

    //动态添加inputFile
    function addInputFile() {
        $("#imageInput").append("\n" +
            "\t\t\t\t\t  <div name='pictureDiv' class=\"form-group\">\n" +
            "\t\t\t\t\t\t  <label class=\"col-sm-2 control-label\">图片添加</label>\n" +
            "\t\t\t\t\t\t  <div class=\"col-sm-4\">\n" +
            "\t\t\t\t\t\t\t  <button class=\"btn btn-group-lg\" type=\"button\"> <input name=\"pictureName\"  type=\"file\" placeholder=\"图片添加\"></button>\n" +
            "\t\t\t\t\t\t  </div>\n" +
            "\t\t\t\t\t\t  <div class=\"col-md-3\"> <button onclick=\"removeFile(this)\" class=\"btn btn-group-lg  \" type=\"button\"><span class=\"glyphicon glyphicon-remove\"></span></button></div>\n" +
            "\t\t\t\t\t  </div>")
    }
    //动态删除inputFile
    function removeFile(obj) {
        $(obj).parents("div[name='pictureDiv']").remove()
    }

   function removeHeadImage(obj) {
        $(obj).closest(".form-group").remove()

   }


</script>
</body>
</html>