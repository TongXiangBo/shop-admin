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