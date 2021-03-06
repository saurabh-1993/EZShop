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
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
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
	<div>
		<nav class="navbar navbar-inverse navbar-fixed-top">

			<div id="thing" class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a id="ez" class="navbar-brand" href="#">EZShop</a>

					<c:url value="/perform_logout" var="logout" />
					<form action="${logout }" method="POST" id="logout">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_crsf.token }">


					</form>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li><a id="z" href="index">Home</a></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Electronics <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Mobiles</a></li>
									<li><a href="#">Mobile Accesories</a></li>
									<li><a href="#">Laptops</a></li>
									<li><a href="#">Cameras</a></li>
									<li><a href="#">Televisions</a></li>
									<li><a href="#">Computer perepherals</a></li>
									<li><a href="#">Tablets</a></li>
									<li><a href="#">New and Popular models</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Appliances <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Refrigerators</a></li>
									<li><a href="#">Air-conditioners</a></li>
									<li><a href="#">Geysers</a></li>
									<li><a href="#">Washing Machines</a></li>
									<li><a href="#">Kitchen Appliances</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Men <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Footwear</a></li>
									<li><a href="#">Clothing</a></li>
									<li><a href="#">Watches</a></li>
									<li><a href="#">Pesonal Care Appliances</a></li>
									<li><a href="#">Men's Grooming</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Women <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Footwear</a></li>
									<li><a href="#">Clothing</a></li>
									<li><a href="#">Watches</a></li>
									<li><a href="#">Beauty & Pesonal Care</a></li>
									<li><a href="#">Jewellery</a></li>
								</ul></li>
							<li><a id="su" href="#">All Products</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<%-- <c:choose>
						<c:when test="${empty loggedInUser}">
<li><a id ="su" href = "addUserDetails"><span class="glyphicon glyphicon-user" id ="sug"></span>Sign Up</a></li>
<li ><a id ="log" href="login"><span class= "glyphicon glyphicon-log-in" id="l"></span>Login</a></li>
</c:when>
						<c:when test="${not empty loggedInUser}">
						</c:when>

					</c:choose>
					--%>
							<c:if test="${pageContext.request.userPrincipal.name != null }">
								<li>Welcome :${pageContext.request.userPrincipal.name}</li>
								<security:authentication var="user"
									property="principal.authorities" />
								<security:authorize var="LoggedIn" access="isAuthenticated()">
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<li>Admin</li>
									</security:authorize>
									<security:authorize access="hasRole('ROLE_USER')">
									</security:authorize>
								</security:authorize>
								<li><a href="javascript:logoutfunction()">Logout</a></li>
							</c:if>
							
							<c:if test="${pageContext.request.userPrincipal.name == null }">
							<li><a id="su" href="addUserDetails"><span
									class="glyphicon glyphicon-user" id="sug"></span>Sign Up</a></li>
							<li><a id="log" href="login"><span
									class="glyphicon glyphicon-log-in" id="l"></span>Login</a></li>
									</c:if>
						</ul>
<!-- 
						<div class="row">
							<div class="col-sm-8">
								<div class="input-group">
									<input id="e" type="text" class="form-control SearchBar"
										placeholder="Search for..anything"> <span
										class="input-group-btn">
										<button class="btn btn-defaul SearchButton" type="button">
											<span class=" glyphicon glyphicon-search SearchIcon"></span>
										</button>
									</span>
								</div>
								/input-group
							</div>
							/.col-lg-6
						</div>
						/.row

					</div>
				</div>
			</div>-->
		</nav> 
	</div>
	<br>