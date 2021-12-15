<%@page import="io.github.spring.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit form</title>

<script>
/* function delete_ok(id){
	var a = confirm("정말로 삭제하겠습니까?");
	if(a) location.href='deleteok/' + id;
} */
</script>
</head>
<body>

<%
BoardVO u = (BoardVO) request.getAttribute("u");
%>

<h1>Edit Form</h1>

<!-- 상품 정보 삭제 폼  -->
<form action="../delete_ok/${u.getProduct_id()}" method="get">
<input type="submit" value="Delete"/>
</form>
<form action="../editok" method="post">
<input type="hidden" name="product_id" value="<%=u.getProduct_id()%>"/>
<table>
<tr><td colspan="2"><input type="submit" value="Edit"/>
<tr><td>Pic</td><td><input type="text" name="pic" value="<%= u.getPic()%>"/></td></tr>
<tr><td>Product Name</td><td><input type="text" name="name" value="<%= u.getName()%>" /></td></tr>
<tr><td>Category:</td><td><input type="text" name="category" value="<%= u.getCategory()%>" /></td></tr>
<tr><td>Manufacturer</td><td><input type="text" name="manufacturer" value="<%= u.getManufacturer()%>"/></td></tr>
<tr><td>Price:</td><td><input type="text" name="price" value="<%= u.getPrice()%>" /></td></tr>
<tr><td>Release date:</td><td><input type="text" name="releasedate" value="<%= u.getReleasedate()%>"/></td></tr>
<tr><td>Detail</td><td><textarea cols="50" rows="5" name="detail"><%= u.getDetail()%></textarea></td></tr>
<input type="button" value="back" onclick="location.href='../adminlist'"/></td></tr>
<!-- back 기능이 있으면 좋을것 같아서  -->
</table>
</form>


<!-- 댓글 폼  -->

<!-- 임시 댓글 추가 기능도 구현  -->
<!-- 해당 기능은 사용자 화면으로 복붙하면 될듯!  -->

<br><br><tr><td>[ Comments Adding Function ]</td></tr><br>
<form action="../addcommentok/${u.getProduct_id()}" method="post">
<input type="hidden" name="productId" value="<%=u.getProduct_id()%>"/>
<%-- <input type="hidden" name="product_id" value="<%=u.getProduct_id()%>"/> --%>
<table>
<tr><td>Nickname</td><td><input type="text" name="nickname"/></td></tr>
<tr><td>Contents</td><td><input type="text" name="contents"/></td></tr>
<tr><td><input type="submit" value="Post"/></td></tr>
</table>
</form>

<br>

<!-- comment delete function  -->
<table id="clist" width="90%">
<tr><td>[ Comments ]</td></tr>
<c:forEach items="${clist}" var="c">
<tr><td>nick : ${c.getNickname()}</td></tr>
<tr><td>contents : ${c.getContents()}</td>
	<td>
	<form action="../deletec_ok/${c.getProductId()}/${c.getComment_id()}" method="get">
	<input type="submit" value="Delete"/>
	</form>
	<td>
	
</tr>
</c:forEach>
</table>


</body>
</html>