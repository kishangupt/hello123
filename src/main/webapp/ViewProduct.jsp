
<%@page import="product.ProductHandler"%>
<%@page import="category.CategoryHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<c:import url="shared.jsp" />


<%
	ProductHandler ph = new ProductHandler();

	request.setAttribute("productList", ph.fetchAllProducts());
%>

<style type="text/css">
.card {
	width: 28% !important;
	margin: 10px !important;
	display: inline-flex;
}

.card-body {
	padding: 0;
	margin: 0;
}

img:hover {
	-webkit-transform: scaleX(-1);
	transform: scaleX(-1);
}
</style>

</head>
<body>

	<c:import url="Header.jsp" />
<div>
	<div id="demo" class="carousel slide" data-ride="carousel" style="margin-top: -30px!important;padding: 0% !important;">

		<!-- Indicators -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>

		<!-- The slideshow -->
		<div class="carousel-inner"style="height: 450px;">
			<div class="carousel-item active " style="height: 450px;" >
				<img src='https://res.cloudinary.com/kishangupta/image/upload/v1569334822/s6quocd8h0nuzf2ujycj.jpg' alt="Los Angeles" style="height: 800px;width: 100%">
			</div>
			<div class="carousel-item"style="height: 450px;">
				<img src='https://res.cloudinary.com/kishangupta/image/upload/v1569337018/qovjrsbu5xaysv4yzm0g.jpg
				' alt="Chicago" style="height: 500px;width: 100%">
			</div>
			<div class="carousel-item" style="height: 450px;">
				<img src='https://res.cloudinary.com/kishangupta/image/upload/v1569337112/jnigd6qxruiz68g8vtrv.jpg
				' alt="New York"  style="height: 500px;width: 100%">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"style="height: 450px;"> <span
			class="carousel-control-prev-icon"style="height: 450px;"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"style="height: 450px;"></span>
		</a>

	</div>
</div>
	<a href="AddProduct.jsp" class="btn btn-link">Add Product</a>


	<c:choose>

		<c:when test="${empty productList}">

			<h1 class="alert alert-danger">No Products in DB</h1>

		</c:when>

		<c:otherwise>


			<hr>

			<c:forEach items="${productList}" var="product">

				<div class="card" style="height: 700px; text-align: center;margin-left: 50px!important;" >
					<!-- <div class="card-header">Header</div> -->
					<div class="card-body">

						<img style="width: 70%; margin: auto;"
							src="${product.getImageUrl()}">

						<h1>${product.getName()}</h1>
						<br>

						<h3 class="badge badge-success">${product.getCategory().getName()}</h3>
						<br>

						<h6>Price: Rs.${product.getPrice()}/-</h6>

						<br>

						<p>${product.getDescription()}</p>

						<h6>
							In Stock: <span class="badge badge-warning"
								style="padding: 10px;">${product.getStockqty()}</span>
						</h6>

					</div>
					<c:if test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
						<div class="card-footer">

							<a href="EditProduct.jsp?id=${product.getId()}"
								class="btn  btn-outline-primary">edit</a> <a
								href="DeleteProductFromDB?id=${product.getId()} "
								class="btn btn-danger">Delete</a>
					</c:if>

					<c:if test="${sessionScope.currentUser.getRole() == 'user'}">

						<form action="AddToCart" method="post">
							<div class="container">
								<div class="row">

									<div class="col-lg-4">
										<input type="number" class="form-control" placeholder="Qty"
											name="quantity"></input>
									</div>

									<div class="col-lg-8">
										<button class="btn btn-primary" style="">
											Add Cart <i class="fas fa-luggage-cart"></i>
										</button>
									</div>


								</div>
								<input type="hidden" name="productId" value="${product.getId()}" />
								<input type="hidden" class="form-control"
									value="${sessionScope.currentUser.getId()}" name="userId"></input>
							</div>


						</form>
				</div>

				</c:if>
				</div>
				</div>


			</c:forEach>


		</c:otherwise>

	</c:choose>



</body>
</html>