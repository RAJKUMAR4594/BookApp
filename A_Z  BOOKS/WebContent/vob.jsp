<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.book.*" %>
<%@ page errorPage="error.jsp" %>
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
<form action="vob2.jsp" method="post">
Book name :<select name="bname">
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","root");
PreparedStatement ps=con.prepareStatement("select * from bdetails ;");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	%>
	<option value="<%= rs.getString(2)%>"><%= rs.getString(2)%></option>
	<%
}

%>

</select>
<input type="submit" value="View">
</form>
</center>
</body>
</html>