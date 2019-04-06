<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
   <c:if test="${!empty productList}">
	<h3>产品展示表</h3>
	<table   class="display"  border="1px" cellspacing="0px" cellpadding="0px" id="productTable">
    <thead>
    <tr>
    <th><input type="checkbox" id="checkAll" />全选/反选<input type="checkbox" id="reCheck" /></th>
    <th>编号</th>
    <th>产品名称</th>
     <th>产品图片</th>
    <th><input type="button"  value="↑" data_rank_msg="price" data_rank="asc" />产品价格 <input type="button" value="↓" id="priceDown"  data_rank_msg="price" data_rank="desc"/></th>
    <th>产品品牌</th>
    <th><input type="button"   value="↑" data_rank_msg="createTime" data_rank="asc"/>创建时间<input type="button" value="↓" data_rank_msg="createTime" data_rank="desc"/></th>
    <th><input type="button"   value="↑" data_rank_msg="updateTime" data_rank="asc"/>修改时间<input type="button" value="↓" data_rank_msg="updateTime" data_rank="desc"/></th>
    <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="product">
    <tr>
    <td><input type="checkbox"  name="checkboxSingle" value="${product.id}" /></td>
    <td>${product.id}</td>
    <td>${product.productName}</td>
    <td> <%--<img src="<%=request.getContextPath()%>${product.imagePath}" style="width: 90px">--%>
     <%--<a href="<%=request.getContextPath()%>/product/downloadPicture.jhtml?imagePath=${product.imagePath}">图片下载</a>--%>
      <%--只展示一张图片--%>
        <% int imageIndex=0; %>
     <c:forEach items="${imageVOList}" var="imageVO" varStatus="index">
      <c:if test="${product.imagePath==imageVO.productId}">
       <%  imageIndex++; %>
          <%if(imageIndex==1){%>
       <img src="<%=request.getContextPath()%>${imageVO.productImagePath}" style="width: 90px">
          <%}%>

      </c:if>
         <%--<%break;%>--%>
    </c:forEach>

     </td>
    <td>${product.price}</td>
     <td>${product.brand.brandName}</td>
    <td><fmt:formatDate value="${product.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
    <td><fmt:formatDate value="${product.updateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
    
<%--     <td><a href="<%=request.getContextPath()%>/product/deleteProduct.jhtml?id=${product.id}">删除</a></td>--%> 
    <td><a href="javascript:deleteProduct('${product.id}')">删除</a>  <a href="<%=request.getContextPath()%>/product/toUpdateProduct.jhtml?id=${product.id}">修改</a>
     <a href="javascript:lookPicture('${product.imagePath}')"> 查看图片</a>
    </td>
    </tr>
    </c:forEach>
    </tbody>
	</table>
	</c:if>
	<c:if test="${empty productList}">
	<h1><font color="red">I am sorry ， It is not found related  message！！！</font></h1>
	</c:if>
	
	<jsp:include page="/WEB-INF/common/ajaxpage.jsp"></jsp:include>