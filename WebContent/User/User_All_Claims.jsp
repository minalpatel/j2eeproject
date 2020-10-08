<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All User Claims</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<header>
<%@ include file = "header.html" %>
</header>
<body style="text-align:center;">

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
	
	<sql:query dataSource="${dbsource}" var="pendingResult">
            SELECT * from user_claim where username = '${param.username}' AND product = '${param.product_name}' AND status = 'pending';
    </sql:query>
	
	<h1>Pending Claims</h1>
	<table  border="1" width="40%" align="center">
	<tr>
		<th>Claim Id</th>
		<th>User Name</th>
		<th>Claim Date</th>
		<th>Description</th>
		<th>Product</th>
	</tr>
	<c:forEach var="prows" items="${pendingResult.rows}">
		<tr>
			<td><c:out value="${prows.claim_id}" /></td>
			<td><c:out value="${prows.username}" /></td>
			<td><c:out value="${prows.claimdate}" /></td>
			<td><c:out value="${prows.description}" /></td>
			<td><c:out value="${prows.product}" /></td>
		</tr>
	</c:forEach>
	</table>
	
	<sql:query dataSource="${dbsource}" var="approvedResult">
            SELECT * from user_claim where username = '${param.username}' AND product = '${param.product_name}' AND status = 'approved';
    </sql:query>
	
	<h1>Approved Claims</h1>
	<table  border="1" width="40%" align="center">
	<tr>
		<th>Claim Id</th>
		<th>User Name</th>
		<th>Claim Date</th>
		<th>Description</th>
		<th>Product</th>
	</tr>
	<c:forEach var="arows" items="${approvedResult.rows}">
		<tr>
			<td><c:out value="${arows.claim_id}" /></td>
			<td><c:out value="${arows.username}" /></td>
			<td><c:out value="${arows.claimdate}" /></td>
			<td><c:out value="${arows.description}" /></td>
			<td><c:out value="${arows.product}" /></td>
		</tr>
	</c:forEach>
	</table>
	
	<sql:query dataSource="${dbsource}" var="rejectedResult">
            SELECT * from user_claim where username = '${param.username}' AND product = '${param.product_name}' AND status = 'rejected';
    </sql:query>
	
	<h1>Rejected Claims</h1>
	<table  border="1" width="40%" align="center">
	<tr>
		<th>Claim Id</th>
		<th>User Name</th>
		<th>Claim Date</th>
		<th>Description</th>
		<th>Product</th>
	</tr>
	<c:forEach var="rrows" items="${rejectedResult.rows}">
		<tr>
			<td><c:out value="${rrows.claim_id}" /></td>
			<td><c:out value="${rrows.username}" /></td>
			<td><c:out value="${rrows.claimdate}" /></td>
			<td><c:out value="${rrows.description}" /></td>
			<td><c:out value="${rrows.product}" /></td>
		</tr>
	</c:forEach>
	</table >
	<footer>
	<%@ include file = "footer.html" %>
	</footer>
</body>
</html>