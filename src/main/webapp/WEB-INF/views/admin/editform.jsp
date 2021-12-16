<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="io.github.spring.AdminController"%>
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

<h1>Edit Form</h1>

<input type="button" value="돌아가기" onclick="location.href='../adminlist'"/></td></tr>
<!-- back 기능이 있으면 좋을것 같아서  -->

<!-- 상품 정보 삭제 폼  -->
<form action="../deleteok/${u.product_id}" method="get">
<input type="submit" value="제품 삭제"/>
</form>

<!-- 상품 정보 수정 폼 -->
<form action="/editok" method="post">
<input type="hidden" name="product_id" value="${u.product_id}"/>
<table>
<tr><td colspan="2"><input type="submit" value="Edit"/>
<tr><td>Pic</td><td><input type="text" name="pic" value="${u.pic}"/></td></tr>
<tr><td>Product Name</td><td><input type="text" name="name" value="${u.name}" /></td></tr>
<tr><td>Category</td><td><input type="text" name="category" value="${u.category}" /></td></tr>
<tr><td>Manufacturer</td><td><input type="text" name="manufacturer" value="${u.manufacturer}"/></td></tr>
<tr><td>Price</td><td><input type="text" name="price" value="${u.price}" /></td></tr>
<tr><td>Release date</td><td><input type="text" name="releasedate" value="${u.releasedate}"/></td></tr>
<tr><td>Detail</td><td><textarea cols="50" rows="5" name="detail">${u.detail}</textarea></td></tr>

</table>
</form>


<!-- 댓글 폼  -->

<!-- 임시 댓글 추가 기능도 구현  -->
<!-- 해당 기능은 사용자 화면으로 복붙하면 될듯!  -->

<%-- <br><br><tr><td>[ 댓글 ]</td></tr><br>
<form action="../addcommentok/${u.product_id}" method="post">
<input type="hidden" name="product_id" value="${u.product_id}"/>
<input type="hidden" name="product_id" value="${u.Product_id}"/>
<table>
<tr><td>닉네임</td><td><input type="text" name="nickname"/></td></tr>
<tr><td>내용</td><td><input type="text" name="comment"/></td></tr>
<tr><td><input type="submit" value="댓글 달기"/></td></tr>
</table>
</form>

<br> --%>

<!-- comment delete function  -->
<table id="clist" width="90%">
<tr><td>[ 댓글 ]</td></tr>
<c:forEach items="${clist}" var="c">
<tr><td>닉네임 : ${c.nickname}</td></tr>
<tr><td>내용 : ${c.comment}</td>
	<td>
	<form action="../deletecommentok/${c.product_id}/${c.comment_id}" method="get">
	<input type="submit" value="댓글 삭제"/>
	</form>
	<td>
	
</tr>
</c:forEach>
</table>


</body>
</html>