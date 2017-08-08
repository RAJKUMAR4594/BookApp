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
<a href="addbook.jsp" target="body1">Add New Book</a><br><br>
<a href="vob.jsp" target="body1">View Book</a><br><br>
<a href="valb.jsp?page=1" target="body1">View All Book</a><br><br>
<a href="udv.jsp?page=1" target="body1">Update/delete Book</a><br><br>
<a href="ordercon.jsp" target="body1">Order Confirmation</a><br><br>
<a href="cusview.jsp?page=1" target="body1">Customer Info</a><br><br>
<a href="logout.jsp" target="body">Log out</a><br><br>
</center>

<center>${param["result"]}</center><br>
<br>
</body>
</html>