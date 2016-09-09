<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
<form:form action = "editUserDetails/${editU.id}" method = POST commandname = "userDetails">
<table>
<tr>
<td> User ID :</td>
<td><input type ="text"  name = "id" value ="${editU.id}"/></td>
</tr>
<tr>
<td> Contact :</td>
<td><input type ="text"  name = "id" value ="${editU.contact}" /></td>
</tr>

<tr>
<td> Address :</td>
<td><input type ="text"  name = "id" value ="${editU.address}" /></td>
</tr>

<tr>
<td> Mail :</td>
<td><input type ="text"  name = "id" value ="${editU.mail}" /></td>
</tr>

<tr>
<td> Name :</td>
<td><input type ="text"  name = "id" value ="${editU.name}" /></td>
</tr>

<tr>
<td> Password :</td>
<td><input type ="text"  name = "id" value ="${editU.password}" /></td>
</tr>

<tr>
<td> Role :</td>
<td><input type ="text"  name = "id" value ="${editU.role}" /></td>
</tr>
	<tr>
				<td></td>
				<td><input type="submit" value="Edit Supplier"/></td>
			</tr>
</table>
</form:form>
</div>