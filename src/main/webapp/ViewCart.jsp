<%@page import="product.ProductHandler"%>
<%@page import="product.Product"%>
<%@page import="cart.Cart"%>
<%@page import="user.User"%>
<%@page import="cart.CartHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
</style>
<c:import url="shared.jsp"></c:import>

<%
	CartHandler ch = new CartHandler();
	//request.setAttribute("CList", ch.fetchAllCarts());

	User u = (User) request.getSession().getAttribute("currentUser");

	if (u == null) {
		request.setAttribute("CList", ch.fetchAllCarts());
	} else {
		request.setAttribute("CList", ch.fetchAllCartItemsForUser(u.getId()));
	}

	float grandTotal = 0.0f;
	ProductHandler ph = new ProductHandler();
%>

</head>
<body>

	<c:import url="Header.jsp" />


	<div
		style="border: 5px solid black; background: grey; padding-bottom: 5px">
		<h1 style="text-align: center;">My Cart</h1>
		<a href="ViewProduct.jsp" style="color: black;">More Items</a> <br>
	</div>
	<c:choose>
		<c:when test="${empty CList}">
			<h1 class="alert alert-danger">
				Cart is empty !!! Shop more To add<br> <br> Happy
				Shopping...............
			</h1>
		</c:when>

		<c:otherwise>

			<!-- <div style="border: 5px solid black;background: grey;">
<h2 style="text-align: center;">Items</h2>
</div>
-->

			<c:forEach items="${CList}" var="cart">
				<!--  -->
				<%
					Cart x = (Cart) (pageContext.getAttribute("cart"));
								Product p = ph.fetchProduct((short) (x.getProductId()));
								//pageContext.setAttribute("pro",p);
				%>

				<div
					style="border: 5px solid black; background: grey; padding-bottom: 5px;">
					<div class="card"
						style="max-width: 40%; margin-left: 420px; margin-top: 20px;">
						<div class="card-body">
							<img style="width: 100%; margin: auto; height: 250px;"
								src="<%=p.getImageUrl()%>"> <br> <br>
							<div style="text-align: center;">
								<h3><%=p.getName()%></h3>

								<h3 class="badge badge-pill badge-danger"><%=p.getCategory().getName()%></h3>
								<br>

								<h6 style="font-weight: bold;">
									Price:<i id="R" class="fas fa-dollar-sign"></i><%=p.getPrice()%></h6>

								
							<h8 style="font-weight: bold;"> Quantity = ${cart.getQty()}</h8>
							<br>
								<form action="UpdateCartQty" method="post">
									<select name="quantity" class="form-control"
										style="text-align: center;">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>

									</select> <br>
									<button class="btn btn-primary" style="text-align: center;">OK</button>
									<input type="hidden"
										value="${sessionScope.currentUser.getId()}" name="user">
									<input type="hidden" value="${cart.getId()}" name="id">
									<input type="hidden" value="${cart.getProductId()}" name="productId">
								</form>
								
								
								<br>

								<h8 style="font-weight: bold;"> Price = <%=p.getPrice()%> <br>
								</h8>
								<h3>
									Subtotal = Rs.
									<%=p.getPrice() * x.getQty()%>

									<%
										grandTotal += p.getPrice() * x.getQty();
									%>/-
								</h3>
							</div>

							<div></div>
							<!-- <a href="" class="btn  btn-outline-primary">edit</a> -->
							<a href="DeleteCart?id=${cart.getId()}" class="btn btn-danger"
								style="width: 100%;">delete</a>
						</div>

						<p>${pro.getDescription()}</p>


					</div>
				</div>


				<%-- <td>${cart.getQuantity()}</td>

<td><%=p.getPrice() * x.getQuantity()%></td>
<%
grandTotal += p.getPrice() * x.getQuantity();
%>

<td>
<!-- <a href="" class="btn  btn-outline-primary">edit</a> --> <a
href="DeleteCart?id=${cart.getId()}"
class="btn btn-outline-danger">delete</a>
</td> --%>

			</c:forEach>

			<br>
			<div
				style="text-align: center; border: 5px solid black; background-color: grey;">

				<h1 font-weight:bold;>
					Grand Total:
					<%=grandTotal%></h1>

				<a href="Address.jsp?userId=${sessionScope.currentUser.getId()}"
					class="btn btn-success" style="border: 1px solid black">Confirm
					Order</a> <br>
			</div>

		</c:otherwise>
	</c:choose>



</body>
</html>