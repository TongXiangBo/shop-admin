//品牌动态下拉框展示
	function initSelect(elementSelect,brandId){
	alert(111)
	$.ajax({
		url:contextPath+"/brand/findBrandSelect.jhtml",
		type:"post",
		success:function(result){
			var brandList=result.data
			alert(result.code)
			if(result.code==200){
			for (var i = 0; i < brandList.length; i++) {
		    $("#"+elementSelect).append("<option value='"+brandList[i].id+"'>"+brandList[i].brandName+"</option>")
			}
			}
			//alert(!undefined)
			if(brandId){
				$("#"+elementSelect).val(brandId);	
				
			}
			
			
		}
		
	})
	
}