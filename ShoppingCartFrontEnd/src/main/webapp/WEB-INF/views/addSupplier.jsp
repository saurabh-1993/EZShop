<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<div>

	<form:form action="newSupplier" method="POST" commandName="supplier">
	
	
		<table>
			<tr>
				<td>Supplier ID :</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>Supplier Name :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Supplier Address :</td>
				<td><input type="text" name="address"/></td>
			</tr>
	
			<tr>
				<td></td>
				<td><input type="submit" value="Add Supplier"/></td>
			</tr>
		</table>
	</form:form>
	
<div class ="container">
<table class ="table table-bordered">
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

</div>