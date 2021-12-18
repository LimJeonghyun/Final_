<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="io.github.spring.AdminController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<title>Edit form</title>

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
			<img class="logo" alt="logo" src="../../resources/image/jangbee.png">
		</div>
		<div class="col-sm"></div>
	</div>

	<div class="row tapbar">
		<div class="col-sm"></div>
		<div class="col-sm">
			<h5>
				<a href="../adminlist/keyboard">키보드</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="../adminlist/mouse">마우스</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="adminlist/monitorarm">모니터암</a>
			</h5>
		</div>
		<div class="col-sm"></div>
	</div>

	<button class="btn btn-secondary btn-lg px-4 me-md-2"
		onclick="location.href='../adminlist/${u.category}'">돌아가기</button>

	<!-- back 기능이 있으면 좋을것 같아서  -->

	<!-- 상품 정보 수정 폼 -->
	<form action="../editok/${u.category}" method="post">
		<input type="hidden" name="product_id" value="${u.product_id}" />

		<table>
			<tr>
				<td>제품 사진 URL</td>
				<td><input type="text" name="pic" value="${u.pic}" /></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" value="${u.name}" /></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input type="text" name="category" value="${u.category}" /></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="manufacturer"
					value="${u.manufacturer}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${u.price}"></td>
			</tr>
			<tr>
				<td>출시년월(YYYY/MM)</td>
				<td><input type="text" name="releasedate"
					value="${u.releasedate}"></td>
			</tr>
			<tr>
				<td>제품 상세이미지 URL</td>
				<td><input type="text" name="detail" value="${u.detail}"></td>
			</tr>
		</table>
		<button class="btn btn-primary btn-lg px-4 me-md-2" type="submit">수정
			완료</button>
	</form>

	<!-- 상품 정보 삭제 폼  -->
	<form action="../deleteok/${u.product_id}/${u.category}" method="get">
		<button class="btn btn-warning btn-lg px-4 me-md-2" type="submit">제품
			삭제</button>
	</form>

	<!-- comment delete function  -->
	<table id="clist" width="90%">
		<tr>
			<td>[ 댓글 ]</td>
		</tr>
		<c:forEach items="${clist}" var="c">
			<tr>
				<td>닉네임 : ${c.nickname}</td>
			</tr>
			<tr>
				<td>내용 : ${c.comment}</td>
				<td>
					<form action="../deletecommentok/${c.product_id}/${c.comment_id}"
						method="get">
						<input type="submit" value="댓글 삭제" />
					</form>
				<td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>