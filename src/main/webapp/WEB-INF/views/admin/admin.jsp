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
	<link href="${path}/resources/css/style.css" rel="stylesheet" >
	<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
<title>관리자 로그인</title>
</head>
<body>

<h1>
관리자 로그인
</h1>

<form name="form" action="checklogin" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw" maxlength='10'><br>
		<input type="submit" value="로그인"><br>
</form>

</body>
</html>