<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

  <%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.js"></script>
	<link rel="stylesheet" href="<%=basePath%>/ztree/css/demo.css" type="text/css">
    <script type="text/javascript" src="<%=basePath%>/ztree/js/jquery.ztree.excheck.js"></script>
   <link rel="stylesheet" href="<%=basePath%>ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
   <script type="text/javascript" src="<%=basePath%>ztree/js/jquery.ztree.all.js"></script> <SCRIPT type="text/javascript">
		
  $(function(){
		areaZTree();
	});

	function areaZTree(){

		$.ajax({
			url:"<%=basePath%>/dept/findZTreeDept.jhtml",
			data:{},
			type:"post",
			dataType:"json",
			success:function(data){
  
          alert(data);
          console.log(data);
  
		var setting = {
				check:{
					//点击复选框的判定是否关联的父节点字节电也被选中
					 chkboxType: { "Y": "ps", "N": "ps"},	
					//复选框类型
					chkStyle: "checkbox",
					//每个节点上是否显示 CheckBox
					  enable: true			

			},
			data: {
				simpleData: {
					enable: true
				}
			}
		};

		var zNodes =data;

		function nocheckNode(e) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nocheck = e.data.nocheck,
			nodes = zTree.getSelectedNodes();
			if (nodes.length == 0) {
				alert("请先选择一个节点");
			}

			for (var i=0, l=nodes.length; i<l; i++) {
				nodes[i].nocheck = nocheck;
				zTree.updateNode(nodes[i]);
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#nocheckTrue").bind("click", {nocheck: true}, nocheckNode);
			$("#nocheckFalse").bind("click", {nocheck: false}, nocheckNode);
		});
		
		
		
			},
			error:function(data){
				$("#error").html(data.responseText)
			}
			
		})



	}
		
		
		
		
	</SCRIPT>
</head>
<body>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>

<div id="error"></div>
</body>
</html>
