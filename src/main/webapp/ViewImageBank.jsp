
<%@page import="imagesbank.ImageBankHandler"%>

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
	ImageBankHandler ibh = new ImageBankHandler();

	request.setAttribute("imageList", ibh.fetchAllImagesInBank());
%>

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
</style>

</head>
<body>

	<c:import url="Header.jsp" />

	<br>
	<br>

	<h1>Current Images</h1>


	<c:if test="${not empty msg}">
		<h4 class="alert alert-danger">
			<i class="fas fa-exclamation-triangle"></i>${msg}</h4>
	</c:if>

	<br>
	<a href="AddImageToBank.jsp" class="btn btn-link">Add Image To Bank</a>


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
						<%-- <a href="EditImage.jsp?id=${image.getId()} "
							class="btn  btn-outline-primary">edit</a>
						 --%>	
							 <a
							href="DeleteImageFromBank?id=${image.getId()}"
							class="btn btn-danger" style=" text-align: center;">Delete</a>

					</div>
				</div>

			</c:forEach>


		</c:otherwise>

	</c:choose>



</body>
</html>