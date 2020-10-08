<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rejected</title>
</head>
<body>

	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
  <sql:update dataSource="${ds}" var="result"
  update user_claim set status = 'Rejected' where claim_id = '${param.id }';
        />
        <c:if test="${result>=1}" 
               <c:redirect url="Claim_Requests.jsp" />
        />
</body>
</html>