
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.*" %>
<%@ page errorPage="error.jsp" %><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	font-family:verdana,arial,sans-serif;
	font-size:10pt;
	margin:10px;
	background-color:green;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<br><br>
<jsp:useBean id="bd" class="com.book.bookdb"></jsp:useBean>
<%
int id=bd.incu();
id+=1;
%>

<form action="reggcus.jsp" method="POST">
<table>
<% out.write("<tr><td>Customer_ID	</td><td>:<input type='text' readonly='readonly' name='cid' value="+id+"></td></tr>"); %>
<tr><td>Customer Name	</td><td>:<input type="text" name="ccname"></td></tr>
<tr><td>Password		</td><td>:<input type="password" name="ppwd"></td></tr>
<tr><td>Mail_ID			</td><td>:<input type="text" name="mmail_id"></td></tr>
<tr><td>Phone_no		</td><td>:<input type="text" name="pphone_no"></td></tr>
<tr><td>Address			</td><td>:<input type="text" name="aaddr"></td></tr>
<tr><td><input type="submit" value="Register"></td></tr>
</table>
</form>

</center>
</body>
</html>