
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ empty param.pname or empty param.price}">
            <c:redirect url="updateproducts.jsp" >
                <c:param name="errMsg" value="Please Enter Product and Price" />
            </c:redirect>
 
        </c:if>
       <c:if test="${not empty param.pname and not empty param.price}">
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
 
      <sql:query dataSource="${ds}" var="selectData">
        select * from product where product_name = '${param.pname}';    
      </sql:query>

		<c:forEach items="${selectData.rows}" var="r">
				<c:if test="${r.product_name == param.pname && r.product_price == param.price}">
					<c:redirect url="updateproducts.jsp">
						<c:param name="productSelected" value="${param.productSelected}"></c:param>
						<c:param name="errMsg" value="Product Already Exists" />
					</c:redirect>
				</c:if>
				</c:forEach>
	</c:if>
	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
  <sql:update dataSource="${ds}" var="result">
            update product set product_name = ?,product_price = ? where product_id = '${param.pid}';
            <sql:param value="${param.pname}" />
            <sql:param value="${param.price}" />
      
        </sql:update>
        <c:if test="${result>=1}">
               <c:redirect url="updateproducts.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
 
    </body>
</body>
</html>