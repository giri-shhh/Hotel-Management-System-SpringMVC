<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<title>Booking Success</title>
<style type="text/css">
body {
	min-height: 100vh;
	font: normal 16px sans-serif;
	background: linear-gradient(135deg, #172a74, #21a9af);
	background-color: #184e8e;
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
	font-size: 25px;
	margin-top: 20px;
	margin-bottom: 12px;
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
	margin-bottom: 10px;
	font-weight: 300;
}

.header-blue .phone-holder {
	text-align: right;
}
</style>
</head>
<body>
	<div>
		<div class="header-blue">
			<nav class="navbar navbar-default navigation-clean-search">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand navbar-link" href="getUserHomePage.html">Home</a>
				</div>
				<div class="collapse navbar-collapse" id="navcol-1">
					<form class="navbar-form navbar-left" action="getSearchHotels.html"
						id="search" method="get" style="padding-left: 170px;">
						<div class="form-group">
							<label class="control-label" for="search-field"></label> <input
								name="searchStr" type="text" size="40"
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
			<div class="container hero">
				<div class="row">
					<div class="col-lg-5 col-lg-offset-1 col-md-6 col-md-offset-0"
						style="margin-left: 0px; margin-top: -18px; width: 500px;">
						<h1>Your Booking is Successful.Booking Id is :
							${bookDetails.id}</h1>
						<p>Check-in : ${bookDetails.bookFrom}</p>
						<p>Check-out : ${bookDetails.bookTo}</p>
						<p>No. of adults : ${bookDetails.noOfAdults }</p>
						<p>No. of children : ${bookDetails.noOfChildren }</p>
						<p>Hotel Name : ${hotelDetails.name }</p>
						<p>Hotel Address : ${hotelDetails.address }</p>
						<p>Hotel City : ${hotelDetails.city }</p>
						<p>Amount to be paid : Rs.${bookDetails.amount }</p>
						<p>Bill invoice email sent to : ${user.email}</p>
						<a href="getUserHomePage.html"><button
								class="btn btn-default btn-lg action-button" type="button">Book
								More</button></a>
					</div>
					<div
						class="col-lg-5 col-lg-offset-0 col-md-5 col-md-offset-1 hidden-xs hidden-sm phone-holder">
						<div class="iphone-mockup">
							<img src="${roomPhotoPath}" width="700px" height="393px"
								class="device" style="border-radius: 5px;">
							<div class="screen"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>