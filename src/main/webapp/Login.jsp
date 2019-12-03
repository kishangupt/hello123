<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<c:import url="shared.jsp"></c:import>
<c:import url="Header.jsp"></c:import>	
<style type="text/css">
#myHeader {
  background-color: lightblue;
  color: black;
  padding: 40px;
  text-align: center;
} 
</style>



</head>
<body>

	<br>
	<br>

	<h1 id="myHeader">Login Page</h1>

	<hr>
	<br>
	<br>

	<form action="CheckLogin" method="post">
		<div class="container">
			
			
			

			<div class="row">
				<div class="col-lg-4">
					<h4>Email:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="email" name="userEmail" class="form-control"
						placeholder="email" required="true"></input>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Password:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="password" name="userPassword" class="form-control"
						placeholder="password" required="true"></input>
				</div>
			</div>
			<br>

		<!--	<div class="row">
				<div class="col-lg-4">
					<h4>Confirm password:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="password" name="userConfirmPassword"
						class="form-control" placeholder="Confirm Password"
						required="true"></input>
				</div>
			</div>
			<br>-->

			 			<br>

			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<button  class="btn btn-primary" >
						<i class="fas fa-plus-circle"></i>Submit
					</button>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>