<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ include file="header.jsp" %>
   	
   
  <link rel="stylesheet" type="text/css" href="style.css">

   <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: auto;
      margin: auto;
  }
  </style>
${msg }<br>
<br>
<br>
<br>
<br>
<br>
<div class="container-fluid">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->


    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="resources/images/mob.jpg" alt="mobile" class ="center-block">
       
          
        </div>
 

      <div class="item">
        <img src="resources/images/abc.jpg" alt="Refrigerator" class ="center-block">
        
      </div>
    
      <div class="item">
        <img src="resources/images/cam.jpg" alt="error" class ="center-block">

    </div>
	<div class="item">
        <img src="resources/images/sam.jpg" alt="error" class ="center-block">

    </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
<!--------------product thumbnails--------->
<h2>EZ Mobile Shopee<br><small>Extra 10% off on Amex and Citi bank cards</small></h2>
<hr class = "divider">
<div class ="row">

<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/s6.jpg" alt="samsung" style="width:304px;height:245px">
<div class = "caption">
<h5>SAMSUNG Galaxy S6 Edge (White, 32 GB)</h5>
<p> Just RS 39200</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/i.jpg" alt="iphone" style="width:304px;height:245px">
<div class = "caption">
<h5>Apple iPhone 6S (Space Grey, 16 GB)</h5>
<p> Just RS 57999</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/lg5.jpg" alt="LG" style="width:304px;height:245px">
<div class = "caption">
<h5>LG G5 Special Edition(Gold, 32 GB)</h5>
<p> Just RS 47990</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/n1.jpg" alt="Nexus" style="width:304px;height:245px">
<div class = "caption">
<h5>Nexus 6P Special Edition (Gold, 64 GB)</h5>
<p> Just RS 39998</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/motox2.jpg" alt="Nexus" style="width:304px;height:245px">
<div class = "caption">
<h5>Moto X Play(With Turbo Charger) (Black, 32 GB)</h5>
<p> Just RS 17499</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/n.jpg" alt="Nexus" style="width:304px;height:245px">
<div class = "caption">
<h5>SAMSUNG Galaxy Note 4 (Charcoal Black, 32 GB)</h5>
<p> Just RS 27949</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<h2>EZ Electroincs Day <br><small>Extra 15% off on SBI and Citi bank cards</small></h2>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/hit.jpg" alt="hitachi" style="width:304px;height:245px">
<div class = "caption">
<h5>Hitachi 456 L(R-WB480PND2)</h5>
<p> Just RS 66490</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>

<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/j1.jpg" alt="Hitachi" style="width:304px;height:245px">
<div class = "caption">
<h5>Hitachi 1.5 TonsWindow AC White(RAV518HUD)</h5>
<p> Just RS 33500</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/p1.jpg" alt="Panasonic" style="width:304px;height:245px">
<div class = "caption">
<h5>Panasonic 27 L Oven(NN-CD674M, Silver)</h5>
<p> Just RS 12999</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/sony1.jpg" alt="sony" style="width:304px;height:245px">
<div class = "caption">
<h5>Sony DAV-TZ145 5.1 Home Theatre System</h5>
<p> Just RS 11990</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/lg1.jpg" alt="sony" style="width:304px;height:245px">
<div class = "caption">
<h5>LG 8 kg Fully Automatic Washer(F1296ADP23)</h5>
<p> Just RS 43990</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/pl.jpg" alt="sony" style="width:304px;height:245px">
<div class = "caption">
<h5>Philips HD 9220/53 Air Fryer</h5>
<p> Just RS 9990</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<h2>Sports And Fitness Essentials</h2>
<br>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/li.jpg" alt="whey" style="width:304px;height:245px">
<div class = "caption">
<h5>Life Span C3i Upright Exercise BIke(Silver)</h5>
<p> Just RS 56000</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/mu.jpg" alt="nivea" style="width:304px;height:245px">
<div class = "caption">
<h5>Nike Man Utd Supporters Football </h5>
<p> Just RS 1399</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/w.jpg" alt="fitness" style="width:304px;height:245px">
<div class = "caption">
<h5>Muscletech Nitro Tech Perf Series Whey Protein</h5>
<p> Just RS 5190</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/st.jpg" alt="cardio" style="width:304px;height:245px">
<div class = "caption">
<h5>Stag Master Stroke Table Tennis Racquet.</h5>
<p> Just RS 686</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/y.jpg" alt="cardio" style="width:304px;height:245px">
<div class = "caption">
<h5>RamDev SuperFit Yoga Red 6 mm</h5>
<p> Just RS 621</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/ad.jpg" alt="cardio" style="width:304px;height:245px">
<div class = "caption">
<h5>Adidas Kettlebell(be fit always) - 8kg</h5>
<p> Just RS 2699</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<br>
<br>

