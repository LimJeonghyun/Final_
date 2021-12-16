<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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