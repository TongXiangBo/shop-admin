<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><font color="green"> 恭喜  登陆成功。。。。</font></h1>
  <!-- 方法一 -->
 <%--  <a href="<%=request.getContextPath()%>/user/exitLogin.jhtml"><font color="red">退出登陆</font></a> --%>
 <!-- 方法二 -->
 <!--  <a href="javascript:;" onclick="exitLogin()"><font color="red">退出登陆</font></a> -->
  <!-- 方法三 -->
   <a href="javascript:exitLogin()"><font color="red">退出登陆</font></a>
<script type="text/javascript">
 function  exitLogin(){
	 //alert(22)
	location.href="<%=request.getContextPath()%>/user/exitLogin.jhtml" ;
	 
 }
</script>
</body>
</html>