<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="header.jsp" %>
	<br><br><br><br>
	

	<c:forEach var="prod" items="${products}">
	<c:if test="${prod.category.name =='Television'}">
		<div class ="row" style="padding-left: 100px;">
		
<div class ="col-md-3"	>

<img src = "<c:url value ='/resources/images/products/${prod.id }.png'/>" height="200" width="200"/>

<br>
</div>
<div class ="col-md-3"	>
<p><strong>${prod.name}</strong></p><br>
</div>
<div class ="col-md-3"	>
<p><strong>Specification:</strong><br>${prod.description }<br><strong>Seller:</strong>${prod.supplier.name} </p>
</div>
<div class ="col-md-3"	>
<p><strong>Rs</strong>${prod.price}</p>
<br>
</div>
<div>
<a href="<c:url value='/viewDetails?id=${prod.id}' />" class ="btn btn-success" >View</a>
</div>


<!-- <div class ="col-md-3"	>
<marquee height = "700" direction ="up"><img src ="resources/images/lenovo.jpg" height ="50" width  ="50"><br><br><br><img src ="resources/images/samsung.jpg" height ="50" width  ="50">
<br><br><br><img src ="resources/images/apple.jpg" height ="50" width  ="50">
<br><br><br>
<img src ="resources/images/micromax.jpg" height ="50" width  ="50">
<br><br><br>
<img src ="resources/images/blackberry.jpg" height ="50" width  ="50">
<br><br><br>
<img src ="resources/images/intex.jpg" height ="50" width  ="50">
<br><br><br>
<img src ="resources/images/lg.jpg" height ="50" width  ="50">
<br><br><br>
<img src ="resources/images/nexus.jpg" height ="50" width  ="50">
<br><br><br>


</marquee>
</div> -->
</div>
</c:if>
</c:forEach>




