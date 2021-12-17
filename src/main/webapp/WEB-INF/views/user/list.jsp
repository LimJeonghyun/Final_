<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${path}/resources/css/style.css" rel="stylesheet">
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<title>제품 목록</title>

<script>
	
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

	<div class="row">
		<c:forEach items="${list}" var="u">
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href=""><img src="${u.pic}" class="thumbnailimage" width="100%"></a>
				</div>
				<div class="description">
					<div class="productname">
						<a href="">${u.name}</a>
					</div>
					<div class="productprice">
						<p class="productprice">${u.price}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>



