
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:import url="shared.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<a href="Login.jsp" class="btn-btn-Link">Login Up</a>






<script type="text/javascript">
	function validateName() {

		var name = document.getElementById('name').value;
		var usercheck = /^[A-Za-z. ]{3,40}$/;

		if (usercheck.test(name)) {
			document.getElementById('usererror').innerHTML = " ";
		} else {
			document.getElementById('usererror').innerHTML = " ** user name is Invalid";
			return false;
		}
	}

	function validateEmail() {
		var email = document.getElementById('email').value;
		var checkemail = /^^[A-Za-z]{3,}[0-9]{0,5}@[A-Za-z]{5,8}[.]{1}[A-Za-z]{2,4}$/;

		if (checkemail.test(email)) {
			document.getElementById('emailerror').innerHTML = " ";
		} else {
			document.getElementById('emailerror').innerHTML = " ** Email is Invalid";
			return false;
		}
	}

	function validatePassword() {
		var passwordcheck = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,16}$/;
		var password = document.getElementById('password').value;

		if (passwordcheck.test(password)) {
			document.getElementById('passworderror').innerHTML = " ";
		} else {
			document.getElementById('passworderror').innerHTML = " ** password    is Invalid";
			return false;
		}
	}

	function validateConfirmPwd() {
		var password = document.getElementById('password').value;
		var cpassword = document.getElementById('cpassword').value;

		if (cpassword.match(password)) {
			document.getElementById('conformerror').innerHTML = " ";
		} else {
			document.getElementById('conformerror').innerHTML = " ** password is not match";
			return false;
		}
	}

	function ValidateMobile() {
		var mobilecheck = /^[6789][0-9]{9}$/;
		var phone = document.getElementById('phone').value;

		if (mobilecheck.test(phone)) {
			document.getElementById('phoneerror').innerHTML = " ";
		} else {
			document.getElementById('phoneerror').innerHTML = " ** Phone number is  Invalid";
			return false;
		}

	}
</script>


</head>
<body>

	<br>
	<br>
	<h1 style="text-align: center;">Sign Up</h1>
	<br>
	<br>
	<br>


	<form action="AddUserToDB" method="post" onsubmit="return validation()">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>Name:-</h4>
				</div>
				<div class="col-lg-8">
					<input name="userName" class="form-control"
						onchange="validateName()" placeholder="name" required="true"
						id="name"> <span id="usererror"
						class="text-danger font-weight-bold"></span>
				</div>
			</div>

			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Phone:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="number" name="userPhone" class="form-control"
						onchange="ValidateMobile()" placeholder="phone" required="true"
						maxlength="10" id="phone"></input> <span id="phoneerror"
						class="text-danger font-weight-bold"></span>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Email:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="email" name="userEmail" class="form-control"
						onchange="validateEmail()" placeholder="email" required="true"
						id="email"></input> <span id="emailerror"
						class="text-danger font-weight-bold"></span>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Password:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="password" name="userPassword" class="form-control"
						onchange="validatePassword()" placeholder="password"
						required="true" id="password"></input> <span id="passworderror"
						class="text-danger font-weight-bold"></span>
				</div>
			</div>
			<br>

			<div class="row">
				<div class="col-lg-4">
					<h4>Confirm password:-</h4>
				</div>
				<div class="col-lg-8">
					<input type="password" name="userConfirmPassword"
						class="form-control" onchange="validateConfirmPwd()"
						placeholder="Confirm Password" required="true" id="cpassword"></input>
					<span id="conformerror" class="text-danger font-weight-bold"></span>
				</div>
			</div>
			<br> <br>

			<div class="row">
				<div class="col-lg-12" style="text-align: center;">
					<button class="btn btn-primary">
						<i class="fas fa-plus-circle"></i>Sign Up
					</button>
				</div>
			</div>
		</div>
	</form>


</body>
</html>