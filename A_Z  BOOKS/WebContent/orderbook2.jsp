<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.book.books"%>
<%@page import="com.sun.xml.internal.ws.api.ha.StickyFeature"%>
<%@page import="com.book.bookdb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
books b=new books();
bookdb bd=new bookdb();
String bbid=request.getParameter("bid");
int bid=Integer.parseInt(bbid);
String pprice=request.getParameter("price");
float price=Float.parseFloat(pprice);
int qty=Integer.parseInt(request.getParameter("qty"));
float tprice=bd.ttprice(qty, price);
String status="new";
int stock=Integer.parseInt(request.getParameter("stock"));
String ccid=session.getAttribute("cid").toString();
int cid=Integer.parseInt(ccid);
int qqty=(stock-qty);
Date dt=new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String odate=sdf.format(dt);
b.setBid(bid);
b.setCid(cid);
b.setTprice(tprice);
b.setQty(qty);
b.setOdate(odate);
b.setStatus(status);
boolean st=bd.orders(b);
if(qty<stock)
{
if(st)
{
	boolean sst=bd.cqty(bid,qqty);
	if(sst)
	{
%>
<jsp:forward page="vaob.jsp?page=1">	
<jsp:param value="Ordered" name="reesult"/>
</jsp:forward>	

<% 
	}
}
else
{
%>
<jsp:forward page="vaob.jsp?page=1">
<jsp:param value="FAILED" name="reesult"/>
</jsp:forward>	

<%
}
}
else
{
%>
<jsp:forward page="vaob.jsp?page=1">
<jsp:param value="Limited only check stock list " name="reesult"/>
</jsp:forward>	

<% 
}
%>
</body>
</html>