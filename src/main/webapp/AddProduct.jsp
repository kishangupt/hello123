<%@page import="imagesbank.ImageBankHandler"%>

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
	CategoryHandler ch = new CategoryHandler();
	request.setAttribute("catList", ch.fetchAllCategories());

	ImageBankHandler ibh = new ImageBankHandler();
	request.setAttribute("imageList", ibh.fetchAllImagesInBank());
%>
	<c:import url="Header.jsp" />

	<style type="text/css">
	.card {
	width: 33% !important;
	margin: 20px !important;
	display: inline-flex;
}

img {
	width: 100% !important;
	margin: 0;
}

.card-body {
	padding: 0;
}

.imageForDisplay{
	display: none;
	margin: auto;
	width: 80% !important;
	margin-top: 20px;
	
}

</style>

	
</head>
<body>


<script type="text/javascript">

	var setImage = function(id,url){
		
		//alert(id + ", " + url)
		
		$("#imageSelectionModal").modal("hide");
		
		$("input[name='productImageId']").val(id)
		
		$(".imageForDisplay").attr('src', url);
		$(".imageForDisplay").show("fast")
	}

</script>


	<!-- The Modal -->
	<div class="modal fade" id="imageSelectionModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Choose Image</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">

					<c:choose>

						<c:when test="${empty imageList}">

							<h1 class="alert alert-danger">No Images in Bank</h1>

						</c:when>

						<c:otherwise>


							<hr>

							<c:forEach items="${imageList}" var="image">

								<div class="card">
									<!-- <div class="card-header">Header</div> -->
									<div class="card-body">

										<img src="${image.getUrl()}">

									</div>
									<div class="card-footer">

										<a href="#" onclick="setImage(${image.getId()},'${image.getUrl()}')" class="btn btn-danger">Choose</a>

									</div>
								</div>

							</c:forEach>


						</c:otherwise>

					</c:choose>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>


	<br>
	<br>

	<h1>Add Product</h1>

	<hr>

	<form action="AddProductToDB" method="post">

		<input type="hidden" name="productImageId">

		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Product Name:</h4>
				</div>
				<div class="col-lg-8">
					<input name="productName" class="form-control"
						placeholder="Enter Product Name">
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Product Description:</h4>
				</div>
				<div class="col-lg-8">
					<textarea name="productDescription"
						placeholder="Enter Product Description" rows="" cols=""
						class="form-control"></textarea>
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Product Price:</h4>
				</div>
				<div class="col-lg-8">
					<input type="number" name="productPrice" class="form-control"
						placeholder="Enter Product Price">
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Product Stock Qty:</h4>
				</div>
				<div class="col-lg-8">
					<input type="number" name="productStockQty" class="form-control"
						placeholder="Enter Product Stock Qty">
				</div>
			</div>

			<br>
			<div style="margin: auto; width: 100%; text-align: center;">
				<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#imageSelectionModal">Select Image</button>
			
				<br>
				<img class="img imageForDisplay">
			
			</div>
			
			
			<br>
			<br>


			<c:if test="${not empty catList}">
				<div class="row">
					<div class="col-lg-4">
						<h4>Enter Product Product:</h4>
					</div>
					<div class="col-lg-8">
						<select class="form-control" name="productCategoryId">
							<c:forEach items="${catList}" var="c">
								<option value="${c.getId()}" title="${c.getDescription()}">${c.getName()}</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</c:if>


			<br> <br> <br>

			<c:choose>

				<c:when test="${not empty catList}">

					<div class="row">
						<div class="col-lg-12" style="text-align: center;">
							<button class="btn btn-danger">
								<i class="fas fa-plus"></i> Add
							</button>
						</div>
					</div>

				</c:when>

				<c:otherwise>

					<div class="row">
						<h1 class="alert alert-danger">Please Add Categories into
							System to Add Products</h1>
					</div>
				</c:otherwise>

			</c:choose>

		</div>

	</form>

</body>
</html>