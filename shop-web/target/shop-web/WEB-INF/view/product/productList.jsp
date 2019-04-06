<%@ page import="com.fh.shop.backend.po.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/common.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/brandSelect.js"></script>
<script type="text/javascript" src="<%=basePath%>js/My97/My97DatePicker/WdatePicker.js"></script>


        <!--样式文件-->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datatable/DataTables/css/jquery.dataTables.css">
        <!--jquery js-->

        <!--DataTables 核心 js-->
        <script src="<%=request.getContextPath()%>/datatable/DataTables/js/jquery.dataTables.min.js"></script>
    </head>


<%--
	<!--引入css-->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

	<!--引入JavaScript-->
	<script type="text/javascript" language="javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

--%>



<body >
<%--<button style="color:red">wwwwwwwwww</button>--%>
	<center>
		<%--用户登录信息展示--%>
		<div>
		<%--<%User user=(User)request.getSession().getAttribute("user");%>
			<% SimpleDateFormat sim=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");%>--%>
			<%--<h3>您好，<%=user.getUserName()%>;您上次登录的时间是 <%=sim.format(user.getLonginTime())%>;今天您是第${user.times+1} 次登录</h3>--%>
			<%--<fmt:formatDate value="${user.loginTime}"></fmt:formatDate>--%>

			<h3 style="color: #66F4DF">您好，<font color="red">${user.userName}</font>;您上次登录的时间是
				<font color="red"><fmt:formatDate value="${user.loginTime}" pattern="yyyy/MM/dd HH:mm:ss"/> </font>  ;
				今天您是第<font color="red">${user.times}</font>次登录</h3>

		</div>
	<form method="post" id="productForm">
	<table border="1" cellspacing="0" cellpadding="0">
	
	<tr><td>产品名称：<input type="text" name="productName" id="productName"/></td></tr>
	<tr><td>产品价格：<input type="text" name="minPrice" id="minPrice"/>---<input type="text" name="maxPrice" id="maxPrice"/></td></tr>
	<tr><td>创建时间：<input type="text" name="minCreateTime" id="minCreateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})" />---<input type="text" name="maxCreateTime" id="maxCreateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})" /></td></tr>
	<tr><td>修改时间：<input type="text" name="minUpdateTime" id="minUpdateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})"/>---<input type="text" name="maxUpdateTime" id="maxUpdateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})" /></td></tr>
	<tr><td>
	 产品品牌：<select id="brandSelect" name="brand.id">
	 <option value="-1">---请选择---</option>
	 
	</select>
	</td></tr>
	<tr><td><input type="button" value="高级查询" onclick="queryByWhere(1)"/><input type="reset" value="清空"/></td></tr>
	
	</table>
	</form>
	<input type="button" value="批量删除" onclick="batchDelete()"/>
	<input type="button" value="增加" onclick="addProduct()"/>
		<input type="button" value="Excel导出" onclick="exitExcel()"/>
	<!-- ajax异步加载展示表格 -->
	
	<div id="show_table">
	<jsp:include page="/WEB-INF/view/product/productListChild.jsp"></jsp:include>
	</div>
	
	
	</center>
	

	
	<script type="text/javascript">
	$(function(){
		initTable();
		initSelect("brandSelect")
		rankProduct();
		checkAllOrRecheck();

		//jequary datatable
        $(function () {
            $("#productTable").DataTable({
          /* columns:[
                   /!* {data:"firstname"},
                    {data:"lastname"},
                    {data:"phone1"},
                 {data:"phone2"},
                 {data:"phone3"},
                 {data:"phone4"},
                 {data:"phone5"},
                 {data:"phone6"},
                 {data:"phone7"},*!/


               /!*{ field: "id", columnName: "编号", css: { "text-align": "center" } },
                      { field: "username", columnName: "用户名" },
                      { field: "age", columnName: "年龄" },
                     { field: "phone", columnName: "联系电话", css: { "text-align": "center" } },
                       { field: "email", columnName: "邮箱" },
                       { field: "description", columnName: "自我介绍" }

                   *!/


                ],
        "pagingType":   "full_numbers",
         url:"/WEB-INF/view/product/productListChild.jsp",
                pageNum: 1,            // 显示第几页数据，默认1
                 pageSize: 15,        // 每页数据数量，默认10
                  pagination: true,    // 是否启用分页组件，默认启用
                  showCheckbox: true*/

            });
        });
		
	})

	//详细图片展示
	function lookPicture(obj) {

		location.href="<%=basePath%>/product/lookPicture.jhtml?imagePath="+obj;

    }

	//动态提交form表单 poi导出
	function exitExcel(){
	 var productForm= document.getElementById("productForm");
        productForm.action="<%=request.getContextPath()%>/product/exitExcel.jhtml";
        productForm.submit();
	}




	var v_ids=[];
	///全选反选
	function checkAllOrRecheck(){
		alert(v_ids)
		//翻页回填复选框
		if(v_ids.length>0){
		var v_chckboxIds=v_ids
		for (var i = 0; i < v_chckboxIds.length; i++) {
			$("input[name='checkboxSingle']").each(function(){
				if(v_chckboxIds[i]==this.value){
					this.checked=true;	
					$(this).parents("tr").css("background","gray");
				}
				
			})
			
		}
			
		}
		
		
		
	///全选
	$("#checkAll").bind("click",function(){
		///alert(111)
		var checkAll=this.checked
		//alert(checkAll)
	$("input[name='checkboxSingle']").each(function(){
		 
		this.checked=checkAll;
		v_ids.push(this.value);
		
		//反选为false
	$("#reCheck").get(0).checked=false;
	if(checkAll){
	$(this).parents("tr").css("background","gray");
	}else{
		$(this).parents("tr").css("background","");
	}
	
	})
	
	
	})
	///反选
	$("#reCheck").bind("click",function(){
		var reCheck=this.checked
		
		$("input[name='checkboxSingle']").each(function(){
			
			this.checked=!reCheck;
     
			if(reCheck==false){
				$(this).parents("tr").css("background","gray");
				}else{
					$(this).parents("tr").css("background","");
				}
		})	
		var checkboxlength=$("input[name='checkboxSingle']").length;
		var checkedlength=$("input[name='checkboxSingle']:checked").length;

		if(checkboxlength==checkedlength){
			$("#checkAll").get(0).checked=true
		}else{$("#checkAll").get(0).checked=false}
		
		
	})
	
	}
	//排序
	var data_rank_msg
	var data_rank
	var data_rank_id;
	var  cancelColor=true
	function  rankProduct(){
		
			  var  i=0;
		$("#productTable thead input[type='button']").each(function(){
			//排序变色	方法一
		/* 
	      var	 v_data_rank_msg=$(this).attr("data_rank_msg");
		  var   v_data_rank=$(this).attr("data_rank");
			 if(v_data_rank_msg==data_rank_msg&&v_data_rank==data_rank){
					$(this).css("background","red");
			}  */
			 
			//方法二  动态添加属性
		 $ (this).attr("data_rank_id",i);
				i++
				//alert(data_rank_id)
		//判断属性值 是否相等	
		
			if(data_rank_id==$(this).attr("data_rank_id")){
				$(this).css("background","red");	
			} 
				
				//alert(22) 
		//移上移下事件
			$(this).mouseover(function(){
				
				if(this.style.background!="red"){
				
					$(this).css("background","yellow")
				}
			});
			$(this).mouseout(function(){
				if(this.style.background!="red"){
					$(this).css("background","")
				}
			});
			
			$(this).click(function(){
				
				data_rank_msg=	$(this).attr("data_rank_msg");
			    data_rank=	$(this).attr("data_rank");
				  data_rank_id=$(this).attr("data_rank_id");
			//如果按钮是红色  取消颜色  同时将  排序换成默认id倒叙
				  if(this.style.background=="red"){
					  data_rank_id=""
					 data_rank_msg="p.id"
					 data_rank="desc"
				  }
				  alert(111)
				 queryByWhere(1);
			})
		
		})
		
	}
	
	
	
	
	//定义全局变量
	var v_rowIds=new Array();
	//表格点击行变色同时选中所在行的复选框
	function  initTable(){
		
		//选中表格  和 表格中的行
		$("#productTable tbody tr").each(function(){
		//获取当前行中的复选框
			var v_checkbox=$(this).find("input[name='checkboxSingle']:checkbox")[0];
		//console.log(v_checkbox)
		//翻页回填颜色和checkbox 
		for (var i = 0; i < v_rowIds.length; i++) {
			if(v_rowIds[i]==v_checkbox.value){
				$(this).css("background","lightgray")	
				v_checkbox.checked=true;
			}
		}
		
          /*  多种绑定事件  */
		/*  $(this).bind('mouseenter mouseleave', function() {
			 if(this.style.background!="lightgray"){
			  $(this).css({background:"red"})
			  /// $(this).css({background:""})
			  }
			}); */
		
		
		/* 方法一 鼠标移动事件  判断颜色*/
		/*  $(this).mouseover(function(){
			if(this.style.background!="lightgray"){
			$(this).css({"background":"red"})}	
		})
		$(this).mouseout(function(){
			if(this.style.background!="lightgray"){
			$(this).css({"background":""})	}
		})  */
		/* 方法二  鼠标移动事件  判断复选框*/
		$(this).mouseover(function(){
		if(!v_checkbox.checked){
			$(this).css("background","red");
		}
		})	
		
		$(this).mouseout(function(){
			if(!v_checkbox.checked){
				$(this).css("background","");	
			}
		})
		
		//给每行绑定点击事件
			$(this).click(function(){
			if(v_checkbox.checked){
			$(this).css({"background":""})
			v_checkbox.checked=false
			deleteRowIds(v_checkbox.value);
			
			}else{
			$(this).css("background","lightgray")	
			v_checkbox.checked=true;
			v_rowIds.push(v_checkbox.value)
			console.log(v_rowIds)
			}	
			})
		
		})
		
	}
	
	//删除v_rowIds
	function deleteRowIds(id){
		///alert(222)
		for (var i = v_rowIds.length-1; i >=0 ; i--) {
			if(v_rowIds[i]==id){
				v_rowIds.splice(i, 1)
				console.log(v_rowIds);
			}
		}
	}
	
	

