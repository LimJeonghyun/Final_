<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="io.github.spring.AdminController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Free Board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>
<script>

</script>
</head>
<body>


<!-- 목록 출력  -->
<!-- 목록 출력  -->
<h1>제품 목록</h1>

<table id="list" width="90%">
<tr>
	<th>ID</th>
	<th>Pic</th>
	<th>Name</th>
	<th>Price</th>
	
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		
		<td>${u.product_id}</td>
		<td>${u.pic}</td>
		<td>${u.name}</td>
		<td>${u.price}</td> 
	</tr>
</c:forEach>
</table>
<br/>
<form action="add" method="get">
<input type="button" value="제품 추가" onclick="location.href='../add/${category}'"/>
</form>

</body>
</html>