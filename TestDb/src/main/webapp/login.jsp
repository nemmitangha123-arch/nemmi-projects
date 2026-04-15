<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="com.java.test.DbConnection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String username=request.getParameter("un");
String pass=request.getParameter("pwd");
try
{
Connection connection=DbConnection.getConnection();
Statement statement=connection.createStatement();	
ResultSet set=statement.executeQuery("select * from admin");
int flag=24;
while(set.next())
{

if(username.equals(set.getString(2)) && pass.equals(set.getNString(3)))
{
	flag=99;
	break;
}
}
if(flag==99)
{
	response.sendRedirect("welcome.jsp");	
}
else
{
	response.sendRedirect("index.html");	

}
}
catch(Exception e)
{
System.out.println(e);	
}








%>










</body>
</html>