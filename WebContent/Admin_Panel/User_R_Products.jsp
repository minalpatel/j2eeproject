<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>

<body style="text-align:center;">
<header>
<%@ include file = "header.html" %>
</header>	
		
		<div style="align:center;">
			<a href="action_admin.jsp">Go to Home</a>
		
		
		
		<h1>List of Registered Users for Products</h1>
				
		<form>
<sql:setDataSource var="dbname" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
		<sql:query dataSource="${dbname}" var="result">
            SELECT * FROM product_registered;
        </sql:query>
			<table border="1" width="40%" align="center">
				
				
				<tr>
					<th>User Name</th>
					<th>Product Name</th>
					<th>Purchase Date</th>
					<th>Serial Number</th>
					
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.productname}" /></td>
						<td><c:out value="${row.purchased_date}" /></td>
						<td><c:out value="${row.serial_no}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
</body>

</html>