<h2>EZShop TV Days<br><small>Extra 10% off on Amex and Citi bank cards</small></h2>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv1.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>LG 108cm (43) Full HD Smart LED TV(43LH576T, 2 x HDMI, 1 x USB)</h5>
<p> Just RS 39289</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv2.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>Sony 101.6cm (40) Full HD Smart LED TV(KLV-40W562D, 2 x HDMI, 2 x USB)</h5>
<p> Just RS 52989</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv3.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>Panasonic 109cm (43) Full HD Smart LED TV(TH-43CS400DX, 3 x HDMI, 2 x USB)</h5>
<p> Just RS 36989</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv4.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>SAMSUNG 121cm (48) Full HD Smart LED TV(48J5300, 2 x HDMI, 2 x USB)</h5>
<p> Just RS 64989</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv5.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>Haier 127cm (50) Full HD 3D, Smart LED TV(LD50U7000, 2 x HDMI, 3 x USB)</h5>
<p> Just RS 59980</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/tv6.jpg" alt="Led" style="width:304px;height:245px">
<div class = "caption">
<h5>Videocon 139.7cm (55) Full HD LED TV(VMD55FH0Z, 2 x HDMI, 1 x USB)</h5>
<p> Just RS 49900</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<h2>Camera's ...</h2>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d1.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>Nikon D5300 (Body with AF-P DX NIKKOR 18-55) DSLR Camera(Black</h5>
<p> Just RS 35995</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d3.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>Canon EOS 700D with (EF S18 - 55 mm IS II) DSLR Camera(Black)</h5>
<p> Just RS 36995</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d4.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>Sony Cyber-shot DSC-W830/VC Point & Shoot Camera</h5>
<p> Just RS 7390</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d5.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>GoPro Hero4-CHDHX-401 Sports & Action Camera</h5>
<p> Just RS 41990</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>

<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d6.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>Canon EOS 70D with (EF-S 18-135 mm IS STM Lens) DSLR Camera</h5>
<p> Just RS 77995</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>

<div class = "col-md-2">
<div class ="thumbnail">
<img src = "resources/images/d7.jpg" alt="camera" style="width:304px;height:245px">
<div class = "caption">
<h5>Nikon D3200(AF-S DX NIKKOR 18-55mm) DSLR Camera(Black)</h5>
<p> Just RS 23549</P>
<p><a href ="#" class ="btn btn-primary" role ="button">Buy</a> <a href ="#" class ="btn btn-default" role="button">Like</a></p>
</div>
</div>
</div>
</div>
</div>


			<div id="registerHere">
				<c:if test="${isUserClickedRegisterHere==true}">
					<%@ include file="addUserDetails.jsp"%>

				</c:if>
			</div>

			<div id="loginHere">
				<c:if test="${isUserClickedLoginHere==true || invalidCredentials==true}">
				  <div id = "error">  ${errorMessage} </div>
					<%@ include file="login.jsp"%>

				</c:if>
			</div>


			<!-- ---------- --admin----------->
		

			
			
			
<%@ include file="footer.jsp" %>
