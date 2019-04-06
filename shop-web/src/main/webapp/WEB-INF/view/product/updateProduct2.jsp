<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>

</head>
<body>
	<center>
	<h3>修改产品</h3>
	<form action="<%=request.getContextPath()%>/product/updateProduct.jhtml" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${product.id}"/><br>
	产品名称:<input type="text" name="productName"  value="${product.productName}" /><br>
	产品价格:<input   type="text" name="price"  value="${product.price}" /><br>
	产品品牌<select name="brand.id" id="brandSelect">
	<option>---请选择---</option>
	</select><br>


		<div style="width: 500px">
		<c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
			<c:if test="${product.imagePath==imageVO.productId}">
				     <div >
					<img src="<%=request.getContextPath()%>${imageVO.productImagePath}" width="100px" height="100px">
					<input   type="file" name="pictureName" onclick="findImagePath('${imageVO.productImagePath}','${imageVO.id}')"/>
					<input type="button" value="-" onclick="removeInputRemove(this)"/>
					 </div>
			</c:if>
		</c:forEach>
		</div>


		添加新图片：<input type="button" value="+" onclick="addInputFile()"/><br>
		<%--/图片div--%>
		<div id="imageInput">
		</div>


		<input type="hidden" name="imagePath"  value="${product.imagePath}"/><br>
		<input type="hidden" name="imageCode" id="imageCode"/><br>
		<input type="hidden" name="oldImagePath" id="oldImagePath"/><br>
	<input type="submit" value="修改产品" >
	<input type="reset" value="重置">
	</form>
    </center>

<script type="text/javascript">

$(function(){
	initSelect("brandSelect",'${product.brand.id}');
})

//动态修改图片
var v_imageCode=""
var v_imageId=""
function findImagePath(obj,id) {
    v_imageCode+="#"+obj;
    v_imageId+="#"+id;

    $("#imageCode").val(v_imageCode)
    $("#oldImagePath").val(v_imageId)
}
  //删除原有inputFile
function removeInputRemove(obj) {
$(obj).parent().remove();
 }

//动态添加inputFile
function addInputFile() {
    $("#imageInput").append("<div> <input type='file' name='pictureName'> <input type='button' value='-' onclick='removeFile(this)'/><br></div>")
}
//动态删除inputFile
function removeFile(obj) {
    $(obj).parent("div").remove()
}


</script>
</body>
</html>