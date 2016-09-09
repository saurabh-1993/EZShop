<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
	<br><<br><br><br><br><br><br><br><br><br><br><br>

	<form:form action="newProduct" method="POST" commandName="product" ecntype="multipart/form-data">
	
	
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
				<td><input type="submit" value="Add Product"/></td>
			</tr>
		</table>
	</form:form>
	<br><<br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="footer.jsp" %>
	
