<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String admin_id = "admin";
	String admin_pw = "password";

	if (id.equals(admin_id) && pw.equals(admin_pw)) {
	%>
	<script>
		alert("로그인 성공!");
		location.href = 'adminhome';
	</script>
	<%
	} else {
	%>
	<script>
		alert("로그인 실패 :(");
		history.back();
	</script>
	<%
	}
	%>

</body>
</html>