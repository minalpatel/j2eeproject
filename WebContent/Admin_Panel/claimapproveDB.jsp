<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Approved</title>
</head>
<body>

	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
  <sql:update dataSource="${ds}" var="result">
  update user_claim set status = 'Approved' where claim_id = '${param.id }';
        </sql:update>
        <c:if test="${result>=1}">
               <c:redirect url="Claim_Requests.jsp" >
               
            </c:redirect>
        </c:if> 

</body>
</html>