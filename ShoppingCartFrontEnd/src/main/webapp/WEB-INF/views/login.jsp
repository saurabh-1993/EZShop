<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>Online Shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css">




<script src="http://mymaplist.com/js/vendor/TweenLite.min.js"></script>
</head>
<body>
    <%@ include file="header.jsp" %>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	    
	
	
	

	<c:url var="action" value="/login"></c:url>


<div class="container">
    
	
        <div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			  		
			    	<h3 class="panel-title">Please sign in</h3>
			 	</div>
			  	<div class="panel-body">
	<form:form action="perform_login" method="post" commandName="validate">
	<c:if test ="${not empty msg }">
	<div class ="msg">${msg}</div>
	</c:if>
		<c:if test ="${not empty error }">
	<div style ="color:red" class ="error">${error}</div>
	</c:if>
			
                    <fieldset>
			    	  	<div class="form-group">
			    	  			    		    <input class="form-control" placeholder="Username" name="id" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="Password" name="password" type="password" value="">
			    		</div>
			 
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    	<input type="hidden" name="${_csrf.parameterName }"
							value="${_crsf.token }">			    	</fieldset>
			      		</form:form>
			    </div>
			</div>
		</div>
	</div>
</div>


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
	


<%@ include file="footer.jsp" %>
</body>
</html>