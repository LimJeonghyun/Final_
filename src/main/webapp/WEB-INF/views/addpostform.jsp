<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product</title>
</head>
<body>

<h1>Add New Product</h1>
<form action="addok" method="post">
<table>
<tr><td>Pic:</td><td><input type="text" name="pic"/></td></tr>
<tr><td>ProductName:</td><td><input type="text" name="name"/></td></tr>
<tr><td>Category:</td><td><input type="text" name="category"/></td></tr>
<tr><td>Manufacturer:</td><td><input type="text" name="manufacturer""></td></tr>
<tr><td>Price:</td><td><input type="text" name="price""></td></tr>
<tr><td>Release Date:</td><td><input type="text" name="releasedate""></td></tr>
<tr><td>Detail:</td><td><textarea cols="50" rows="5" name="detail"></textarea></td></tr>
<td><input type="submit" value="Add"/></td>
</table>
</form>

</body>
</html>