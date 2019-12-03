<%@page import="user.User"%>
<%@page import="Address.AddressHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="category.CategoryHandler"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	User u = (User) request.getSession().getAttribute("currentUser");
	AddressHandler ah = new AddressHandler();

	request.setAttribute("uaddress", ah.fetchAddress(u.getId()));
%>
<c:import url="shared.jsp" />
<c:import url="Header.jsp" />


</head>
<body>
	<c:if test="${empty uaddress }">
		<h1>No address found!</h1>
	</c:if>

	<c:if test="${not empty uaddress}">

		<div class="container">
			<c:forEach items="${uaddress}" var="uadd">
				<div class="card">
					<div class="card-body">

						<h1>${uadd.getName()}</h1>
						<p>${uadd.getPhone()}</p>
						<p>${uadd.getPincode()}</p>
						<p>${uadd.getLocality()}</p>
						<p>${uadd.getAddress()}</p>
						<p>${uadd.getCity()}</p>
						<p>${uadd.getState()}</p>
						<p>${uadd.getLandmark()}</p>


						<a href="EditAddress.jsp?id=${uadd.getId()}"
							class="btn btn-outline-danger">Edit</a> <a
							href="DeleteAddressToDB?id=${uadd.getId()}"
							class="btn btn-outline-danger">Delete</a> <br> <a
							class="btn btn-success" href="Payment.jsp?id=${uadd.getId()}">
							<i class="far fa-credit-card" style="width: 100%;"></i>&nbsp;Confirm
							to Pay
						</a>

					</div>
				</div>
			</c:forEach>

		</div>

	</c:if>

</body>
</html>