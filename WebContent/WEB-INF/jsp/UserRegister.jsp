<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
body {
	font: normal 16px sans-serif;
	background: linear-gradient(135deg, #172a74, #21a9af);
	background-color: #184e8e;
}

.login {
	height: 375px;
	margin-left: 850px;
	margin-top: 120px;
	width: 268px;
	padding: 10px;
	margin-bottom: 132px;
	z-index: 2;
}

.login input[type=text] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: black;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 8px;
}

.login input[type=email] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: black;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 8px;
}

.login input[type=password] {
	width: 250px;
	height: 30px;
	background: transparent;
	border: 1px solid rgba(255, 255, 255, 0.6);
	border-radius: 2px;
	color: black;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 8px;
	margin-top: 10px;
}

.login input[type=submit] {
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 10px;
	margin-top: 10px;
}

.login input[type=submit]:hover {
	opacity: 0.6;
}

.login input[type=submit]:active {
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

.login input[type=submit]:focus {
	outline: none;
}

::-webkit-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}

::-moz-input-placeholder {
	color: rgba(255, 255, 255, 0.6);
}
</style>
<title>Registration</title>
</head>
<body>
	<form:form action="userRegister.html" method="post"
		modelAttribute="userDetails">
		<div class="login">
			<h2 style="padding-left: 10px; color: white;">Register new
				account</h2>
			<form:input placeholder="user name" path="name"
				pattern="[a-zA-Z ]{3,20}"
				title="name should be between 3 and 20 characters, only alphabets and space allowed"
				required="required" />
			<br /> <br />
			<form:input placeholder="password" type="password"
				title="password should be 4 to 10 characters (only alphabets and numbers alllowed)"
				pattern="[a-zA-Z0-9]{4,10}" path="password" required="required" />
			<br /> <br />
			<form:input type="email" placeholder="email" path="email"
				required="required" />
			<br /> <br />
			<form:input placeholder="city" pattern="[a-zA-z ]{3,25}"
				title="provide valid city" path="address" required="required" />
			<br /> <br />
			<form:input placeholder="mobile number" pattern="[7-9][0-9]{9}"
				title="provide valid mobile number" path="mobileNumber"
				required="required" />
			<br /> <br /> <input type="submit" value="register" />
		</div>
	</form:form>
</body>
</html>