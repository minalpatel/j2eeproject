
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    </head>
    <body>
    <header>
    <%@ include file = "header.html" %>
    
    </header>
    <main>
    <h1 id="h1">Welcome Product Registration</h1>
        <form action="insertproducts.jsp" method="post">
                        
                        <label>Product Name</label>
                        <input type="text" name="pname"/><br><br>
                        <label>Price</label>
                        <input type="text" name="price"/><br><br>
                        <input type="submit" value="Save" />
                        <input type="reset" value="reset"/>
                    
        </form>
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
          <br>  <a href="action_admin.jsp">Go Back</a>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <br><a href="action_admin.jsp">Go Back</a>
        </c:if></font><br><br>
         <sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver" 
         url="jdbc:mysql://localhost:3306/project_part1" user="root" password="12345"></sql:setDataSource>
<sql:query dataSource="${dbCon}" var="result">
select * from PRODUCT;
</sql:query>

<table border="1" align="center">
<tr>
<th>Product Id</th>
<th>Product Name</th>
<th>Product Price</th>
<th colspan="2">Action</th>
</tr>
<c:forEach var="col" items="${result.rows}">
<tr>
<td  name="product_id"><c:out value="${col.product_id}"></c:out> </td>
<td name="product_name"><c:out value="${col.product_name}"></c:out> </td>
<td name="product_price"><c:out value="${col.product_price}"></c:out> </td>
<td><a href="updateproducts.jsp?product_id=${col.product_id}&product_name=${col.product_name}&product_price=${col.product_price}">Update</a></td>
<td><a href="deleteproductsDB.jsp?product_id=${col.product_id}">Delete</a></td>
</tr>
</c:forEach>
        </main>
        
    </body>
</html>