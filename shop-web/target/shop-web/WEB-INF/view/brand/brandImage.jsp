<%--
  Created by IntelliJ IDEA.
  User: WIN
  Date: 2019/2/18
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>子图查看</title>
</head>
<body>
<div style="width: 600px">
<c:forEach items="${brandImageList}" var="brandImage">
    <img src="<%=request.getContextPath()%>${brandImage.brandImagePath}" width="100px" height="100px"/>
</c:forEach>
</div>
</body>
</html>
