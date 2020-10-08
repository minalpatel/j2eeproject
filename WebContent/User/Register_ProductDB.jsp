<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Product Database</title>
</head>
<body>
	<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part1" user="root"
		password="12345"></sql:setDataSource>
				
	<c:choose>
	
		<c:when test="${ empty param.serialNo && empty param.purchaseDate }">
			<c:redirect url="Register_Product.jsp">
				<c:param name="username" value="${param.username}"></c:param>
				<c:param name="errSerialNo" value="Please Enter Serial Number" />
				<c:param name="errPDate" value="Please Enter Purchased Date" />
			</c:redirect>
		</c:when>
		
		<c:when test="${ empty param.serialNo }">
			<c:redirect url="Register_Product.jsp">
				<c:param name="username" value="${param.username}"></c:param>
				<c:param name="errSerialNo" value="Please Enter Serial Number" />
			</c:redirect>
		</c:when>
		
		<c:when test="${empty param.purchaseDate}">			
			<c:redirect url="Register_Product.jsp">
				<c:param name="username" value="${param.username}"></c:param>
				<c:param name="errPDate" value="Please Enter Purchased Date" />
			</c:redirect>
		</c:when>

		<c:otherwise>
			<sql:update dataSource="${dbCon}" var="update">
		INSERT INTO product_registered (username, productname, serial_no, purchased_date) VALUES ( ?, ?, ?, ?)
			    <sql:param value="${param.username}" />
				<sql:param value="${param.productname}" />
				<sql:param value="${param.serialNo}" />
				<sql:param value="${param.purchaseDate}" />
			</sql:update>
			<c:if test="${update>=1}">
				<c:redirect url="User_Dashboard.jsp">
				</c:redirect>
			</c:if>
		</c:otherwise>
		
	</c:choose>
	
</body>
</html>