<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="adminHome.jsp" %>
<br><<br><br><br><br><br>

<div class ="container">
<table class ="table table-bordered">
<tr>
<th>Category ID</th>
<th>Category Name</th>
<th>Category Description</th>


</tr>

<c:forEach var="category" items="${categorys}">
<tr>
<td>${category.id}</td>
<td>${category.name}</td>
<td>${category.description}</td>

<td align="center"><a href="editCategory?id=${category.id}" class ="btn btn-primary">Edit</a> | <a href="deleteCategory?id=${category.id}" class ="btn btn-warning">Delete</a></td>
</tr>

</c:forEach>

</table>
</div>
<br><<br><br><br><br><br>
	<%@ include file="footer.jsp" %>


