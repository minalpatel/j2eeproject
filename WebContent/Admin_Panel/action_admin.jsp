<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Panel</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<header>
<%@ include file = "header.html" %>
</header>
<main>
<h1>Welcome to admin Panel</h1>
<h2> What would you like to do today?</h2><br>
<a href="Display_User.jsp">Users</a><br><br>
<a href="Products_Registered.jsp">Products Registration </a><br><br>
<a href="User_R_Products.jsp">Registered User Products</a><br><br>
<a href="Claim_Requests.jsp">Claim Requests</a>
<footer>
<%@ include file = "footer.html" %>
</footer>
</main>
</body>
</html>