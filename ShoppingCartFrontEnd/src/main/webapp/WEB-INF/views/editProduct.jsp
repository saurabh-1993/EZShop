<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<form:form action="editProduct/${editP.id}" method="POST" commandName="editP">
		<table>
			<tr>
				<td>Product ID :</td>
				<td><input type="text" name="id" value="${editP.id}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>Product Name :</td>
				<td><input type="text" name="name" value="${editP.name}" /></td>
			</tr>
			<tr>
				<td>Product Description :</td>
				<td><input type="text" name="description" value="${editP.description }"/></td>
			</tr>
			<tr>
				<td>Product Price :</td>
				<td><input type="number" name="price" value="${editP.price}"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Edit Product"/></td>
			</tr>
		</table>
	</form:form>
	
	</div>