<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<style type="text/css">
body {
	min-height: 100vh;
	font: normal 16px sans-serif;
	background: linear-gradient(135deg, #172a74, #21a9af);
	background-color: #184e8e;
}

.gallery-container h1 {
	text-align: center;
	margin-top: 70px;
	font-family: 'Droid Sans', sans-serif;
	font-weight: bold;
	color: #58595a;
}

.gallery-container p.page-description {
	text-align: center;
	margin: 30px auto;
	font-size: 18px;
	color: #85878c;
}

.tz-gallery {
	padding: 40px;
}

.tz-gallery .thumbnail {
	padding: 0;
	margin-bottom: 30px;
	background-color: #fff;
	border-radius: 4px;
	border: none;
	transition: 0.15s ease-in-out;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.06);
}

.tz-gallery .thumbnail:hover {
	transform: translateY(-10px) scale(1.02);
}

.tz-gallery .lightbox img {
	border-radius: 4px 4px 0 0;
	width: 400px;
    height: 220px;
	
}

.tz-gallery .caption {
	padding: 26px 30px;
	text-align: center;
}

.tz-gallery .caption h3 {
	font-size: 14px;
	font-weight: bold;
	margin-top: 0;
}

.tz-gallery .caption p {
	font-size: 12px;
	color: #7b7d7d;
	margin: 0;
}

.baguetteBox-button {
	background-color: transparent !important;
}

/
**** search box

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
	margin-bottom: -35px;
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
	color: white;
}

.header-blue .navbar.navbar-default .navbar-nav>li>a:focus, .header-blue .navbar.navbar-default .navbar-nav>li>a:hover
	{
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
<title>Search Hotels</title>
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
				<c:if test="${requestType == '1'}">
					<form class="navbar-form navbar-left" action="getSearchHotels.html"
						id="search" method="get" style="padding-left: 100px;">

						<div class="form-group">
							<label class="control-label" for="search-field"></label> <input
								name="searchStr" type="text" size="40"
								style="margin-left: 60px;"
								placeholder="Search hotels...    based on name or place."
								title="Royal and Luxury Hotels" />
						</div>
					</form>
				</c:if>
				<c:if test="${requestType == '2'}">
					<form class="navbar-form navbar-left"
						action="getUserSpecificBooking.html" id="search" method="get"
						style="padding-left: 100px;">
						<div class="form-group">
							<label class="control-label" for="search-field"></label> <input
								type="text" size="40" name="bookingId"
								style="margin-left: 60px;" placeholder="Enter Booking Id" />
						</div>
					</form>
				</c:if>
				<p class="navbar-text navbar-right">
					<a class="navbar-link login" href="">${userName}</a> <a
						class="btn btn-default action-button" role="button"
						href="Userlogout.html">Logout</a>
				</p>
			</div>
		</div>
		</nav>
	</div>
	<div class="container gallery-container">
		<div class="tz-gallery">
			<h3 align="center"
				style="color: white; margin-top: 15px; margin-bottom: 15px;">${info}</h3>
			<div class="row">
				<c:choose>
					<c:when test="${requestType == '1'}">
						<c:forEach items="${HotelList}" var="Hotel">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<a class="lightbox"
										href="viewHotelDetails.html?hotelId=${Hotel.id}"> <img
										src="${Hotel.photoPath}" alt="${Hotel.name }">
									</a>
									<div class="caption">
										<h3>${Hotel.name }</h3>
										<p style="color: black;">${Hotel.city }</p>
										<p>${Hotel.description}</p>
										<p>${Hotel.avgPerNight }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:when test="${requestType == '2'}">
						<c:forEach items="${BookingList}" var="Booking">
							<div class="col-sm-6 col-md-4">
								<div class="thumbnail">
									<a class="lightbox" href=""> <img
										src="${Booking.photoPath}" alt="${Booking.id }">
									</a>
									<div class="caption">
										<h3>Booking Id : ${Booking.id}</h3>
										<p>Room Id : ${Booking.roomId }</p>
										<p>User Id : ${Booking.userId}</p>
										<p>Book from : ${Booking.bookFrom }</p>
										<p>Book To : ${Booking.bookTo }</p>
										<p>No. of Adults : ${Booking.noOfAdults }</p>
										<p>No. of Children : ${Booking.noOfChildren }</p>
										<p>Booking Amount : ${Booking.amount }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
	<script>
		baguetteBox.run('.tz-gallery');
	</script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>