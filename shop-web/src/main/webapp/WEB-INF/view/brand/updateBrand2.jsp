<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.js"></script>

    <title>Insert title here</title>
</head>
<body>
  <center>
  <h3>品牌修改</h3>
 <form action="<%=request.getContextPath()%>/brand/updateBrandImage.jhtml" method="post" enctype="multipart/form-data">
     <table border="1" cellspacing="0" cellpadding="0">

          <input type="hidden" name="id" value="${brand.id}"/><br>
         <input type="hidden" name="brandImagePath" value="${brand.brandImagePath}"/><br>

      <tr>
          <td>品牌名称：</td><td>
       <input type="text" name="brandName" value="${brand.brandName}"/></td>
      </tr>

         <tr>
             <td>主图展示：</td><td>
             <div >

             <span>
                 <img src="<%=request.getContextPath()%>${brand.brandImagePath}" width="100px" height="100px"/>
             <input type="file" name="brandImageName"/>
                 <input type="button" onclick="delHeadSpan(this)" value="删除"/>
              </span>


             </div>
         </td>
         </tr>




         <tr>
             <td>子图展示：</td><td>
             <div style="width: 500px">
                 <c:forEach items="${brandImageList}" var="brandImage">

             <div style="float: left" data-image="del">
                 <img src="<%=request.getContextPath()%>${brandImage.brandImagePath}" width="100px" height="100px"/>
                 <center>
                 <div style="float:bottom ">
                     <input type="button" onclick="delImageDiv(this,'${brandImage.id}','${brandImage.brandImagePath}')" value="删除"/>
                 </div>
                 </center>
              </div>
                 </c:forEach>

             </div>
             </td>
         </tr>

         <tr data-image="brangImage">
             <td>图片添加：</td><td>
             <input type="file" name="brandChildImageName"/>
             <input type="button" onclick="addFileInput()" value="+"/></td>
         </tr>


         <tr>
             <td>操作：</td><td>
             <input type="submit" value="品牌修改"/>
                 <input type="reset" value="重置"/>
             </td>
         </tr>

     </table>
     <%--图片id拼接--%>
     <input type="hidden" name="ids"/>
     <%--图片名称拼接--%>
     <input type="hidden" name="pictureNames"/>
 </form>
 </center>
<script >
    //动态添加inputFile
    function addFileInput() {
     $("tr[data-image='brangImage']").last().after(' <tr><td>添加子图片：</td><td>' +
         '<input type="file" name="brandChildImageName"/>' +
         '<input type="button" onclick="delFileInput(this)" value="-"/></td> </tr>')
    }

    //动态删除inputFile
    function delFileInput(obj){
        $(obj).parents("tr").remove();
    }
    //删除span
    function delImageDiv(obj,ImageId,pictureName) {
        $("input[name='ids']").val($("input[name='ids']").val()+ImageId+",");
        $("input[name='pictureNames']").val($("input[name='pictureNames']").val()+pictureName+",");
        $(obj).parents("div[data-image=\"del\"]").remove()
    }

    //删除主图span
    function delHeadSpan(obj) {
        $(obj).parent().remove()
    }

</script>

</body>
</html>