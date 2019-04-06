<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.js"></script>

</head>
<body onload="validateUser()">
	<center>
	
	<h3>用户登陆</h3>
	<form action="<%=request.getContextPath()%>/user/userLogin.jhtml" method="post"> 
   账号：<input type="text" name="userName"/><br>
   密码：<input type="text" name="password"/><br>	
   <input type="button" value="注册" onclick="registerUser()"/><input id="loginSubmit" type="submit" value="登陆"/> <input type="reset" value="重置"/>
	</form>
	<!-- 错误信息展示 -->
	<div id="errorMessage" style="height: 20px">
	<h2><font color="red"><%=session.getAttribute("error") %></font></h2>
	</div>
	<!-- 距离分割 -->
	<div style="margin-top: 100px" ></div>
	<!-- 注册页面展示 -->
	<div id="addUser" ></div>
	</center>
 

<script type="text/javascript">
  //登录错误信息  反馈
  function validateUser(){
	  <%String succ=(String)session.getAttribute("error"); %>
	 
	 <%if(succ!=null){%>
	  $("#errorMessage").fadeIn(5000);
	  $("#errorMessage").fadeOut(5000);
	 <%}else{%>
	 $("#errorMessage").hide();
	 <%}%>
	  
  }
  ///注册
  function  registerUser(){
	  $("#addUser").html("<h3><font color='yellow'>用户注册<font></h3><form action='<%=request.getContextPath()%>/user/addUser.jhtml' method='post'>"
			  +"账号：<input type='text' id='userName' name='userName' onblur='validateUserName()'/><br>"
			  +"密码：<input type='text'  id='password' name='password' onblur='validatePassword()' /><br>"
			   +"<input type='button' id='registerSubmit' onclick='addUser()'  value='提交'/><input type='reset' value='重置'/>"
			  +"</form>")
	  
			  $("#addUser").css("background","lightblue") 
	  ///点击注册时验证是否为空
	/* 	$("#registerSubmit").click(function(){
	   alert(777)
   })	   */
			  
  }
  //名称验证
  function validateUserName(){
	var userName= $("#userName").val()
	//判断名称是否为空
	if(userName!=null&&userName!=""){
		
		$.ajax({
			url:"<%=request.getContextPath()%>/user/validateUserName.jhtml",
			type:"post",
			dataType:"json",
			data:{
			"userName":userName,
			},
		   success:function(data){
			 // alert(data.code+data.msg)
			   if(data.code==301){
				 
			   $("#errorMessage").html("<h2><font color='red'>账号已存在，请重新填写你的账号信息</font></h2>")
			    $("#errorMessage").show()
			   $("#registerSubmit").prop("disabled","disabled")
			   }else{
				  // alert(444)
				   $("#errorMessage").html("<h2><font color='green'>账号唯一，请继续填写你的注册信息</font></h2>")
				   // $("#errorMessage").show()
				   $("#registerSubmit").prop("disabled","")
   
			   }
		   }
		
			})	
		
	}else{
		alert(22)
		 $("#errorMessage").html("<h2><font color='red'>账号不能为空，请填写你的账号信息</font></h2>")
		 $("#errorMessage").show()
		 
	}	
	
	  
  }
  //密码验证
  /* function  validatePassword(){
	  var password=$("#password").val()
	//  var userName= $("#userName").val()
     //判断密码是否为空
	if(password!=null&&password!=""){
		
	}else{
		//alert(333)
		 $("#errorMessage").html("<h2><font color='red'>密码不能为空，请填写你的密码信息</font></h2>")
		  $("#errorMessage").show()
	}
  
  
  } */
  
   
///点击注册时验证是否为空
   function  addUser(){
  
	  /// alert(55)
	   var password=$("#password").val()
	  var userName= $("#userName").val()
	   
	   if(userName!=null&&userName!=""){
		   if(password!=null&&password!=""){
			   $.ajax({
					url:"<%=request.getContextPath()%>/user/addNewUser.jhtml",
					type:"post",
					data:{
					"userName":userName,
					"password":password
					},
				   success:function(data){
					   alert(data)
					   $("#errorMessage").html("<h2><font color='green'>恭喜你，注册成功</font></h2>")
					   //注册成功后隐藏 注册页面
					   $("#addUser").html("")
				   }
				
					})	
			   
		   }else{
				//alert(333)
				 $("#errorMessage").html("<h2><font color='red'>密码不能为空，请填写你的密码信息</font></h2>")
				  $("#errorMessage").show()}
	   }else{
		   $("#errorMessage").html("<h2><font color='red'>账号不能为空，请填写你的账号信息</font></h2>")
		   $("#errorMessage").show();   
	   }
   }  
  
   
   
  
</script>
</body>
</html>