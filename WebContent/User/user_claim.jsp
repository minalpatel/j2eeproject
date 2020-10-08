<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Claim Product</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="text-align:center;">
 <header>
 <%@ include file = "header.html" %>
 </header>
 <main>
 <h2>Claim Product</h2>
	<form method="post" action="user_claimDB.jsp">
		<label>Username: </label>
		<input type="text" value="${param.username }" name="username" readonly>		
		<br><br>
		
		<label>Product: </label>
		<input type="text" value="${param.product_name }" name="product_name" readonly> 
		<br><br>
		
		<label>Date of Claim</label>
		<input type="date" name="claimdate">
		<font color="red">
		  <c:if test="${not empty param.errClaim}">
		   		<c:out value="${param.errClaim}" />
		   </c:if>
	   </font>
		<br><br>
		
		<label>Description: </label>
		<textarea rows="8" cols="20" name="description"></textarea>
		<font color="red">
		  <c:if test="${not empty param.errDesc}">
		   		<c:out value="${param.errDesc}" />
		   </c:if>
	   </font>
		<br><br>
		
		<input type="submit" name="submit" value="submit"/>
	</form>
	</main>	
<footer>
<%@ include file = "footer.html" %>
</footer>
</body>
</html>