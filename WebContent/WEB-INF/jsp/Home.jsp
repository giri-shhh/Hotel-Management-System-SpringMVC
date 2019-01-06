<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, address, phone, icons" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">
<style type="text/css">

/* General Demo Style */
body{
  font-family: "helvetica neue", helvetica;
	background: #000;
	font-weight: 400;
	font-size: 15px;
	color: #aa3e03;
	overflow-y: scroll;
}

.heading1
{
	position: fixed;
	margin-top: 38px;
    margin-left: 420px;
    font-size: 40px;
    color:white;
    
}
.slideshow,
.slideshow:after {
    position: fixed;
    width: 100%;
    height: 100%;
    list-style:none;
    top: 0px;
    left: 0px;
    z-index: 0;
}
.slideshow:after {
    content: '';
    background: transparent url(../images/pattern.png) repeat top left;
}
.slideshow li span {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    color: transparent;
    background-size: cover;
    background-position: 50% 50%;
    background-repeat: none;
    list-style:none;
    opacity: 0;
    z-index: 0;
	-webkit-backface-visibility: hidden;
    -webkit-animation: imageAnimation 36s linear infinite 0s;
    -moz-animation: imageAnimation 36s linear infinite 0s;
    -o-animation: imageAnimation 36s linear infinite 0s;
    -ms-animation: imageAnimation 36s linear infinite 0s;
    animation: imageAnimation 36s linear infinite 0s;
}
.slideshow li div {
    z-index: 1000;
    position: absolute;
    bottom: 30px;
    left: 0px;
    width: 100%;
    text-align: center;
     list-style:none;
    opacity: 0;
    -webkit-animation: titleAnimation 36s linear infinite 0s;
    -moz-animation: titleAnimation 36s linear infinite 0s;
    -o-animation: titleAnimation 36s linear infinite 0s;
    -ms-animation: titleAnimation 36s linear infinite 0s;
    animation: titleAnimation 36s linear infinite 0s;
}

