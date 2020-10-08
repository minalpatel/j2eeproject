<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="text-align:center;">
<header>
<%@ include file = "header.html" %>
</header>
	<main>
	<h2>
		Welcome,
		<c:out value="${param.username}" />
	</h2>
	
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part1" user="root"
		password="12345" />

	<sql:query dataSource="${dbsource}" var="result">
            SELECT * from product_registered where username = '${param.username }';
    </sql:query>
    
	<nav>
		<a href="Register_Product.jsp?username=${param.username}">Register	Product</a> 
		<a href="Index.jsp">Home</a>
	</nav>
	<br>
	
	<form action="">
			<table border="1" width="80%" align="center">
				<caption>Product List</caption>
				<tr>
					<th>Registration ID</th>
					<th>Product Name</th>
					<th>Purchased Date</th>
					<th>Serial No</th>
					<th colspan="2">Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.id}" /></td>
						<td  name="product_name" ><c:out value="${row.productname}"/></td>						
						<td><c:out value="${row.purchased_date}" /></td>
						<td><c:out value="${row.serial_no}" /></td>
						<td>
							<a href="user_claim.jsp?product_name=${row.productname}&username=${param.username}">Add A Claim</a>
						</td>
						<td><a href="User_All_Claims.jsp?username=${param.username}&product_name=${row.productname}">Claim Status</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
</main>
<footer>
<%@ include file = "header.html" %>
</footer>
</body>
</html>