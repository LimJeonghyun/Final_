<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@page import="io.github.spring.UserController"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<title>상품 조회 페이지</title>

<script>
	/* function delete_ok(id){
	 var a = confirm("정말로 삭제하겠습니까?");
	 if(a) location.href='deleteok/' + id;
	 } */
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm">
			<img class="logo" alt="logo" src="../resources/image/jangbee.png">
		</div>
		<div class="col-sm"></div>
	</div>

	<div class="row tapbar">
		<div class="col-sm"></div>
		<div class="col-sm">
			<h5>
				<a href="">키보드</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="">마우스</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="">모니터암</a>
			</h5>
		</div>
		<div class="col-sm"></div>
	</div>

	<div class="col">
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm">
				<img class="detailimage" alt="detailimage" src="${u.pic}">
			</div>
			<div class="col-sm"></div>
		</div>
		<div class="row">
			<div class="col-sm"></div>
			<div class="col detail">
				<div class="col-sm">
					<h2 class="data">${u.name}</h2>
				</div>
				<div class="col-sm">
					<h4 class="data">${u.manufacturer}</h4>
				</div>
				<div class="col-sm">
					<h6>${u.price}</h6>
				</div>
				<div class="col-sm">
					<h6>${u.releasedate}출시</h6>
				</div>

				<div class="col-sm">
					<img class="detailimage" alt="detailimage" src="${u.detail}">
				</div>
			</div>
			<div class="col-sm"></div>
		</div>

	</div>

	<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm comment">
			<h5>[댓글]</h5>

			<form action="../addcommentok/${u.product_id}" method="post">
				<input type="hidden" name="product_id" value="${u.product_id}" />
				<table width="100%">
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" required /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="comment" required> </textarea></td>
					</tr>
				</table>
				<button type="submit" class="btn btn-secondary btn-sm px-4 me-md-2">댓글
					입력</button>
				<table>
					<c:forEach items="${clist}" var="c">
						<td>${c.nickname}님의댓글</td>
						<td><p>${c.comment}</p></td>
					</c:forEach>
				</table>
			</form>
		</div>
		<div class="col-sm"></div>
	</div>

</body>
</html>