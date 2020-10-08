<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User_Validation</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<header>
<%@ include file = "header.html" %>
</header>
<center>
<h1>Are you a current User ?</h1>
<span>
<a href="login_user.jsp?productSelected=<%= request.getParameter("product_name") %>">Yes</a>
</span>
<span><a href="User_Registration.jsp?productSelected=<%= request.getParameter("product_name") %>">No</a></span>
<br><br>
<a href="Index.jsp">Go to Home</a>
</center>
<footer>
<%@ include file = "footer.html" %>
</footer>
</body>
</html>