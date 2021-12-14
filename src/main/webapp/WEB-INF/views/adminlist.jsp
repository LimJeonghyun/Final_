<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Free Board</title>
<style>
#list {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
#list td, #list th {
  border: 1px solid #ddd;
  padding: 8px;
  text-align:center;
}
#list tr:nth-child(even){background-color: #f2f2f2;}
#list tr:hover {background-color: #ddd;}
#list th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #006bb3;
  color: white;
}
</style>
<script>
/* function delete_ok(id){
	var a = confirm("정말로 삭제하겠습니까?");
	if(a) location.href='deleteok/' + id;
} */
</script>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id= request.getParameter("id");
	String pw = request.getParameter("pw");
	String admin_id = "admin";
	String admin_pw = "password";

	if(id.equals(admin_id) && pw.equals(admin_pw)){
		 //session.setAttribute("id", id);
		%>
		<script>alert("로그인 성공!"); </script><% 
	}
	else{
		%>
		<script>alert("로그인 실패 :("); history.back(); </script><%
	}
%>

<h1>목록화면</h1>

<table id="list" width="90%">
<tr>
	<th>Pic</th>
	<th>Namee</th>
	<th>Price</th>
	
</tr>
<c:forEach items="${list}" var="u">
	<tr>
		<td><a href="editform/${u.getProduct_id()}">${u.getPic()}</a></td>
		<td><a href="editform/${u.getProduct_id()}">${u.getName()}</a></td>
		<td>${u.getPrice()}</td>
	</tr>
</c:forEach>
</table>
<br/>
<form action="add" method="get">
<input type="submit" value="Add"/>
</form>

</body>
</html>