<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<header>
<%@ include file = "header.html" %>
</header>
<main>
	<h1>Welcome to Sign Up Page</h1>
	<form method="POST" action="User_Registration.jsp">
		<input type="hidden" name="submitted" value="true"> 
		<label>Name <span>*</span></label> 
		<input type="text" name="name" />
		<c:choose>
			<c:when test="${param.submitted && empty param.name}">
				<c:set var="flag" value="true" />
				<font color="red"> Please enter your Name </font>
			</c:when>
			<c:otherwise>
		      <c:set var="flag" value="false"/>  
		   </c:otherwise>
		</c:choose>
		<br> <br>
		
	<label> User Name <span>*</span></label> 
	<input type="text" name="uname" />

	 <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345" />

      <s:query dataSource="${ds}" var="selectUser">
        select * from user_registration;    
      </s:query>
      
	 <c:choose>
		 <c:when test="${param.submitted && empty param.uname }">
		 	<c:set var="flag" value="true" />
			<font color="red"> Please enter your user name </font>
		 </c:when>
		 <c:otherwise>
			<c:set var="flag" value="false" />
		</c:otherwise>
	 </c:choose>
	 
	<c:forEach items="${selectUser.rows}" var="r">
		<c:choose>
			<c:when test="${r.username == param.uname}">
				<c:set var="flag_set" value="true" />					
				<font color="red"> Username Exists </font>
			</c:when>
			<c:otherwise>
				<c:set var="flag_set" value="false" />
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<br> <br>
		
		<label> Password <span>*</span>
		</label> <input type="password" name="password" />
		<c:choose>
			<c:when test="${param.submitted && empty param.password}">
				<c:set var="flag" value="true" />
				<font color="red"> Please enter your password </font>
			</c:when>
			<c:otherwise>
				<c:set var="flag" value="false" />
			</c:otherwise>
		</c:choose>
		<br> <br> 
		
		<label> Confirm Password <span>*</span></label>
		<input type="password" name="cnfpassword" />
		<c:choose>
			<c:when test="${param.submitted && empty param.cnfpassword }">
				<c:set var="flag" value="true" />
				<font color="red"> Please confirm password </font>
			</c:when>
			<c:when
				test="${param.submitted &&  param.cnfpassword != param.password}">
				<c:set var="flag" value="true" />
				<font color="red"> Password dont match </font>
			</c:when>
			<c:otherwise>
				<c:set var="flag" value="false" />
			</c:otherwise>
		</c:choose>
		<br><br>
		
		 <label> Contact Number <span>*</span></label> 
		 <input type="text" name="contact" />
		 <c:choose>
			<c:when test="${param.submitted && empty param.contact}">
				<c:set var="flag" value="true" />
				<font color="red"> Please enter contact	number </font>
			</c:when>	
			<c:otherwise>
				<c:set var="flag" value="false" />
			</c:otherwise>
	 	 </c:choose>
			<br><br>
			
			<label> Email <span>*</span>
			</label>
			<input type="text" name="email" />
			<c:choose>
				<c:when test="${param.submitted && empty param.email}">
					<c:set var="flag" value="true" />
					<font color="red"> Please enter your Email </font>
				</c:when>
				<c:otherwise>
					<c:set var="flag" value="false" />
				</c:otherwise>
		   </c:choose>
		<br> <br> 
		
		<label> Address <span>*</span></label>
		<textarea rows="5" cols="20" name="address"></textarea>
		<c:choose>
			<c:when test="${param.submitted && empty param.address}">
				<c:set var="flag" value="true" />
				<font color="red"> Please enter your address </font>
			</c:when>
			<c:otherwise>
				<c:set var="flag" value="false" />
			</c:otherwise>
		</c:choose>
		<br> <br>
		
		<input type="submit" name="submit" value="submit" />
	</form>
	
	<c:if test="${pageContext.request.method=='POST' && flag == false && flag_set == false }">
		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project_part1" user="root"
			password="12345"></sql:setDataSource>
		<sql:update dataSource="${dbCon}" var="update">
		INSERT INTO user_registration (username, name, password, contactnumber, email, address) VALUES (?, ?, ?, ?, ?, ?)
		<sql:param value="${param.name}" />
			<sql:param value="${param.uname}" />
			<sql:param value="${param.password}" />
			<sql:param value="${param.contact}" />
			<sql:param value="${param.email}" />
			<sql:param value="${param.address}" />
		</sql:update>
		<c:if test="${update>=1}">
			<c:redirect url="SignUp_Success.jsp">
			</c:redirect>
		</c:if>
	</c:if>
	</main>
	<footer>
	<%@ include file = "footer.html" %>
	</footer>
</body>
</html>