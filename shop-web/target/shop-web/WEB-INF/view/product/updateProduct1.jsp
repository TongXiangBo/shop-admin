<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/brandSelect.js"></script>
<body>
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

           <%--图片展示--%>
            <tr>
                <td>
                    <div style="width: 400px">
                        <c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
                            <c:if test="${product.imagePath==imageVO.productId}">
				    <span>
					<img src="<%=request.getContextPath()%>${imageVO.productImagePath}" width="50px" height="50px">
					<%--<input   type="file" name="pictureName" onclick="findImagePath('${imageVO.productImagePath}','${imageVO.id}')"/>--%>
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
                <td><%--/图片div--%>
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