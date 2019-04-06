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
<body >
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
  <div id="show_add">
  <center>
  <h3>品牌增加列表</h3>
  <form>
  <input type="text" id="v_brandname"/><br>
  <input type="button" value="提交" onclick="addBrand()"/>
   <input type="reset" value="重置"/>
  </form>
  </center>
  </div>
   </center>
   
  



<script type="text/javascript">
    //查看子图
    function viewChildImages(obj) {
        location.href="<%=request.getContextPath()%>/brandImage/viewChildImages.jhtml?id="+obj;
    }




///条件查询
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
		data:{
		"flag":1,
		"pageIndex":pageIndex,
	    "brandName":brandName, 
	    "minCreateTimeStr":minCreateTime,
		"maxCreateTimeStr":maxCreateTime,  
		"minUpdateTimeStr":minUpdateTime,
		"maxUpdateTimeStr":maxUpdateTime,  
		},
		async:true,
		success:function(data){
			
			//alert(data)
			$("#show_table").html(data);
			
		}
	})
	
}

   //翻页
   function  turnPage(pageIndex){
	   queryByWhere(pageIndex);
   }
	//增加
	 function  toAdd(){
		location.href="<%=request.getContextPath()%>/brand/toAdd.jhtml";
	}
	
	
	function  addBrand(){
		alert(1111)
		var  v_brandname=$("#v_brandname").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/addBrand.jhtml",
			type:"post",
			data:{
			"brandName":v_brandname	
			},
		success:function(result){
			if(result.code==200){
				queryByWhere(1);
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
			data:{"id":obj},
			success:function (data){
				alert(data)
				queryByWhere(1);

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
				alert(result);
				queryByWhere(1);
			}
			
		})
		
	}
	
	//修改回显
	function toUpdateBrand(obj){
		location.href="<%=request.getContextPath()%>/brand/toUpdateBrand.jhtml?id="+obj;
		
	}
	//本页面修改
	function editorBrand(brandId){
		// 方法一  循环数组找到对相应id  将第二数组中对应名称赋给brandName，进行回填 
		/* for (var i = 0; i < arrBandId.length; i++) {
		if(arrBandId[i]==brandId){
			brandName=arrBrandName[i]
		}
		} */
		//alert(brandId)
		//方法二
		var brandName= $("#brandTable td[data-id='"+brandId+"']" ).attr("data-brandName");
		alert(brandName)
		
		$("#brandTable td[data-id='"+brandId+"']").html("<input type='text'  value='"+brandName+"' name='updte_brandname'/><br>"
				+"<input type='button' value='保存' onclick='updateBrand(\""+brandId+"\")'/>"
					  +"<input type='button' value='取消' onclick='cancleUpdate(\""+brandId+"\",\""+brandName+"\")'/>")
		
	}
	/* 取消修改 */
	function cancleUpdate(brandId,brandName){
		alert(brandName)
		$("#brandTable td[data-id='"+brandId+"']").html(brandName)	
		
	}
	//保存
	//定义两个数组用于回显
	var arrBandId=[];
	var arrBrandName=[];
	function  updateBrand(brandId){
		
		var brandName=$("#brandTable td[data-id='"+brandId+"'] input[name='updte_brandname']" ).val();
		arrBandId.push(brandId);
		arrBrandName.push(brandName);
		//alert(arrBandId)
		//alert(arrBrandName)
		$.ajax({
			url:"<%=request.getContextPath()%>/brand/updateBrand.jhtml",
			type:"post",
			data:{
				"id":brandId,
				"brandName":brandName
			},
		success:function(result){
			//alert(222)
			if(result.code==200){
				
				//$("#brandTable td[data-id='"+result.data.id+"'] input[name='updte_brandname']" ).val(result.data.brandName);
				$("#brandTable td[data-id='"+brandId+"']" ).html(brandName);
				//给名称所在 td 加上新属性 并赋值
				$("#brandTable td[data-id='"+brandId+"']" ).attr("data-brandName",brandName);
			}
			
		}
		})
		
	}
	
</script>
</body>
</html>