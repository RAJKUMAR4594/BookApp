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
	background-color:gray;
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
int id=bd.inss();
id+=1;

%>
<table>
<form action="ibj.jsp"> 
<% out.write("<tr><td>Book_ID	</td><td>:<input type='text' readonly='readonly' name='bid' value="+id+"></td></tr>"); %>
<tr><td>Book Name	</td><td>:<input type="text" name="bname"></td></tr>
<tr><td>Author Name	</td><td>:<input type="text" name="author"></td></tr>
<tr><td>Book Edition	</td><td>:<input type="text" name="edition"></td></tr>
<tr><td>Book Price	</td><td>:<input type="text" name="price"></td></tr>
<tr><td>Book Stock	</td><td>:<input type="text" name="stock"></td></tr>
<tr><td><input type="submit" value="Add Book"></td></tr>
</form>
</table>
</center>

</body>
</html>