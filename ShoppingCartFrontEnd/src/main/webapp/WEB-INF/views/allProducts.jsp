<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="header.jsp" %>
<br><br><br><br><br><br>


<div class ="container">
<table class ="table table-bordered">
<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Product Price</th>
<th>Product Image</th>
<th>Category</th>
<th>Supplier</th>
</tr>
<c:forEach var="prod" items="${products}">
<tr>
<td>${prod.id}</td>
<td>${prod.name}</td>
<td>${prod.description}</td>
<td>${prod.price}</td>
<td><img src = "<c:url value ='/resources/images/products/${prod.id }.png'/>" height="50" width="50"/>
<td>${prod.category.name}</td>
<td>${prod.supplier.name}</td>
<td align="center"><a href="<c:url value='/viewDetails?id=${prod.id}' />" class ="btn btn-success" >View</a></td>

</tr>

</c:forEach>

</table>
</div>
<br><<br><br><br><br><br>
	<%@ include file="footer.jsp" %>
