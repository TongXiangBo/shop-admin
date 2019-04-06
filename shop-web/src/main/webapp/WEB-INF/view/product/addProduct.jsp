<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
</head>
<body>

 <div style="margin-left: 280px"><h1>产品添加</h1></div>
  <div class="container-fluid" >

	  <div class="row">

		  <div class="col-sm-8" id="bodyDiv" style="float: left;width: 100%">

			  <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/product/addProduct.jhtml" method="post" enctype="multipart/form-data" >
				  <fieldset>

					  <div class="form-group">
						  <label class="col-sm-2 control-label" for="ds_host">产品名称</label>
						  <div class="col-sm-4">
							  <input name="productName" class="form-control" id="ds_host" type="text" placeholder="产品名称">
						  </div>
					      </div>
						  <div class="form-group">
						  <label class="col-sm-2 control-label" for="ds_name">产品价格</label>
						  <div class="col-sm-4">
							  <input name="price" class="form-control" id="ds_name" type="text" placeholder="产品价格">
						  </div>
					  </div>



					 <%-- <div class="form-group">
						  <label class="col-sm-2 control-label">图片添加</label>
						  <div class="col-sm-4">
							  <button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>
						  </div>
						  <div class="col-md-3"> <button onclick="addInputFile()" class="btn btn-group-lg  " type="button"><span class="glyphicon glyphicon-hand-down"></span></button></div>
					  </div>--%>


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
                <%--多图片添加--%>
				  <div id="imageInput">

				  </div>

			  </form>




		  </div>
	  </div>
  </div>




	<%--<center>
	<h3>信息修改</h3>
	<form action="<%=request.getContextPath()%>/product/addProduct.jhtml" method="post" enctype="multipart/form-data">
	产品名称:<input type="text" name="productName" value="${product.productName}"/><br>
	产品价格:<input   type="text" name="price" value="${product.price}" /><br>
	<select name="brand.id" id="brandSelect"><br>
	<option value="-1">---请选择---</option>
	</select><br>


	图片上传：<input type="file" name="pictureName"> <input type="button" value="+" onclick="addInputFile()"/><br>
	&lt;%&ndash;动态添加图片上传按钮&ndash;%&gt;
	<div id="imageInput">
	&lt;%&ndash;<div> <input type="file" name="pictureName"> <input type="button" onclick="removeFile(this)"/><br></div>&ndash;%&gt;
	</div>
		<input type="submit" value="新增产品" onclick="collectFileName()">
	    <input type="reset" value="重置">



	</form>
    </center>--%>








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
 $(function(){
	 //加载动态下拉框
	initSelect("brandSelect");
})

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

  //收集fileName
    v_pictureName=[];
	function collectFileName(){
     $("input[type='file']").each(function () {
         v_pictureName.push(this.value)

     })
      var s__pictureName = v_pictureName.join(",")
	}
 
</script>
</body>
</html>