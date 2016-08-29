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

	<form:form action="newCategory" method="POST" commandName="category">
	
	
		<table>
			<tr>
				<td>Category ID :</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>Category Name :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Category Description :</td>
				<td><input type="text" name="description"/></td>
			</tr>
		
			<tr>
				<td></td>
				<td><input type="submit" value="Add Category"/></td>
			</tr>
		</table>
	</form:form>
	
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

</div>