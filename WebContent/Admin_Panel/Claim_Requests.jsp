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
		
		
		
		<h1>List of Unclaimed Products</h1>
				
<sql:setDataSource var="dbname" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
		<sql:query dataSource="${dbname}" var="result">
            SELECT * FROM user_claim;
        </sql:query>
			<table border="1" width="40%" align="center">
				
				
				<tr>
				<th>Claim Id</th> 
					<th>User Name</th>
					<th>Product Name</th>
					<th>Status</th>
					<th colspan="2">Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
					<c:if test="${row.status == 'pending' }" >
					<td name="id"><c:out value="${row.claim_id}" /></td>
					<td><c:out value="${row.username}" /></td>
					<td><c:out value="${row.product}" /></td>  
					<td><c:out value="${row.status}" /></td>
					<td><a href="claimapproveDB.jsp?id=${row.claim_id }">Approved</a></td>
					<td><a href="claimdisapproveDB.jsp?id=${row.claim_id }">Disapproved</a></td>
					</c:if>													
					</tr>
				</c:forEach>
			</table>
			<h1>List of claimed Products</h1>
				
<sql:setDataSource var="dbname" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
		<sql:query dataSource="${dbname}" var="result">
            SELECT * FROM user_claim;
        </sql:query>
			<table border="1" width="40%" align="center">
				
				
				<tr>
				<th>Claim Id</th> 
					<th>User Name</th>
					<th>Product Name</th>
					<th>Status</th>
					
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
					<c:if test="${row.status != 'pending' }" >
					<td name="id"><c:out value="${row.claim_id}" /></td>
					<td><c:out value="${row.username}" /></td>
					<td><c:out value="${row.product}" /></td>  
					<td><c:out value="${row.status}" /></td>
					
					</c:if>													
					</tr>
				</c:forEach>
			</table>
			
	
	</div>
</body>
</html>