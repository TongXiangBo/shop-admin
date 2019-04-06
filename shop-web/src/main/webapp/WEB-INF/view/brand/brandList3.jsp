<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
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
<script type="text/javascript" src="<%=basePath%>/js/My97/My97DatePicker/WdatePicker.js"></script>
</head>
<body onload="test()">
   <center>
  <!-- 条件查询 -->
    <form >
   <table>
   <thead><th>产品名称：<input type="text" id="brandName"/></th></thead>
   <!-- <thead><th>录入时间：<input type="text" id="minCreateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})"/>--<input type="text" id="maxCreateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})"/></th></thead>
   <thead><th>修改时间：<input type="text" id="minUpdateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})"/>--<input type="text" id="maxUpdateTime" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'})"/></th></thead> -->
   <thead><th>录入时间：<input type="date" id="minCreateTime"/>--<input type="date" id="maxCreateTime"/></th></thead>
   <thead><th>修改时间：<input type="date" id="minUpdateTime"/>--<input type="date" id="maxUpdateTime"/></th></thead>
   <thead><th><input type="button" onclick="queryByWhere(1)" value="高级查询"/> <input type="reset" value="重置"/></th></thead>
   </table>
   </form>
   
   <input type="button" value="增加" onclick="toAdd()"> <input type="button" value="批量删除" onclick="batchDalete()">
  <!-- 引入子页面 -->
  <div id="show_table">
  <jsp:include page="/WEB-INF/view/brand/brandListChild.jsp"></jsp:include>
  
  </div>
   </center>


<div id="addOrUpdate">
<%-- <jsp:include page="/WEB-INF/view/brand/addBrand.jsp"></jsp:include> --%>
</div>

<script type="text/javascript">
 function test(){
	/* queryByWhere(1)
	alert(111)
	alert(data) */
} 
//表格动态页面编辑

var brandId="";
function editorBrand(obj){
	alert(111)
 var brandName=$(obj).parents("tr").children()[2].innerHTML
 $(obj).parents("tr").children()[2].innerHTML="<input type='text' class='brandname' value='"+brandName+"'/> ";
 brandId=$(obj).parents("tr").children()[1].innerHTML
 $(obj).parents("tr").children()[6].innerHTML="<input  type='button' class='brandname' onclick='saveEditTd(this);' value='保存'/><input type='button' class='brandname' onclick='resertEditTd();' value='取消'/>";
 $(".brandname").css("background-color","pink");
}
 
 
	///修改保存
   function saveEditTd(obj){
	   var brandName=$(obj).parents("tr").children()[2].children[0].value;
      // alert(brandName)
	   $.ajax({
			url:"<%=request.getContextPath()%>/brand/updateBrand.jhtml",
			type:"post",
			data:{
				"id":brandId,
				"brandName":brandName
				},
			
			async:true,
			success:function(result){
				queryByWhere(1);
			}
			
		})
   
   }
  
	/* 取消修改 */
  function resertEditTd(){
	 // queryByWhere(1);
	
	$.ajax({
			url:"<%=request.getContextPath()%>/brand/findBrandList.jhtml",
			type:"post",
			data:{
				"flag":2
			},
			async:true,
			success:function(result){
				
				alert(result);
				//ajax 回调成功后 将整个子级页面带回
				$("#tableRank").html(result);
				//隐藏多余的分页信息
		    $("#pageDiv").css("display","none")
			}
			
		})
	  
	}
	
	
	
///条件查询
var data="";
function queryByWhere(pageIndex){
	 var  brandName=$("#brandName").val() 
	 var minCreateTime= $("#minCreateTime").val();
	//	 alert(typeof(minCreateTime))
	 var maxCreateTime= $("#maxCreateTime").val();
	 var minUpdateTime= $("#minUpdateTime").val();
	 var maxUpdateTime= $("#maxUpdateTime").val();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/brand/findBrandList.jhtml",
		type:"post",
		///dataType:"json",
		data:{
		"flag":1,
		"pageSize":pageSize,
		"pageIndex":pageIndex,
	    "brandName":brandName, 
	    "minCreateTime":minCreateTime,
		"maxCreateTime":maxCreateTime,  
		"minUpdateTime":minUpdateTime,
		"maxUpdateTime":maxUpdateTime,  
		},
		async:true,
		success:function(data){
			alert(data)
			data=data
			
			//alert(data)
			$("#show_table").html(data);
			 
		},
		error:function (err){
			/* alert(11)
			alert(err)
	      alert(err.responseText)
			$("#show_table").html(err.responseText); */
		}
		
	})
	
}

   //翻页
   function  turnPage(pageIndex){
	   queryByWhere(pageIndex);
   }
   //每页多少条
   var pageSize=5;
   function  changePageSize(obj){
	   alert(obj)
	   pageSize=obj;
	   queryByWhere(1);
	  
   }
	//增加前页面设定
	function  toAdd(){
		
		
	var brandName=$("#addOrUpdate").html("<center><div id='addform'><h3>品牌添加</h3>"
			+"<form action='<%=request.getContextPath()%>/brand/addBrand.jhtml' method='post'>"
			+"<input type='text' name='brandName'/><br>"
			/* +"<input type='submit' value='品牌增加'/>" */
			+"<input type='button' value='品牌增加' onclick='addBrand()'/>"
			+"<input type='reset' value='重置'/><br>"
			+"</form></div></center>"
				 )	
	
	}
	//添加
	function  addBrand(){
		var brandName=$("input[name='brandName']").val()
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/addBrand.jhtml",
			type:"post",
			
			data:{"brandName":brandName},
			async:true,
			success:function(result){
				if(result.code==200){
					queryByWhere(1);
					}else{ 
						alert(result.msg);	
						
					}	
			}
			
		})
		
	}
	
	
	
	//删除
	function  deleteBrand(obj){
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/deleteBrand.jhtml",
			type:"post",
			async:true,
			//dataType:"json",
			data:{"id":obj},
			success:function (result){
				alert(result.code+result.msg);
				if(result.code==200){
					queryByWhere(1);
					}else{ 
						alert(result.msg);	
						
					}

			}
		})
	}
	//批量删除
	function  batchDalete(){
		var v_ids="";
		$("input[name='checkboxSingle']:checkbox:checked").each(function(){
			v_ids+=","+this.value;
			
		})
		var ids=v_ids.substring(1);
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/batchDalete.jhtml",
			type:"post",
			data:{"ids":ids},
			async:true,
			success:function(result){
				alert(result.code+result.msg);
				if(result.code==200){
				queryByWhere(1);
				}else{
					alert(result.msg);	
					
				}
			}
			
		})
		
	}
	
	//修改
	function toUpdateBrand(obj){
	
		
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/toUpdateBrand.jhtml",
			type:"post",
			data:{"id":obj},
			async:true,
			success:function(result){
				//alert(result.code+result.msg);

				$("#addOrUpdate").html(result)	
				
			}
			
		})
		
		
	} 
</script>
</body>
</html>