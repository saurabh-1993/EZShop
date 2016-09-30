<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

   <br>
      <br>  
      
       <br>
      
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
   
      <br>
   
      <br>
   
      <br>
   
      <br>
   
   
	<form:form action="${pageContext.request.contextPath}/newCategory" method="POST" commandName="category">
	
	
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
				<td><input type="submit" value="Add Category" class="btn btn-success"/></td>
			</tr>
		</table>
	</form:form>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<%@ include file="footer.jsp" %>