/*  删除 */
function deleteProduct(obj){
	if(confirm("你确定删除吗")){
	$.ajax({
	url:"<%=request.getContextPath()%>/product/deleteProduct.jhtml",
	dataType:"json",
	type:"POST",
	
	data:{"id":obj},
	async:true,
	success:function(result){
		//alert(result.code)
		if(result.code==200){
			
		queryByWhere(1);
			
		}else{
			alert(result.msg)
		}
		
<%--     	location.href="<%=request.getContextPath()%>/product/findProductList.jhtml"	--%>
 	},
	error:function(){}
	})
	}
}

/* 批量删除 */
   
 	function  batchDelete(){
	//不能用全局变量
 	var v_ids=""; 
 	$("input[name='checkboxSingle']:checkbox:checked").each(function(){
 		v_ids+=","+this.value
 	})
    var ids= v_ids.substring(1)
    //是否为空
  
 	if(ids.length>0){
 		if(confirm("你确定批量删除")){
 			$.ajax({
 			url:"<%=request.getContextPath()%>/product/batchDelete.jhtml" ,
 			type:"post",	
 			//dataType:"json",
 			data:{ "ids":ids},
 			async:true,
 			success: function(result){
 				//alert(result.code)
 				if(result.code==200){
 					
 				queryByWhere(1);
 					
 				}else{
 					alert(result.msg)
 				}
 				<%-- alert(data)
 				location.href="<%=request.getContextPath()%>/product/findProductList.jhtml"	 --%>
 			}
 			
 			})
 		}
 		
 	}else{
 		alert("请选择需要删除的选项")
 		
 	}
	
	}
	
	
	
	
