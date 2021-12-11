<%@page import="io.github.spring.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit form</title>

<script>
function delete_ok(id){
	var a = confirm("정말로 삭제하겠습니까?");
	if(a) location.href='deleteok/' + id;
}
</script>
</head>
<body>

<%
BoardVO u = (BoardVO) request.getAttribute("u");
%>

<h1>Edit Form</h1>
<form action="../editok" method="post">
<input type="hidden" name="product_id" value="<%=u.getProduct_id()%>"/>
<table>
<tr><td>Pic</td><td><input type="text" name="pic" value="<%= u.getPic()%>"/></td></tr>
<tr><td>Product Name</td><td><input type="text" name="name" value="<%= u.getName()%>" /></td></tr>
<tr><td>Category:</td><td><input type="text" name="category" value="<%= u.getCategory()%>" /></td></tr>
<tr><td>Manufacturer</td><td><input type="text" name="manufacturer" value="<%= u.getManufacturer()%>"/></td></tr>
<tr><td>Price:</td><td><input type="text" name="price" value="<%= u.getPrice()%>" /></td></tr>
<tr><td>Release date:</td><td><input type="text" name="releasedate" value="<%= u.getReleasedate()%>"/></td></tr>
<tr><td>Detail</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit"/>
<!-- <input type="button" value="Cancel" onclick="history.back()"/></td></tr> -->
</table>
</form>

<form action="../delete_ok/${u.getProduct_id()}" method="get">
<input type="submit" value="Delete"/>
</form>
<%-- <a href="../delete_ok/${u.getProduct_id()}">Delete</a> --%>
</body>
</html>