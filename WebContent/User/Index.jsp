
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>Buy Product</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body style="text-align:center;">
<header>
<%@ include file = "header.html" %>
</header>	
	<main>
		<h1>Buy Product</h1>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from product;
        </sql:query>
		<div style="align:center;">
			<a href="login_user.jsp">Login To Dashboard</a>
		
		<form>
			<table border="1" width="40%" align="center">
				<caption>Product List</caption>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Product Price</th>
					<th colspan="2">Action</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td><c:out value="${row.product_id}" /></td>
						<td><c:out value="${row.product_name}" /></td>
						<td><c:out value="${row.product_price}" /></td>
						<td><a href="Ask_User.jsp?product_name=${row.product_name}">Buy</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</div>
	</main>
<footer>
<%@ include file = "footer.html" %>
</footer>	

</body>
</html>