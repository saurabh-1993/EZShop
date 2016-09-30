<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
  <title>Admin</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
</head>
<div class="btn-group-vertical">
<a	onclick= window.history.back() 
									class="btn btn-lg btn-primary">
									<span></span> Back</a>
							</div><br><br>
							<table class="table table-hover table-reponsive table-cart">
				<thead>
						<tr class="table-primary">

						<th>Product Image</th>
						<th>Product Name</th>
						<th>Product Quantity</th>
						<th>Total Price</th>
						
					</tr>
				</thead>
				<tbody>
			<c:forEach items="${searchProduct}" var="item"> 


					<!-- <tr ng-repeat="item in orderedItems|filter:searchProduct">
						 -->
						<td><img src="${images}/product/{{item.productId}}.png"
							class="cart-Image img-thumbnail"></td>
						<td>{{item.productName}}</td>
						<td>{{item.quantity}}</td>
						<td><span class="fa fa-inr"></span> {{item.totalPrice}}</td>
						
							
						
				<!-- 	</tr> -->
				</c:forEach> 
				</tbody>
			</table>
			