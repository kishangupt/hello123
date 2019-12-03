<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

	<br>
	<br>

	<h1 style="text-align: center;">Add Category</h1>

	<hr>
	<br>
	<br>

	<form action="AddCategoryToDB" method="post">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Category Name:-</h4>
				</div>
				<div class="col-lg-8">
					<input name="categoryName" class="form-control"
						placeholder="Enter Category here">
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Enter Category Description:-</h4>
				</div>
				<div class="col-lg-8">
					<textarea name="categoryDescription" class="form-control"
						placeholder="Enter Category Discription here"></textarea>
				</div>
			</div>

			<br> <br>

			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<button class="btn btn-danger">
						<i class="fas fa-plus-circle"></i> Add
					</button>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>