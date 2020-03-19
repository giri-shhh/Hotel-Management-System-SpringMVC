<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Managemenet System</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<style type="text/css">
body {
	background: linear-gradient(135deg, #172a74, #21a9af);
	background-color: #184e8e;
}

.img1 {
	height: 404px;
	width: 720px;
	margin-top: 65px;
	border: medium;
	border-radius: 12px;
}

.product-list-vertical {
	margin-top: 60px;
	list-style: none;
	max-width: 1366px;
	padding: 0;
	height: 650px;
	list-style: none;
}

.product-list-vertical li {
	box-sizing: border-box;
	overflow: hidden;
	text-align: left;
	font: normal 12px sans-serif;
	background-color: transparent;
	border-radius: 3px;
	box-shadow: 1px 3px 1px rgba(0, 0, 0, 0.08);
	max-width: 1300px;
	margin-bottom: 51px;
	padding: 25px;
	height: 600px;
	margin-top: 100px;
	margin-left: 20px;
	margin-top: -30px;
}

/* Product image */
.product-list-vertical .product-photo {
	float: left;
	display: block;
	text-align: center;
	border-radius: 7px;
	box-sizing: content-box;
	height: 100px;
	box-sizing: border-box;
}

.product-list-vertical .product-details {
	max-width: 300px;
	float: left;
	margin-left: 22px;
	margin-top: 19px;
}

/* Product title */
.product-list-vertical .product-details h2 {
	display: block;
	margin: 0;
	font-size: 18px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 18px;
}

.product-list-vertical .product-details h2 a {
	color: #fff;
	text-decoration: none;
}

/* Product rating */
.product-list-vertical .product-details .product-rating div {
	display: inline-block;
	width: 80px;
	margin-top: 10px;
}

.product-list-vertical .product-details .product-rating .product-stars {
	display: inline-block;
	color: #f09911;
	font-size: 14px;
	overflow: hidden;
	white-space: nowrap;
	margin: 0 5px -3px 0;
}

.product-list-vertical .product-details .product-rating .product-stars i
	{
	margin-right: 2px;
}

.product-list-vertical .product-details .product-rating span a {
	color: #fff;
	text-decoration: none;
	margin-left: 10px;
}

/* Product description */
.product-list-vertical .product-details
 
.product-description {
	color: #fff;
	font-size: 14px;
	line-height: 15px;
	white-space: normal;
	margin: 20px 0;
}

/* Product button and price */
.product-list-vertical .product-details button {
	border-radius: 2px;
	background-color: #87bae1;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.12);
	border: 0;
	color: #ffffff;
	font-weight: bold;
	font-size: 13px;
	cursor: pointer;
	width: 95px;
	height: 32px;
}

.product-list-vertical .product-details .product-price {
	float: left;
	color: #fff;
	font-weight: bold;
	font-size: 20px;
	margin: 0;
	padding-bottom: 6px;
}

/* Making the product list responsive */
@media ( max-width : 600px) {
	.product-list-vertical li {
		max-width: 265px;
		margin-left: auto;
		margin-right: auto;
	}
	.product-list-vertical .product-photo {
		float: none;
		margin: 0 0 25px 0;
	}
	.product-list-vertical .product-details {
		float: none;
	}
	.product-list-vertical .product-details .product-description {
		margin-top: 10px;
	}
}

.form-mini-container {
	max-width: 315px;
	margin: 0 auto;
	font: normal 14px sans-serif;
	text-align: center;
	color: #5f5f5f;
}

.form-mini-container h1 {
	color: #4c565e;
	font-size: 24px;
	padding-bottom: 30px;
	border-bottom: 2px solid #6caee0;
	font-weight: bold;
	margin: 0;
}

.form-mini {
	box-sizing: border-box;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 20px;
	padding-top: 3px;
	box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
}

.form-mini .form-row {
	display: block;
	text-align: left;
	margin-bottom: 23px;
}

.form-mini input, .form-mini select {
	box-sizing: border-box;
	width: 240px;
	box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
	padding: 12px 18px;
	border: 1px solid #dbdbdb;
}

.form-mini input[type=radio], .form-mini input[type=checkbox] {
	box-shadow: none;
	width: auto;
}

.form-mini select {
	color: inherit;
	background-color: #ffffff;
}

.form-mini .form-checkbox span {
	margin-left: 5px;
}

.form-mini .form-checkbox input {
	width: auto;
}

.form-mini .form-radio-buttons>div {
	margin-bottom: 10px;
}

.form-mini .form-radio-buttons input {
	width: auto;
}

.form-mini .form-radio-buttons label span {
	margin-left: 8px;
}

.form-mini .form-last-row {
	margin: 35px auto 0;
}

.form-mini button {
	display: block;
	border-radius: 2px;
	background-color: #6caee0;
	color: #ffffff;
	font-weight: bold;
	box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
	width: 100%;
	padding: 14px 22px;
	border: 0;
	cursor: pointer;
}

/* Placeholder color */
.form-mini ::-webkit-input-placeholder {
	color: #999;
}

.form-mini ::-moz-placeholder {
	color: #999;
	opacity: 1;
}

.form-mini :-ms-input-placeholder {
	color: #999;
}

/*	Making the form responsive. Remove this media query
    if you don't need the form to work on mobile devices. */
@media ( max-width : 600px) {
	.form-mini-container {
		margin-top: 0;
	}
}

.bookHotelBackground {
	margin-left: 962px;
	margin-top: -616px;
	width: 325px;
	display: inline-block;
}

label {
	margin-bottom: 5px;
}

.container.gallery-container {
	background-color: #fff;
	color: #35373a;
	min-height: 100vh;
	padding: 30px 50px;
}

.gallery-container h1 {
	text-align: center;
	margin-top: 50px;
	font-family: 'Droid Sans', sans-serif;
	font-weight: bold;
}

.gallery-container p.page-description {
	text-align: center;
	margin: 25px auto;
	font-size: 18px;
	color: #999;
}

.thumbs {
	width: 943px;
	margin: -260px auto 182px;
	text-align: center;
	margin-left: -3px;
}

.thumbs a {
	width: 200px;
	height: 135px;
	display: inline-block;
	border: 7px solid #303030;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5);
	border-radius: 4px;
	margin: 33px 6px -99px;
	position: relative;
	text-decoration: none;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	-moz-background-size: cover;
	-webkit-background-size: cover;
}

.thumbs a:after {
	background-color: #303030;
	border-radius: 7px;
	bottom: -136px;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
	color: #FFFFFF;
	display: inline-block;
	font-size: 10px;
	max-width: 90px;
	overflow: hidden;
	padding: 2px 10px;
	position: relative;
	text-align: center;
	white-space: nowrap;
}

@media screen and (max-width: 960px) {
	.thumbs, #credit {
		width: auto;
	}
	footer {
		display: none;
	}
	#bsaHolder {
		display: none;
	}
}

