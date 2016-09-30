<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHome.jsp" %>
<br><br><br><br><br><br><br><br><br><br><br>
<div>
	<form:form action="editSupplier/${editP.id}" method="POST" commandName="editP">
		<table>
			<tr>
				<td>Supplier ID :</td>
				<td><input type="text" name="id" value="${editP.id}" disabled="disabled"/></td>
			</tr>
			<tr>
				<td>Supplier Name :</td>
				<td><input type="text" name="name" value="${editP.name}" /></td>
			</tr>
			<tr>
				<td>Supplier Address :</td>
				<td><input type="text" name="address" value="${editP.address }"/></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" value="Edit Supplier"class="btn btn-success"/></td>
			</tr>
		</table>
	</form:form>
	
	</div>
	<br><br>
	<br><br><br><br><br>
	<br>
	<%@ include file="footer.jsp" %>