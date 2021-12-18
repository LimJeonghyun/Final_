<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>제품 추가</title>
</head>
<body>

	<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm">
			<a href="../adminhome"><img class="logo" alt="logo" src="../../resources/image/jangbee.png"></a>
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

	<h1>제품 추가</h1>
	<form action="../addok/${category}" method="post">
		<table>
			<tr>
				<td>제품 사진 URL</td>
				<td><input type="text" name="pic" /></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td><input type="text" name="category" value="${category}" /></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="manufacturer"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>출시년월(YYYY/MM)</td>
				<td><input type="text" name="releasedate"></td>
			</tr>
			<tr>
				<td>제품 상세이미지 URL</td>
				<td><input type="text" name="detail"></td>
			</tr>
		</table>
		<button class="btn btn-primary btn-lg px-4 me-md-2" type="submit">제품
			추가</button>
	</form>

</body>
</html>