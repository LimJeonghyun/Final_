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
			<a href="../"> <img class="logo" alt="logo"
				src="../resources/image/jangbee.png"></a>
		</div>
		<div class="col-sm"></div>
	</div>

	<div class="row tapbar">
		<div class="col-sm"></div>
		<div class="col-sm">
			<h5>
				<a href="../list/keyboard">키보드</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="../list/mouse">마우스</a>
			</h5>
		</div>
		<div class="col-sm">
			<h5>
				<a href="../list/monitorarm">모니터암</a>
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
			<div class="col-sm-1"></div>
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
			<div class="col-sm-1"></div>
		</div>

	</div>

	<br>
	<br>

	<div class="row">
		<div class="col-sm-1"></div>

		<div class="col comment">
			<h4>[댓글 달기]</h4>
			<form action="../addcommentok/${u.product_id}" method="post">
				<input type="hidden" name="product_id" value="${u.product_id}" />
				<div class="col-sm">
					<label for="nickname">닉네임</label>
				</div>
				<div class="col-sm">
					<input type="text" name="nickname" placeholder="닉네임" required />
				</div>
				<div class="col-sm">
					<label for="comment">내용</label>
					<div class="col-sm">
						<textarea name="comment" cols="30" rows="3"
							placeholder="내용을 입력해주세요." required></textarea>
					</div>
				</div>


				<button type="submit" class="btn btn-secondary btn-sm px-4 me-md-2">댓글
					입력</button>
				<br> <br>

				<div class="row">

					<c:forEach items="${clist}" var="c">
						<br>
						<div class="row-sm">${c.nickname}님의댓글:</div>
						<div class="row-sm">
							<p>${c.comment}</p>
						</div>
						<br>
					</c:forEach>

				</div>
			</form>

		</div>
		<div class="col-sm-1"></div>
	</div>
</body>
</html>