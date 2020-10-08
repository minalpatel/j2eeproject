<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Product</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<header>
<%@ include file = "header.html" %>
</header>
<main>

<h1>Register Product</h1>
	<s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/project_part1" user="root"
		password="12345" />
	<s:query dataSource="${ds}" var="selectData">
        select * from product;    
      </s:query>

	<form action="Register_ProductDB.jsp" method="post">
	 <input type="hidden" name="submitted" value="true"> 
		<label>User Name</label> 
		<input type="text" name="username"	value="<%= request.getParameter("username") %>" readonly> <br>
		<br> 
		<label>Product Name</label> 
		<select name="productname">
			<c:forEach items="${selectData.rows}" var="r">
	         <option value="${r.product_name}">${r.product_name}</option> 
	      </c:forEach>
      </select><br><br>
      
      <label>Serial No</label> 
	  <input type="text" name="serialNo" >
	  <font color="red">
		  <c:if test="${not empty param.errSerialNo}">
		   		<c:out value="${param.errSerialNo}" />
		   </c:if>
	   </font>
     	 
	 <br><br>
	 
      <label>Purchased Date</label> 
	  <input type="date" name="purchaseDate" >
	  <font color="red">
		  <c:if test="${not empty param.errPDate}">
		   		<c:out value="${param.errPDate}" />
		   </c:if>
	   </font><br><br>
	   
	  <input type="submit" name="submit" value="submit"/>
		
	</form>
</main>
</body>
</html>