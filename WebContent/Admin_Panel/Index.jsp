<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<header>
<%@ include file = "header.html" %>
</header>
<main>
<h1 id="h1"> Welcome to Login Page</h1>
<form name="login" action="admin_login_authenticate.jsp">
User Name <span>*</span>
</label>
<input type="text" name="uname"/><br><br>
<label>
Password <span>*</span>
</label>
<input type="password" name="password"/><br><br>
<input type="submit" name="submit" value="submit"/>
<br><font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font><br>
</form>
</main>
<footer>
<%@ include file = "footer.html" %>
</footer>
</body>
</html>