#search {
	
}

#search input[type="text"] {
	background: url(search-white.png) no-repeat 10px 6px #444;
	border: 0 none;
	height: 40px;
	font: bold 12px Arial, Helvetica, Sans-serif;
	color: #d7d7d7;
	width: 150px;
	padding: 6px 15px 6px 35px;
	-webkit-border-radius: 20px;
	-moz-border-radius: 20px;
	border-radius: 20px;
	text-shadow: 0 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px
		rgba(0, 0, 0, 0.2) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px
		rgba(0, 0, 0, 0.2) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 3px
		rgba(0, 0, 0, 0.2) inset;
	-webkit-transition: all 0.7s ease 0s;
	-moz-transition: all 0.7s ease 0s;
	-o-transition: all 0.7s ease 0s;
	transition: all 0.7s ease 0s;
	font: bold 12px Arial, Helvetica, Sans-serif;
}

#search input[type="text"]:focus {
	background: url(search-dark.png) no-repeat 10px 6px #fcfcfc;
	color: #6a6f75;
	width: 500px;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0
		rgba(0, 0, 0, 0.9) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0
		rgba(0, 0, 0, 0.9) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1), 0 1px 0 rgba(0, 0, 0, 0.9)
		inset;
	text-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
}

.header-blue {
	padding-bottom: 0px;
	font-family: 'Source Sans Pro', sans-serif;
}

@media ( max-width :767px) {
	.header-blue {
		padding-bottom: 80px;
	}
}

.header-blue .navbar {
	background: transparent;
	padding-top: 12px;
	padding-bottom: 10px;
	color: #fff;
	border-radius: 0;
	box-shadow: none;
	border: none;
}

@media ( max-width :767px) {
	.header-blue .navbar {
		padding-top: 0;
		padding-bottom: 0;
	}
}

@media ( max-width :767px) {
	.header-blue .navbar .navbar-header {
		padding-top: 10px;
		margin-left: 400px;
		padding-bottom: 10px;
	}
}

@media ( max-width :767px) {
	.header-blue .navbar .navbar-right {
		margin-bottom: 20px;
	}
}

.header-blue .navbar .navbar-brand {
	font-weight: bold;
	color: inherit;
}

.header-blue .navbar .navbar-brand:hover {
	color: #f0f0f0;
}

.header-blue .navbar .navbar-brand img {
	height: 100%;
	display: inline-block;
	margin-right: 10px;
	width: auto;
}

.header-blue .navbar .navbar-collapse p {
	margin-top: 10px;
	margin-bottom: 0;
}

