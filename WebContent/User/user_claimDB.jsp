<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User CLaim Database</title>
</head>
<body>
	<c:if test="${ empty param.claimdate &&  empty param.description }">    	
      <c:redirect url="user_claim.jsp" >
         <c:param name="username" value="${param.username}"></c:param>
         <c:param name="product_name" value="${param.product_name}"></c:param>
         <c:param name="errClaim" value="Please Select Date " />
         <c:param name="errDesc" value="Please Enter Description " />         
      </c:redirect>       
    </c:if>
  
    <c:if test="${ empty param.claimdate }">    	
      <c:redirect url="login_user.jsp" >
         <c:param name="username" value="${param.username}"></c:param>
         <c:param name="product_name" value="${param.product_name}"></c:param>
         <c:param name="errClaim" value="Please Select Date " />
      </c:redirect>       
    </c:if>
    
    <c:if test="${ empty param.description }">    	
      <c:redirect url="login_user.jsp" >
          <c:param name="username" value="${param.username}"></c:param>
         <c:param name="product_name" value="${param.product_name}"></c:param>
         <c:param name="errDesc" value="Please Enter Description " />
      </c:redirect>       
    </c:if>
    
     <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />
	
	 <s:query dataSource="${ds}" var="registerDate">
        select purchased_date from product_registered where username = '${param.username }' AND productname = '${param.product_name }';    
      </s:query>

      <s:query dataSource="${ds}" var="registerCount">
        select count(claim_id) AS count from user_claim where username = '${param.username }' AND product = '${param.product_name }' AND (status='pending' OR status='approved');    
      </s:query>
    
    <c:forEach var="row" items="${registerCount.rows}">
    	<c:set var="count" value="${row.count }"/>
    </c:forEach>
    
    <c:choose>
		<c:when test="${pageContext.request.method=='POST' && count < 4 }">
			<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/project_part1" user="root"
				password="12345"></sql:setDataSource>
			<sql:update dataSource="${dbCon}" var="update">
		INSERT INTO user_claim (username, claimdate, description, product, status) VALUES (?, ?, ?, ?, ?)
			<sql:param value="${param.username}" />
				<sql:param value="${param.claimdate}" />
				<sql:param value="${param.description}" />
				<sql:param value="${param.product_name}" />
				<sql:param value="pending" />
			</sql:update>
			<c:if test="${update>=1}">
				<c:redirect url="SignUp_Success.jsp">
				</c:redirect>
			</c:if>
		</c:when>
		<c:otherwise>
			<c:redirect url="claimFailure.jsp">
				
			</c:redirect>
		</c:otherwise>
	</c:choose>
</body>
</html>