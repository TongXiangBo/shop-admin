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
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
</head>
<body>
 <%-- <div class="container-fluid"style="text-align:center">
<form>

	<div class="row">
		<label  class="col-md-1" >产品名称</label>
		<input type="text" class="col-md-3"  name="productName" placeholder="产品名称">
	</div>
	<div class="row">
		<label class="col-md-1">产品价格</label>
		<input type="text" class="col-md-3" name="price"  placeholder="产品价格">
	</div>



	<div class="row">
		<label  class="col-md-1">图片添加</label>
		<div class="col-md-3"><input type="file" id="exampleInputFile"> </div>
		<div class="col-md-1"><label  class="col-md-1" onclick="addInputFile()">+</label></div>

	</div>

	<div class="row">
		<label class="col-md-1">品牌添加</label>
		<div class="col-lg-3">
				<select id="brandSelect" class="form-control">
					<option value="-1">---请选择---</option>
				</select>
			</div><!-- /input-group -->
		</div>


	&lt;%&ndash;提交按钮&ndash;%&gt;
	<div class="row" >

		<button class="btn btn-success" type="button">
			<i class="glyphicon glyphicon-ok"></i>
			Submit
		</button>
		<button class="btn btn-group-lg" type="reset">
			<i class="glyphicon glyphicon-refresh"></i>
			Reset
		</button>

	</div>
	<div id="imageInput" >


	</div>



</form>

  </div>
--%>
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



					  <div class="form-group">
						  <label class="col-sm-2 control-label">图片添加</label>
						  <div class="col-sm-4">
							  <button class="btn btn-group-lg" type="button"> <input name="pictureName"  type="file" placeholder="图片添加"></button>
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