.slideshow li:nth-child(1) span { background-image: url(http://vpalmsprings.com/wp-content/uploads/2016/05/v-palm-springs-pool4.jpg) }
.slideshow li:nth-child(2) span {
    background-image: url(https://www.afristay.com/media/thumbnails/pictures/places/12061/12061-1.jpg.1366x768_q85_crop_upscale.jpg);
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    -ms-animation-delay: 6s;
    animation-delay: 6s;
}
.slideshow li:nth-child(3) span {
    background-image: url(https://t-ec.bstatic.com/images/hotel/max1024x768/733/73373224.jpg);
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
    -ms-animation-delay: 12s;
    animation-delay: 12s;
}
.slideshow li:nth-child(4) span {
    background-image: url(https://www.ermitage.ch/media/684012/hotel-pools-wi-1.jpg);
    -webkit-animation-delay: 18s;
    -moz-animation-delay: 18s;
    -o-animation-delay: 18s;
    -ms-animation-delay: 18s;
    animation-delay: 18s;
}
.slideshow li:nth-child(5) span {
    background-image: url(http://www.hotelroomsearch.net/im/hotels/hu/hotel-apart-hotel-4.jpg);
    -webkit-animation-delay: 24s;
    -moz-animation-delay: 24s;
    -o-animation-delay: 24s;
    -ms-animation-delay: 24s;
    animation-delay: 24s;
}
.slideshow li:nth-child(6) span {
    background-image: url(https://www.sedahotels.com/images/home_newheader02.jpg);
    -webkit-animation-delay: 30s;
    -moz-animation-delay: 30s;
    -o-animation-delay: 30s;
    -ms-animation-delay: 30s;
    animation-delay: 30s;
}
.slideshow li:nth-child(2) div {
    -webkit-animation-delay: 6s;
    -moz-animation-delay: 6s;
    -o-animation-delay: 6s;
    -ms-animation-delay: 6s;
    animation-delay: 6s;
}
.slideshow li:nth-child(3) div {
    -webkit-animation-delay: 12s;
    -moz-animation-delay: 12s;
    -o-animation-delay: 12s;
    -ms-animation-delay: 12s;
    animation-delay: 12s;
}
.slideshow li:nth-child(4) div {
    -webkit-animation-delay: 18s;
    -moz-animation-delay: 18s;
    -o-animation-delay: 18s;
    -ms-animation-delay: 18s;
    animation-delay: 18s;
}
.slideshow li:nth-child(5) div {
    -webkit-animation-delay: 24s;
    -moz-animation-delay: 24s;
    -o-animation-delay: 24s;
    -ms-animation-delay: 24s;
    animation-delay: 24s;
}
.slideshow li:nth-child(6) div {
    -webkit-animation-delay: 30s;
    -moz-animation-delay: 30s;
    -o-animation-delay: 30s;
    -ms-animation-delay: 30s;
    animation-delay: 30s;
}
/* Animation for the slideshow images */
@-webkit-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -webkit-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -webkit-transform: scale(1.05);
	    -webkit-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -webkit-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -webkit-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@-moz-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -moz-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -moz-transform: scale(1.05);
	    -moz-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -moz-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -moz-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@-o-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -o-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -o-transform: scale(1.05);
	    -o-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -o-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -o-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@-ms-keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    -ms-animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    -ms-transform: scale(1.05);
	    -ms-animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    -ms-transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    -ms-transform: scale(1.1);
	}
	100% { opacity: 0 }
}
@keyframes imageAnimation { 
	0% {
	    opacity: 0;
	    animation-timing-function: ease-in;
	}
	8% {
	    opacity: 1;
	    transform: scale(1.05);
	    animation-timing-function: ease-out;
	}
	17% {
	    opacity: 1;
	    transform: scale(1.1);
	}
	25% {
	    opacity: 0;
	    transform: scale(1.1);
	}
	100% { opacity: 0 }
}

/* Show at least something when animations not supported */
.no-cssanimations .slideshow li span{
	opacity: 1;
}
@media screen and (max-width: 1140px) { 
	.slideshow li div h3 { font-size: 100px }
}
@media screen and (max-width: 600px) { 
	.slideshow li div h3 { font-size: 50px }
}




#contentinfo p {
	line-height: 45px;
	margin: 30px;
	background-color: rgba(192,192,192,0.7)	;
	text-align: left;
	width: 650px;
	font-family: sans-serif;
	color: black;
	font-size: 18px;
	display: block;
	margin-top: 174px;
	border-radius: 5px;
	padding: 15px;
	border-radius: 5px;
	border-color: blue;
	position: fixed;
}

.background {
	background: none repeat scroll 0 0 #FFFFFF;
	height: 200%;
	left: -50%;
	position: fixed;
	width: 200%;
}

.background img {
	bottom: 0;
	display: block;
	left: 0;
	margin: auto;
	min-height: 50%;
	min-width: 50%;
	right: 0;
	top: 0;
}

.body {
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}

.login {
	position: absolute;
	top: calc(40% - 75px);
	left: calc(70% - 50px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}

.login input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
}

.login input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 4px;
	margin-top: 10px;
}

.login input[type=button] {
	width: 300px;
	height: 63px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 52px;
	color: #2eb0f2;
	font-family: 'Exo', sans-serif;
	font-style:bold;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

.login input[type=button]:hover {
	opacity: 0.6;
}

.login input[type=button]:active {
	opacity: 0.6;
}

.login input[type=text]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=password]:focus {
	outline: none;
	border: 1px solid rgba(255, 255, 255, 0.9);
}

.login input[type=button]:focus {
	outline: none;
}

::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

::-moz-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}


.footer-distributed {
	background-color: #292c2f;
	box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
	box-sizing: border-box;
	position: fixed;
    text-align: left;
    font: bold 16px sans-serif;
    padding: 7px 30px;
    margin-top: 526px;
    box-sizing: border-box;
    margin-left: -8px;
    width: 1350px;
    height: fit-content;
}

.footer-distributed .footer-left, .footer-distributed .footer-center,
	.footer-distributed .footer-right {
	display: inline-block;
	vertical-align: top;
}

/* Footer left */
.footer-distributed .footer-left {
	width: 40%;
}

/* The company logo */
.footer-distributed h3 {
	color: #ffffff;
	font: normal 36px 'Cookie', cursive;
	margin: 0;
}

.footer-distributed h3 span {
	color: #5383d3;
}

/* Footer links */
.footer-distributed .footer-links {
	color: #ffffff;
	margin: 20px 0 12px;
	padding: 0;
}

.footer-distributed .footer-links a {
	display: inline-block;
	line-height: 1.8;
	text-decoration: none;
	color: inherit;
}

.footer-distributed .footer-company-name {
	color: #8f9296;
	font-size: 14px;
	font-weight: normal;
	margin: 0;
}

/* Footer Center */
.footer-distributed .footer-center {
	width: 35%;
}

.footer-distributed .footer-center i {
	background-color: #33383b;
	color: #ffffff;
	font-size: 25px;
	width: 38px;
	height: 38px;
	border-radius: 50%;
	text-align: center;
	line-height: 42px;
	margin: 10px 15px;
	vertical-align: middle;
}

.footer-distributed .footer-center i.fa-envelope {
	font-size: 17px;
	line-height: 38px;
}

.footer-distributed .footer-center p {
	display: inline-block;
	color: #ffffff;
	vertical-align: middle;
	margin: 0;
}

.footer-distributed .footer-center p span {
	display: block;
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}

.footer-distributed .footer-center p a {
	color: #5383d3;
	text-decoration: none;;
}

/* Footer Right */
.footer-distributed .footer-right {
	width: 20%;
}

.footer-distributed .footer-company-about {
	line-height: 20px;
	color: #92999f;
	font-size: 13px;
	font-weight: normal;
	margin: 0;
}

.footer-distributed .footer-company-about span {
	display: block;
	color: #ffffff;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 20px;
}

.footer-distributed .footer-icons {
	margin-top: 25px;
}

.footer-distributed .footer-icons a {
	display: inline-block;
	width: 35px;
	height: 35px;
	cursor: pointer;
	background-color: #33383b;
	border-radius: 2px;
	font-size: 20px;
	color: #ffffff;
	text-align: center;
	line-height: 35px;
	margin-right: 3px;
	margin-bottom: 5px;
}

/* If you don't want the footer to be responsive, remove these media queries */
@media ( max-width : 880px) {
	.footer-distributed {
		font: bold 14px sans-serif;
	}
	.footer-distributed .footer-left, .footer-distributed .footer-center,
		.footer-distributed .footer-right {
		display: block;
		width: 100%;
		margin-bottom: 40px;
		text-align: center;
	}
	.footer-distributed .footer-center i {
		margin-left: 0;
	}
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Management System</title>
</head>
<body>

<ul class="slideshow">
  <li><span>Image 01</span></li>
  <li><span>Image 02</span></li>
  <li><span>Image 03</span></li>
  <li><span>Image 04</span></li>
  <li><span>Image 05</span></li>
  <li><span>Image 06</span></li>
</ul>
	<center>
		<h1 class="heading1">Hotel Management System</h1>
	</center>
	<div id="contentinfo">
		<p>Welcome to Hotel Management System.From Luxury Hotels to Budget
			Accommodations, we provide best deals and discounts for hotel rooms
			anywhere.A hotel is an establishment that provides paid lodging on a
			short-term basis. Facilities provided may range from a modest-quality
			mattress in a small room to large suites with bigger, higher-quality</p>
	</div>
	<div class="login">
		<a href="getLoginPage.html?loginType=Admin"><input type="button"
			value="Admin Login"></a> <a
			href="getLoginPage.html?loginType=Employee"><input type="button"
			value="Hotel Employee"></a> <a
			href="getLoginPage.html?loginType=User"><input type="button"
			value="Customer"></a>
	</div>
	<div class="footer-distributed">

		<div class="footer-left">

			<h3>
				Hotel<span>Management</span>
			</h3>

			<p class="footer-links">
				<a href="#">Home</a> � <a href="#">Blog</a> � <a href="#">Pricing</a>
				� <a href="#">About</a> � <a href="#">Faq</a> � <a href="#">Contact</a>
			</p>

			<p class="footer-company-name">Capgemini &copy; 2017</p>
		</div>

		<div class="footer-center">

			<div>
				<i class="fa fa-map-marker"></i>
				<p>
					<span>Capgemini, Phase III </span> Hinjewadi, Pune Maharashtra 
				</p>
			</div>
			<div>
				<i class="fa fa-envelope"></i>
				<p>
					<a href="mailto:support@company.com">hotelbookingmanagement@gmail.com</a>
				</p>
			</div>

		</div>

		<div class="footer-right">

			<p class="footer-company-about">
				<span>About the company</span>
				We provide best hotels in affordable prices with all facilities.
			</p>
		</div>
	</div>
</body>
</html>