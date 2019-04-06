<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
  
  <c:if test="${!empty brandList}">
   <center>
    <div id="tableRank">
   <h3>品牌展示表</h3>
   <table class="list"  border="1px" cellspacing="0px" cellpadding="0px" id="brandTable">
   <thead>
   <tr>
   <th>全选<input type="checkbox" id="checkAll" />/反选<input type="checkbox" id="reCheck" /></th>
   <th>编号</th> 
   <th>品牌名称</th>
    <th>品牌图片</th>
   <th>创建时间</th>
   <th>修改时间</th>
   <th>操作</th>
   <th>编辑</th>
   </tr>
   </thead>
   <tbody>
 
   
 
   <c:forEach items="${brandList}" var="brand">
   <tr>
   <td><input type="checkbox" name="checkboxSingle" value="${brand.id}" /></td>
   <td>${brand.id}</td>
   <td data-id="${brand.id}" data-brandName="${brand.brandName}">${brand.brandName}</td>
   <td ><img src="<%=request.getContextPath()%>${brand.brandImagePath}" width="100px" height="100px">
   </td>
   <td><fmt:formatDate value="${brand.createTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
   <td><fmt:formatDate value="${brand.updateTime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
   <td><input type="button" value="删除" onclick="deleteBrand('${brand.id}')">
   <input type="button" value="修改" onclick="toUpdateBrand('${brand.id}')">
    <input type="button" value="查看子图" onclick="viewChildImages('${brand.id}')">
   </td>
   <td> <input type="button" value="编辑" onclick="editorBrand('${brand.id}')"></td>
  
   </tr>
   
   </c:forEach>
  
   </tbody>
   </table>
    </div>
   </center>
   </c:if>
   
   <c:if test="${empty brandList}">
   <h1><font color="red"> I am sorry ， It is not  related  message！！！</font></h1>
   </c:if>
  <div id="pageDiv"> <jsp:include page="/WEB-INF/common/ajaxpage.jsp"></jsp:include></div>
