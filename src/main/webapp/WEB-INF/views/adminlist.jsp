<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>목록화면</h1>

<table id="list" width="90%">
<tr>
	<th>Pic</th>
	<th>Product</th>
	<th>Price</th>
	
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td><a href="editform/${u.getProduct_id()}">${u.getPic()}</a></td>
		<td><a href="editform/${u.getProduct_id()}">${u.getName()}</a></td>
		<td>${u.getPrice()}</td>
	</tr>
</c:forEach>
</table>
<br/>
<form action="add" method="get">
<input type="submit" value="Add"/>
</form>

</body>
</html>