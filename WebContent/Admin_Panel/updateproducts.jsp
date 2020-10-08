

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <form method="post" action="updateDB.jsp">
                        <input type="hidden" value="${param.product_id }" name="pid"/><br><br>
                        <label>Product Name</label><br><br>
                        <input type="text" value="${param.product_name }" name="pname"/><br><br>
                        <label>Price</label><br><br>
                        <input type="text" value="${param.product_price }" name="price"/><br><br>
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
    </body>
    <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/project_part1"
                       user="root" password="12345"/>
                       
</html>