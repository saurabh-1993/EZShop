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
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>

 
  

<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: auto;
	margin: auto;
}
</style>
<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
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
								data-toggle="dropdown" href ="#">Electronics <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/mobilePage">Mobiles</a></li>
									<li><a href="${pageContext.request.contextPath}/accesories">Mobile Accesories</a></li>
									<li><a href="${pageContext.request.contextPath}/laptops">Laptops</a></li>
									<li><a href="${pageContext.request.contextPath}/cameraPage">Cameras</a></li>
									
									<li><a href="${pageContext.request.contextPath}/computer">Computer perepherals</a></li>
									<li><a href="#">Tablets</a></li>
									<li><a href="${pageContext.request.contextPath}/new">New and Popular models</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Appliances <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/refrigerator">Refrigerators</a></li>
									<li><a href="${pageContext.request.contextPath}/ac">Air-conditioners</a></li>
									<li><a href="${pageContext.request.contextPath}/tvPage">Televisions</a></li>
									<li><a href="${pageContext.request.contextPath}/washing">Washing Machines</a></li>
									<li><a href="${pageContext.request.contextPath}/kitchen">Kitchen Appliances</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Men <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/footwear">Footwear</a></li>
									<li><a href="${pageContext.request.contextPath}/clothing">Clothing</a></li>
									<li><a href="${pageContext.request.contextPath}/watches">Watches</a></li>
									<li><a href="${pageContext.request.contextPath}/personal">Pesonal Care Appliances</a></li>
									<li><a href="${pageContext.request.contextPath}/mens">Men's Grooming</a></li>
								</ul></li>
							<li class="dropdown"><a id="z" class="dropdown-toggle"
								data-toggle="dropdown" href="#">Women <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/wfootwear">Footwear</a></li>
									<li><a href="${pageContext.request.contextPath}/wclothing">Clothing</a></li>
									<li><a href="${pageContext.request.contextPath}/watches">Watches</a></li>
									<li><a href="${pageContext.request.contextPath}/wpersonal">Beauty & Pesonal Care</a></li>
									<li><a href="${pageContext.request.contextPath}/jewellery">Jewellery</a></li>
								</ul></li>
				
							<li><a id="su" href="${pageContext.request.contextPath}/allProducts">All Products</a></li>
	
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
						
								<li><a id="log" href="#"> Welcome :<img src = "<c:url value ='/resources/images/users/${pageContext.request.userPrincipal.name}.png'/>"height="20" width="20" class ="img img-rounded"/>${pageContext.request.userPrincipal.name}</a></li>
							
								<security:authentication var="user"
									property="principal.authorities" />
								<security:authorize var="LoggedIn" access="isAuthenticated()">
									<security:authorize access="hasRole('ROLE_ADMIN')">
										<li>Admin</li>
									</security:authorize>
									<security:authorize access="hasRole('ROLE_USER')">
									<li><a id="log" href ="#">User</a></li>
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
						
							</div>
					
						</div>
			

					</div>
				</div>
		</div>
		</nav> 
	</div>
	<br>