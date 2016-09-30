<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Online Shopping</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/signup.css">


</head>
<body>  


<div class="container" >
    <div class="col-md-12" >
        <div id="logbox"  >
	<form:form action="${pageContext.request.contextPath}/newUserDetails" method="POST" commandName="userdetails" enctype="multipart/form-data">
	
	 <h1>Sign Up</h1>
	           <fieldset>
	 	    	  	<div class="form-group">
				 <input name="id" type="text" placeholder="Username" class="input pass"/>
				 </div>
				 	    	  	<div class="form-group">
                
               <input name="contact" type="text" placeholder="Mobile no" required="required" class="input pass"/>
               </div>
               
               	    	  	<div class="form-group">
                 <input name="address" type="text" placeholder="Type your address" required="required" class="input pass"/>
                 </div>
                 	    	  	<div class="form-group">
                 <input name="mail" type="text" placeholder="Email address" required="required" class="input pass"/>
                 </div>
                 	    	  	<div class="form-group">
                 <input name="name" type="text" placeholder="Enter your name" required="required" class="input pass"/>
                 </div>
                 	    	  	<div class="form-group">
                 <input name="password" type="password" placeholder="Choose a password" required="required" class="input pass"/>
                 </div>
                 <div class ="form-group">
                 <input type ="file" name ="image" />
                 
                 </div>
                 	    	  	
                
                <input type="submit" value="Sign me up!" class="inputButton"/>
                          </fieldset>
                </form:form>
                </div>
                </div>
                </div>
                
                
                </body>
                </html>
	

	
