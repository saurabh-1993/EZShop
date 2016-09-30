<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@ include file="adminHome.jsp" %>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



<br>
<br>	
<div class ="container">
<table class ="table table-bordered" >
<tr>
<th>Supplier ID</th>
<th>Supplier Name</th>
<th>Supplier Address</th>

</tr>
<c:forEach var="supplier" items="${suppliers}">
<tr>
<td>${supplier.id}</td>
<td>${supplier.name}</td>
<td>${supplier.address}</td>

<td align="center"><a href="editSupplier?id=${supplier.id}" class ="btn btn-primary">Edit</a> | <a href="deleteSupplier?id=${supplier.id}" class ="btn btn-warning">Delete</a></td>
</tr>

</c:forEach>

</table>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>


<%@ include file="footer.jsp" %>
