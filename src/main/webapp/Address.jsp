<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address</title>
<c:import url="shared.jsp" />
<%
	User u = (User) request.getSession().getAttribute("currentUser");
%>
</head>
<body>

	<form style="padding-top: 10%;" action="AddToAddress" method="post">
		<input type="hidden" value="${sessionScope.currentUser.getId()}"
			name="UserId">

		<h1 style="align-items: center;">Address</h1>
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputEmail4">Name</label> <input type="text"
					class="form-control" id="inputEmail4" placeholder="Name"
					name="name">
			</div>
			<div class="form-group col-md-6">
				<label for="inputPassword4">Phone</label> <input type="number"
					class="form-control" id="inputPassword4" placeholder="phone"
					name="phone">
			</div>
		</div>
		<div class="form-group">
			<label for="inputAddress">Address</label> <input type="text"
				class="form-control" id="inputAddress" placeholder="1234 Main St"
				name="address">
		</div>

		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputCity">City</label> <input type="text"
					class="form-control" id="inputCity" name="city">
			</div>
			<div class="form-group col-md-4">
				<label for="inputState">State</label> <select id="inputState"
					class="form-control" name="state">
					<option selected>Choose...</option>
					<option>delhi</option>
					<option>channai</option>
					<option>mumbai</option>




				</select>
			</div>
			<div class="form-group col-md-2">
				<label for="inputZip">Pincode</label> <input type="text"
					class="form-control" id="inputZip" name="pin">
			</div>
			<div class="form-group col-md-4">
				<label for="inputZip">locality</label> <input type=""
					class="form-control" id="inputZip" placeholder="locality"
					name="locality">
			</div>
			<div class="form-group col-md-4">
				<label for="inputZip">alternatePhone</label> <input type="number"
					class="form-control" id="inputZip" placeholder="Alternate_number"
					name="alternate_phone">
			</div>
			<div class="form-group col-md-4">
				<label for="inputZip">landmark</label> <input type="text"
					class="form-control" id="inputZip" placeholder="landmark"
					name="landmark">
			</div>

		</div>
				<br>
		<br>
		<br>
		<button type="submit" class="btn btn-primary" style="width: 100%;">CheckOut</button>
	</form>
</body>
</html>