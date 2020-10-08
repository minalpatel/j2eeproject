<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
 
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Authentication page</title>
  </head>
  <body>
  	<c:if test="${ empty param.uname &&  empty param.password }">    	
      <c:redirect url="login_user.jsp" >
         <c:param name="productSelected" value="${param.productSelected}"></c:param>
         <c:param name="errMsg" value="Please Enter UserName and Password" />
      </c:redirect>       
    </c:if>
  
    <c:if test="${ empty param.uname }">    	
      <c:redirect url="login_user.jsp" >
         <c:param name="productSelected" value="${param.productSelected}"></c:param>
         <c:param name="errMsg" value="Please Enter UserName " />
      </c:redirect>       
    </c:if>
    <c:if test="${  empty param.password }">    	
      <c:redirect url="login_user.jsp" >
           <c:param name="productSelected" value="${param.productSelected}"></c:param>
           <c:param name="errMsg" value="Please Enter Password" />
      </c:redirect>       
    </c:if>
    
   <c:if test="${not empty param.uname and not empty param.password}">
      <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
 
      <s:query dataSource="${ds}" var="selectData">
        select * from user_registration where username = '${param.uname}';    
      </s:query>

		<c:forEach items="${selectData.rows}" var="r">
			<c:choose>
				<c:when test="${r.password == param.password}">
				<c:choose>
					<c:when test="${param.productSelected == 'null'}">					
						<c:redirect url="User_Dashboard.jsp">
						   <c:param name="username" value="${param.uname}"></c:param>
						</c:redirect>
					</c:when>
					<c:otherwise>
						<c:redirect url="Register_Product.jsp">
							<c:param name="password" value="${r.password}"></c:param>
							<c:param name="productSelected" value="${param.productSelected}"></c:param>
							<c:param name="username" value="${param.uname}"></c:param>
						</c:redirect>
					</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:redirect url="login_user.jsp">
						<c:param name="password" value="${r.password}"></c:param>
						<c:param name="productSelected" value="${param.productSelected}"></c:param>
						<c:param name="errMsg" value="Username/password does not match" />
					</c:redirect>
				</c:otherwise>
			</c:choose>

		</c:forEach>

	</c:if>
 
 
  </body>
</html>