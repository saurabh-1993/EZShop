<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<div>

	<form:form action="newProduct" method="POST" commandName="product">
	
	
		<table>
			<tr>
				<td>Product ID :</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>Product Name :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Product Description :</td>
				<td><input type="text" name="description"/></td>
			</tr>
			<tr>
				<td>Product Price :</td>
				<td><input type="number" name="price"/></td>
			</tr>
			<tr>
				<td>Category ID:</td>
				<td><input type="number" name="price"/></td>
			</tr>
			<tr>
				<td>Supplier ID :</td>
				<td><input type="number" name="price"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Add Product"/></td>
			</tr>
		</table>
	</form:form>
	
<div class ="container">
<table class ="table table-bordered">
<tr>
<th>Product ID</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Product Price</th>
<th>Category ID</th>
<th>Supplier ID</th>
</tr>
<c:forEach var="product" items="${products}">
<tr>
<td>${product.id}</td>
<td>${product.name}</td>
<td>${product.description}</td>
<td>${product.price}</td>
<td>${product.category.category_id}</td>
<td>${product.supplier.supplier_id}</td>
<td align="center"><a href="/editProduct?id=${product.id}"class ="btn btn-primary">Edit</a> | <a href="deleteProduct?id=${product.id}" class ="btn btn-warning">Delete</a></td>
</tr>

</c:forEach>

</table>
</div>

</div>