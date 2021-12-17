<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page session="false" %>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${path}/resources/css/style.css" rel="stylesheet" >
<link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
	<title>관리자 홈</title>
</head>
<body>
<h1>
 관리자 홈
</h1>

<P>  The time on the server is ${serverTime}. </P>

</body>
</html>
