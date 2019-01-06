<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>Hotel Id</th>
			<th>Room Id</th>
			<th>Room Number</th>
			<th>Room Type</th>
			<th>Per Night Rate</th>
			<th>Book Hotel</th>
		</tr>
		<c:forEach items="${Rooms}" var="Room">
			<tr>
				<td>${Room.hotelId }</td>
				<td>${Room.id }</td>
				<td>${Room.number }</td>
				<td>${Room.type }</td>
				<td>${Room.perNightRate }</td>
				<td><a href="bookRooms.html?roomId=${Room.id }">Book Hotel</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>