//条件查询
	function queryByWhere(page){
	var productName= $("#productName").val();
	var minPrice= $("#minPrice").val();
	var maxPrice= $("#maxPrice").val();
	
    var minCreateTime= $("#minCreateTime").val();
	var maxCreateTime= $("#maxCreateTime").val();
	var maxUpdateTime= $("#maxUpdateTime").val();
	var minUpdateTime= $("#minUpdateTime").val();
	var brandSelect= $("#brandSelect").val();
   
	
	$.ajax({
			url:"<%=request.getContextPath()%>/product/findProductList.jhtml" ,
			type:"post",	
			//dataType:"json",
			data:{ 
			//	"rank":rank,
			    "data_rank_msg":data_rank_msg,
			    "data_rank":data_rank,
				"pageSize":pageSize,
				"pageIndex":page,
				"flag":1,
				"productName":productName,
			     "minPrice":minPrice,
				 "maxPrice":maxPrice,
				
				    "minCreateTime":minCreateTime,
					"maxCreateTime":maxCreateTime,  
					"minUpdateTime":minUpdateTime,
					"maxUpdateTime":maxUpdateTime,  
				    "brand.id":brandSelect
			},
			async:true,
			success: function(data){
				//alert(data)
			$("#show_table").html(data);
			initTable();
			rankProduct();
			checkAllOrRecheck();
			//jequery datatable初始化
                $("#productTable").DataTable({})
   }
	})
  }
   //分页翻页
   
	function turnPage(pageIndex) {
		queryByWhere(pageIndex);
	}
	//每页条数设定
	var  pageSize;
    function changePageSize(obj){
	 pageSize=obj;
	 queryByWhere(1);
	}
	
	
   </script>
	<script type="text/javascript">
	function addProduct(){
		location.href="<%=request.getContextPath()%>/product/toAdd.jhtml"
	}
	
	</script>

</body>
</html>