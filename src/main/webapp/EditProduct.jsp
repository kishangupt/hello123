
<%@page import="category.CategoryHandler"%>
<%@page import="product.Product"%>
<%@page import="product.ProductHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>

<%
	short id = Short.parseShort(request.getParameter("id"));
	Product p = new ProductHandler().fetchProduct(id);
	request.setAttribute("currPro", p);
%>

<%
	CategoryHandler ch = new CategoryHandler();
	request.setAttribute("catList", ch.fetchAllCategories());
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>

</head>
<body>

	<br>
	<br>

	<h1 style="text-align: center;">Update Product</h1>

	<hr>
	<br>
	<br>

	<form action="EditProductFromDB" method="post">

		<input type="hidden" name="id" value="${currPro.getId()}">

		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Procut Name:-</h4>
				</div>
				<div class="col-lg-8">
					<input name="productname" class="form-control"
						value="${currPro.getName()}" placeholder="Enter Product name here" />
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Procuct Description:-</h4>
				</div>
				<div class="col-lg-8">
					<textarea name="productdescription" class="form-control"
						placeholder="Enter Procuct Discripton here">${currPro.getDescription()}</textarea>
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Procuct Price:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="number" name="price" class="form-control"
						placeholder="Enter Procuct Price here"
						value="${currPro.getPrice()}"></input>
				</div>
			</div>

			<br>
			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Procuct StockQty:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="number" name="stockqty" class="form-control"
						placeholder="Enter Procuct stockqty here"
						value="${currPro.getStockqty()}"></input>
				</div>
			</div>
			<br>

			<c:if test="${not empty catList}">
				<div class="row">
					<div class="col-lg-4">
						<h4>Enter Product Category:-</h4>
					</div>

					<div class="col-lg-8">
						<select class="form-control" name="categoryid">
							<c:forEach items="${catList}" var="c">
								<option value="${c.getId()}" title="${c.getDescription()}"
									<c:if test="${currPro.getCategoryId() == c.getId()}">selected</c:if>>${c.getName()}</option>
							</c:forEach>
						</select>
					</div>
				</div>

			</c:if>


			<br> <br>

			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<button class="btn btn-danger">
						<i class="fas fa-plus-circle"></i> Update
					</button>
				</div>
			</div>
		</div>
	</form>

</body>
</html>
