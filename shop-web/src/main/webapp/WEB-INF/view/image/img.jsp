<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
 <title>商品展示</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
</head>
<body>







<div class="row">
<c:forEach items="${imageVOList}" var="imageVO">
<div class="col-md-2">
 <a href="#" class="thumbnail">
  <img src="<%=request.getContextPath()%>${imageVO.productImagePath}" style="height: 80px" >
 </a>
</div>
</c:forEach>
</div>







<%--


<% int imageIndex=0; %>

<c:forEach items="${imageVOList}" var="imageVO" varStatus="index">

<%  imageIndex++; %>
<img src="<%=request.getContextPath()%>${imageVO.productImagePath}" style="width: 90px">
<%if(imageIndex%5==0){%>
<br>
<%}%>
</c:forEach>


 <div id="productImage"></div>
--%>


</body>
</html>