.header-blue .navbar .navbar-collapse p .login {
	color: #d9d9d9;
	margin-right: 10px;
	text-decoration: none;
}

.header-blue .navbar .navbar-collapse p .login:hover {
	color: #fff;
}

.header-blue .navbar .navbar-toggle {
	border-color: rgba(255, 255, 255, 0.3);
}

.header-blue .navbar .navbar-toggle:hover, .header-blue .navbar-toggle:focus
	{
	background: none;
}

.header-blue .navbar .navbar-toggle .icon-bar {
	background-color: #eee;
}

.header-blue .navbar .navbar-collapse, .header-blue .navbar .navbar-form
	{
	border-color: rgba(255, 255, 255, 0.3);
}

.header-blue .navbar .navbar-nav>.active>a, .header-blue .navbar .navbar-nav>.open>a
	{
	background: none;
	box-shadow: none;
}

.header-blue .navbar.navbar-default .navbar-nav>.active>a, .header-blue .navbar.navbar-default .navbar-nav>.active>a:focus,
	.header-blue .navbar.navbar-default .navbar-nav>.active>a:hover {
	color: rgba(255, 255, 255, 0.3);
	box-shadow: none;
	background: none;
	pointer-events: none;
}

.header-blue .navbar.navbar .navbar-nav>li>a {
	padding-left: 18px;
	padding-right: 18px;
}

.header-blue .navbar.navbar-default .navbar-nav>li>a {
	color: #d9d9d9;
}

.header-blue .navbar.navbar-default .navbar-nav>li>a:focus, .header-blue .navbar.navbar-default .navbar-nav>li>a:hover
	{
	color: #fcfeff !important;
	background-color: transparent;
}

.header-blue .navbar .navbar-nav>li>.dropdown-menu {
	margin-top: -5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, .1);
	background-color: #fff;
	border-radius: 2px;
}

.header-blue .navbar .dropdown-menu>li>a:focus, .header-blue .navbar .dropdown-menu>li>a
	{
	line-height: 2;
	font-size: 14px;
	color: #37434d;
}

.header-blue .navbar .dropdown-menu>li>a:focus, .header-blue .navbar .dropdown-menu>li>a:hover
	{
	background: #ebeff1;
}

@media ( max-width :767px) {
	.header-blue .navbar .navbar-nav .open .dropdown-menu {
		box-shadow: none;
		background: none;
		color: #fff;
	}
}

@media ( max-width :767px) {
	.header-blue .navbar .navbar-nav .open .dropdown-menu>li>a {
		color: #fdfeff;
		padding-top: 12px;
		padding-bottom: 12px;
		line-height: 1;
	}
}

.header-blue .action-button, .header-blue .action-button:active {
	border: 1px solid rgba(255, 255, 255, 0.7);
	border-radius: 20px;
	color: #ebeff1;
	box-shadow: none;
	text-shadow: none;
	padding: 6px 15px;
	background: transparent;
	transition: background-color 0.25s;
	outline: none;
}

.header-blue .action-button:hover {
	color: #fff;
}

.header-blue .action-button.btn-lg {
	padding: 7px 18px;
}

.header-blue .navbar .navbar-form label {
	color: #ccc;
}

.header-blue .navbar .navbar-form .search-field {
	background: none;
	border: none;
	border-bottom: 1px solid transparent;
	border-radius: 0;
	color: #ccc;
	box-shadow: none;
	color: inherit;
	transition: border-bottom-color 0.3s;
}

@media ( max-width :767px) {
	.header-blue .navbar .navbar-form .search-field {
		display: inline-block;
		width: 80%;
	}
}

.header-blue .navbar .navbar-form .search-field:focus {
	border-bottom: 1px solid #ccc;
}

.header-blue .hero {
	margin-top: 60px;
}

@media ( max-width :767px) {
	.header-blue .hero {
		margin-top: 20px;
		text-align: center;
	}
}

.header-blue .hero h1 {
	color: #fff;
	font-size: 40px;
	margin-top: 190px;
	margin-bottom: 24px;
	font-weight: 300;
}

@media ( max-width :991px) {
	.header-blue .hero h1 {
		margin-top: 0;
		margin-bottom: 15px;
		line-height: 1.4;
	}
}

.header-blue .hero p {
	color: rgba(255, 255, 255, 0.8);
	font-size: 20px;
	margin-bottom: 30px;
	font-weight: 300;
}

.header-blue .phone-holder {
	text-align: right;
}

.header-blue div.iphone-mockup {
	position: relative;
	max-width: 300px;
	margin: 20px;
	display: inline-block;
}

.header-blue .iphone-mockup img.device {
	width: 100%;
	height: auto;
}

