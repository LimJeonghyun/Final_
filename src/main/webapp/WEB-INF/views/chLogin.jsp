<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>hi</h1>

<%-- <%
request.setCharacterEncoding(“utf-8”);


%> --%>
<%-- <%
if ("admin".equalsrequest.getParameter(“id”())
%>
<%
String id = “admin”, pwd=“password”;
String user_id = request.getParameter(“id”);
String user_pwd = request.getParameter(“pwd”);
if(id.equals(user_id) && pwd.equals(user_pwd)){
	response.sendRedirect(“list.jsp”);
)
else{
	response.sendRedirect(“admin.jsp”);
}
%>
 --%>
</body>
</html>