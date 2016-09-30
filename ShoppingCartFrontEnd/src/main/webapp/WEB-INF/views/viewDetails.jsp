	<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="header.jsp" %>
	<br><br><br><br>
	
	
	
	<section class="container" data-ng-app="cartApp" style="height: 430px;">


		<div class="row"  data-ng-app="myApp" data-ng-controller="myCtrl">
			<div class="col-md-6">
			

		<img src="<c:url value='/resources/images/products/${editP.id }.png' />" height="200" width="200" />



			</div>
			<div class="col-md-6">
                <h2 style="color: blue;">Product Information</h2>
				<h3 Style ="text-align:left">${editP.name}</h3>
				<p><strong>Specification:</strong><br>${editP.description}</p>
				<p>
					<strong>Item Code : </strong><span class="label label-danger">${editP.id}</span>
				</p>
				
				
				
				<h4>Rs &nbsp;${editP.price}  &nbsp;INR</h4>
			
				<p data-ng-controller="cartController">
					<a href="<c:url value='/allProducts' />" class="btn btn-success">Back
						
					</a>
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name=='admin'}">
       				<a href="<spring:url value="/editProduct?id=${editP.id}" />" class="btn btn-warning btn-large" >Edit</a>
       				 <br />
					</c:when>
					<c:otherwise>
      				  <a href="<c:url value="/viewCart?id=${getP.id }"/>"
					class="btn btn-warning btn-large"
					data-ng-click="addToCart('${getP.id}')"> Order Now</a>
       					 <br />
					</c:otherwise>
				</c:choose>
				<%-- <a href="<spring:url value="/shoppingCart?productId=${getP.productId }"/>"
					class="btn btn-warning btn-large"
					data-ng-click="addToCart('${getP.productId}')"> Order Now</a>
				<c:if test="${pageContext.request.userPrincipal.name=='admin'}">
					<a href="<c:url value='/editProduct?productId=${prod.productId}' />" >Edit</a>
					</c:if> --%>
				</p>
			
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %>