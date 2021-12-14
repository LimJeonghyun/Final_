<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>
관리자 Login page
</h1>

<form name="form" action="chLogin" method="post">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="pw" maxlength='10'><br>
		<input type="submit" value="로그인"><br>
</form>

</body>
</html>