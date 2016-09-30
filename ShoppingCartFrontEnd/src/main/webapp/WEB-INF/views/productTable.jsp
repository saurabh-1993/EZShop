<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ include file="adminHome.jsp" %>
<br><br><br><br><br><br>


<div class ="container">
<table class ="table table-hover">
<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Product Price</th>
<th>Product Image</th>
<th>Category</th>
<th>Supplier</th>
</tr>
<c:forEach var="product" items="${products}">
<tr>
<td>${product.id}</td>
<td>${product.name}</td>
<td>${product.description}</td>
<td>${product.price}</td>
<td><img src = "<c:url value ='/resources/images/products/${product.id}.png'/>" height="50" width="50"/>
<td>${product.category.name}</td>
<td>${product.supplier.name}</td>
<td align="center"><a href='${pageContext.request.contextPath}/editProduct?id=${product.id}'class ="btn btn-primary">Edit</a></td><td> <a href="deleteProduct?id=${product.id}" class ="btn btn-danger">Delete</a></td>
<td align="center"><a href="<c:url value='/viewDetails?id=${product.id}' />"  class ="btn btn-success">View</a></td>
</tr>

</c:forEach>

</table>
</div>
<br><<br><br><br><br><br>
	<%@ include file="footer.jsp" %>
