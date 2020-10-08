<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DeleteProducts</title>
</head>
<body>
<input type="hidden" value="${param.product_id}" name ="pid"/>
	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
  <sql:update dataSource="${ds}" var="result">
  delete from product where product_id = '${param.product_id }';
        </sql:update>
        <c:if test="${result>=1}">
               <c:redirect url="Products_Registered.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data Deleted." />
            </c:redirect>
        </c:if> 


</body>
</html>