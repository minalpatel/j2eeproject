<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>

<body >
	<header>
	<%@ include file = "header.html" %>
	</header>
		<main>
			<a href="action_admin.jsp">Go to Home</a>
		
		
		
		<h1>List of Users</h1>
				
		<form>
<sql:setDataSource var="dbname" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
		<sql:query dataSource="${dbname}" var="result">
            SELECT * FROM user_registration;
        </sql:query>
			<table border="1" width="40%" align="center">
				<caption>Users List</caption>
				
				<tr>
					<th>User Name</th>
					<th>Name</th>
					<th>Password</th>
					<th>Contact Number</th>
					<th>E-mail</th>
					<th>Address</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.name}" /></td>
						<td><c:out value="${row.password}" /></td>
						<td><c:out value="${row.contactnumber}" /></td>
						<td><c:out value="${row.email}" /></td>
						<td><c:out value="${row.adress}" /></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</main>
	<footer>
	<%@ include file = "footer.html" %>
	</footer>
</body>
</body>
</html>