.header-blue .iphone-mockup .screen {
	position: absolute;
	width: 88%;
	height: 77%;
	top: 12%;
	border-radius: 2px;
	left: 6%;
	border: 1px solid #444;
	background-color: #aaa;
	overflow: hidden;
	background: url(../../assets/img/skyscraper.jpg);
	background-size: cover;
	background-position: center;
}

.header-blue .iphone-mockup .screen:before {
	content: '';
	background-color: #fff;
	position: absolute;
	width: 70%;
	height: 140%;
	top: -12%;
	right: -60%;
	transform: rotate(-19deg);
	opacity: 0.2;
}
</style>
</head>
<body>
	<div class="header-blue">
		<nav class="navbar navbar-default navigation-clean-search">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand navbar-link" href="getUserHomePage.html">Home</a>
				<a class="navbar-link login" href="getUserBookings.html"><input
					type="button" value="Booking Status"
					style="background: transparent; border: 0px; color: white; margin-top: 14px;"></a>
			</div>
			<div class="collapse navbar-collapse col-lg-12 row" id="navcol-1"
				style="width: 965px;">
				<form class="navbar-form navbar-left" action="getSearchHotels.html"
					id="search" method="get" style="padding-left: 100px;">

					<div class="form-group">
						<label class="control-label" for="search-field"></label> <input
							name="searchStr" type="text" size="40" style="margin-left: 60px;"
							placeholder="Search hotels...    based on name or place."
							title="Royal and Luxury Hotels" />
					</div>
				</form>
				<p class="navbar-text navbar-right">
					<a class="navbar-link login" href="">${userName}</a> <a
						class="btn btn-default action-button" role="button"
						href="Userlogout.html">Logout</a>
				</p>
			</div>
		</div>
		</nav>
	</div>
	<c:if test="${available=='no' }">
		<h2
			style="color: white; height: -webkit-fill-available; margin-left: 500px;">Sorry,
			No rooms are available.</h2>
	</c:if>
	<c:if test="${available ne 'no' }">
		<ul class="product-list-vertical">
			<li><img class="product-photo" src="${hotelDetails.photoPath }"
				alt="${hotelDetails.name}" style="width: 650px; height: 365px;" />
				<div class="product-details">
					<h2>${hotelDetails.name}</h2>
					<div class="product-rating">
						<div>
							<span class="product-stars" style="width: 150px"> <c:forEach
									begin="1" end="${hotelDetails.rating}">
									<i class="fa fa-star"></i>
								</c:forEach> <span>ratings</span>
							</span>
						</div>

					</div>
					<p class="product-description">Phone : ${hotelDetails.phoneNo1 }</p>
					<p class="product-description">City : ${hotelDetails.city }</p>
					<p class="product-description">Email : ${hotelDetails.email }</p>
					<p class="product-description">Fax : ${hotelDetails.fax }</p>
					<p class="product-description">${hotelDetails.description}</p>
					<p class="product-price">Rs.${hotelDetails.avgPerNight }</p>
					<br />
				</div></li>
		</ul>
		<div class="bookHotelBackground">
			<form:form class="form-mini" method="post"
				action="bookHotel.html?hotelId=${hotelId }"
				modelAttribute="bookDetails">
				<div class="form-row">
					<h2 align="center">Book Your Hotel</h2>
					<form:input path="bookFrom" type="text"
						placeholder="Book from (format : mm/dd/yyyy)" />
				</div>

				<div class="form-row">
					<form:input path="bookTo" type="text"
						placeholder="Book to (format : mm/dd/yyyy)" />
				</div>

				<div class="form-row">
					<label> <select name="roomCategory">
							<option selected="selected" disabled="disabled" value="">Room
								Category</option>
							<option value="Standard Non A/C">Standard Non A/C</option>
							<option value="Standard A/C">Standard A/C</option>
							<option value="Executive A/C">Executive A/C</option>
							<option value="Deluxe A/C">Deluxe A/C</option>
					</select></label>
				</div>
				<div class="form-row">
					<span>No. of Adult</span>
					<form:input type="number" min="1" max="4" path="noOfAdults"
						placeholder="No of Adults" />
				</div>

				<div class="form-row">

					<span>No. of Children</span>
					<form:input type="number" max="3" min="0" path="noOfChildren"
						placeholder="No of Children" />
				</div>
				<div class="form-row form-last-row">
					<input type="submit" value="Book Now!"></input>
				</div>
			</form:form>
		</div>
		<div class="thumbs">
			<c:forEach items="${hotelPhotos}" var="hotelPhoto">
				<a href="${hotelPhoto}" style="background-image: url(${hotelPhoto})"></a>
			</c:forEach>
		</div>
	</c:if>
</body>
</html>