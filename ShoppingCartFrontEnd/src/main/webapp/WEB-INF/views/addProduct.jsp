<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

<%@ include file="adminHome.jsp" %>
	<br><br><br><br><br><br><br><br><br><br><br><br>

	<form:form action="${pageContext.request.contextPath}/newProduct" method="POST" commandName="product" enctype="multipart/form-data">
	
	
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
				<td>Product Image :</td>
				<td><input type="file" name="image"/></td>
			</tr>
			<tr>
				<td>Category:</td>
				<td><form:select path="category.name" items ="${categorys}" itemValue ="name" itemLabel ="name"></form:select>
			
			</tr>
			<tr>
				<td>Supplier:</td>
				<td><form:select path="supplier.name" items ="${suppliers}" itemValue ="name" itemLabel ="name"></form:select>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Add Product" class="btn btn-success" /></td>
			</tr>
		</table>
	</form:form>
	<br><<br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="footer.jsp" %>
	
