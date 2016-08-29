<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<form:form action="editCategory/${editP.id}" method="POST" commandName="editP">
		<table>
			<tr>
				<td>Category ID :</td>
				<td><input type="text" name="id" value="${editP.id}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>Category Name :</td>
				<td><input type="text" name="name" value="${editP.name}" /></td>
			</tr>
			<tr>
				<td>Category Description :</td>
				<td><input type="text" name="description" value="${editP.description }"/></td>
			</tr>
		
			<tr>
				<td></td>
				<td><input type="submit" value="Edit Category"/></td>
			</tr>
		</table>
	</form:form>
	
	</div>