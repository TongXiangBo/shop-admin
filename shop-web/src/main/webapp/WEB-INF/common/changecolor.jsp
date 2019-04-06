<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
/* var ids=""
 function ready(){
   var table = document.getElementById("tablecolor"); 
   var allRows= table.rows;
   for (var i = 1; i < allRows.length;i++) {
	   //alert(allRows.length)
	   allRows[i].onclick=function(){
		if(this.style.background !="yellow"){
			this.style.background ="yellow";			
		}else{
			this.style.background ="";
		}
	}
}
   $(".list tr").slice(1).each(function(){  
	    var p = this; 	   
	    $(this).children().slice(1).click(function(){     	
	        $($(p).children()[0]).children().each(function(){  
	            if(this.type=="checkbox"){ 
	            	
	            	if(!this.checked){
	            		ids+=this.value+",";	
	            		}else{
	            		ids=ids.replace(this.value+",","");
	            		}
	            	 $("#ids").val(ids);
	            	 
	                if(!this.checked){   
	                    this.checked = true;  
	                }else{  	                
	                    this.checked = false; 
	                }  
	            }
	        });  
	    });  
	}); 
} 
	function initCheck(){
		$("input[name='checkboxSingle']").each(function(){
			    //包含
			if(ids.indexOf($(this).val()) > -1){
				//alert($(this).val());
				$(this).prop("checked",true);
				this.parentNode.parentNode.style.background="yellow";
			}				
		})
	} */
	</script>

