<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Products</title>
</head>
<body>
<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/project_part1" user="root" password="12345"></sql:setDataSource>
<sql:query dataSource="${dbCon}" var="result">
select * from product;
</sql:query>
<table border="1">
<tr>
	<th>Product Id</th>
	<th>Product Name</th>
	<th>Product Price</th>
</tr>
<c:forEach var="col" items="${result.rows}">
<tr>
<td><c:out value="${col.product_id}"></c:out> </td>
<td><c:out value="${col.product_name}"></c:out> </td>
<td><c:out value="${col.product_price}"></c:out> </td>

</tr>
</c:forEach>

</table>
</body>
</html>