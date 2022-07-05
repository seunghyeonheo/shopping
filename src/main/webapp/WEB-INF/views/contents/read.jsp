<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <title>상품정보</title>
  <meta charset="utf-8">

</head>
<body>
<div class="container">

<h2 class="col-sm-offset-2 col-sm-10">${dto.pname}의 상품정보</h2>
 <table class="table table-bordered">
 <tr>
 	<td colspan="2" style="text-align: center">
 		<img src="/contents/storage/${dto.filename}"  
 		width="250px" height="250px" class="img-rounded" >
 	</td>
 </tr>
 <tr>
 	<th>상품명</th>
 	<td>${dto.pname}</td>
 </tr>
 <tr>
 	<th>상품번호</th>
 	<td>${dto.cateno}</td>
 </tr>
 <tr>
 	<th>상품가격</th>
 	<td>${dto.price}</td>
 </tr>
 <tr>
 	<th>재고</th>
 	<td>${dto.stock}</td>
 </tr>


 
 </table>
 
 
 <button class="btn btn-default" onclick="location.href='/contents/list'">상품목록</button>

 </div>
 
 <br>
 
</div>
</body>
</html>