<%@ page import="java.util.*" %>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:10px;
	background-color:#ff9900;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<center>
<br>
<br>
<form action="menu.jsp">
User_ID		 :<input type="text" name="cid"><br><br>
Password	:<input type="password" name="pwd"><br><br>
<input type="submit" value="login"><br><br>
</form>
<form >
New Customer Register <a href="cde.jsp">Sign up</a>
</form>
<br>
<br>
${param["res"]}
${param["resul"]}
<br>
<br>
<jsp:include page="ref.jsp"></jsp:include>
</center>
</body>
</html>