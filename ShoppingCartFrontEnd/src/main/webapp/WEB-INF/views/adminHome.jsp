<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: auto;
      margin: auto;
  }
  </style>
</head>
<script>
	function logoutfunction() {
		document.getElementById("logout").submit();
	}
</script>
<body>

<nav class ="navbar navbar-inverse navbar-fixed-top">

<div id ="thing" class ="container-fluid">
<div class ="navbar-header">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      
					<c:url value="/perform_logout" var="logout" />
					<form action="${logout }" method="POST" id="logout">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_crsf.token }">


					</form>

<ul class ="nav navbar-nav">

<li><a id="ez" class ="navbar-brand" href ="#">EZShop</a></li>
<li><a id ="z" href ="adminHome">Home</a></li>
<li><a id ="z" href = "adminHome/manageCategories">ManageCategories</a></li>
<li><a id ="z" href = "adminHome/manageProducts">ManageProducts</a></li>
<li><a id ="z" href = "adminHome/manageSuppliers">ManageSuppliers</a></li>
</ul>
<ul class="nav navbar-nav navbar-right">
	<c:if test="${pageContext.request.userPrincipal.name != null }">
						
								<li><a id="log" href="#"> Welcome :<img src = "<c:url value ='/resources/images/users/${pageContext.request.userPrincipal.name}.png'/>"height="20" width="20" class ="img img-rounded"/>${pageContext.request.userPrincipal.name}</a></li>
							
								<security:authentication var="user"
									property="principal.authorities" />
								<security:authorize var="LoggedIn" access="isAuthenticated()">
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<li><a id ="log" >Admin</a></li>
									</security:authorize>
									
							</security:authorize>
								<li><a id="log"href="javascript:logoutfunction()">Logout</a></li>
							</c:if>
							
							<c:if test="${pageContext.request.userPrincipal.name == null }">
							<li><a id="su" href="addUserDetails"><span
									class="glyphicon glyphicon-user" id="sug"></span>Sign Up</a></li>
							<li><a id="log" href="login"><span
									class="glyphicon glyphicon-log-in" id="l"></span>Login</a></li>
									</c:if>
						</ul>
</div>

</div>
</div>

</nav>

</body>
</html>