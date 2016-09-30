<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="adminHome.jsp" %>
<br>
<br>
<br>
<br>
<br>
<div>
	<form:form action="editProduct/${editP.id}" method="POST" commandName="editP">

<table>
<tr>
<td><img src="<c:url value='/resources/images/products/${editP.id }.png' />" height="200" width="200" /></td>
<td><input type="file" name="image" value ="${editP.image }"/></td>
</tr>

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
			<%-- </tr>
				<tr>
				<td>Product Image :</td>
				<td><input type="file" name="image" value ="${editP.image }"/></td>
			</tr> --%>
			<tr>
				<td>Category:</td>
				<td><form:select path="category.name" items ="${categorys}" itemValue ="name" itemLabel ="name" value ="${editP.category}"></form:select>
			
			</tr>
			<tr>
				<td>Supplier:</td>
				<td><form:select path="supplier.name" items ="${suppliers}" itemValue ="name" itemLabel ="name" value ="${editP.supplier}"></form:select>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Edit Product" class="btn btn-success"/></td>
			</tr>
		</table>
		
	</form:form>
	
	</div>