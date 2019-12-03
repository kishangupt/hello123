<%@page import="cart.CartHandler"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>

<style type="text/css">
.row {
display: -ms-flexbox; /* IE10 */
display: flex;
-ms-flex-wrap: wrap; /* IE10 */
flex-wrap: wrap;
margin: 0 -16px;
}

.col-25 {
-ms-flex: 25%; /* IE10 */
flex: 25%;
}

.col-50 {
-ms-flex: 50%; /* IE10 */
flex: 50%;
}

.col-75 {
-ms-flex: 75%; /* IE10 */
flex: 75%;
}

.col-25, .col-50, .col-75 {
padding: 0 16px;
}

.container {
background-color: #f2f2f2;
padding: 5px 20px 15px 20px;
border: 1px solid lightgrey;
border-radius: 3px;
}

input[type=text] {
width: 100%;
margin-bottom: 20px;
padding: 12px;
border: 1px solid #ccc;
border-radius: 3px;
}

label {
margin-bottom: 10px;
display: block;
}

.icon-container {
margin-bottom: 20px;
padding: 7px 0;
font-size: 24px;
}

.btn {
background-color: #4CAF50;
color: white;
padding: 12px;
margin: 10px 0;
border: none;
width: 100%;
border-radius: 3px;
cursor: pointer;
font-size: 17px;
}

.btn:hover {
background-color: #45a049;
}

span.price {
float: right;
color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
.row {
flex-direction: column-reverse;
}
.col-25 {
margin-bottom: 20px;
}
}
</style>

<%
User u = (User) request.getSession().getAttribute("currentUser");
%>
<c:import url="shared.jsp" />



<%
CartHandler uh = new CartHandler();
request.setAttribute("CList", uh.fetchAllCartItemsForUser(u.getId()));
%>
</head>
<body>


<div class="row" style="padding-top: 6% !important;">
<div class="col-75">
<div class="container">
<form action="/action_page.php">

<!-- <div class="row">
<div class="col-50">
<h3>Billing Address</h3>
<label for="fname"><i class="fa fa-user"></i> Full Name</label> <input
type="text" id="fname" name="firstname"
placeholder="John M. Doe"> <label for="email"><i
class="fa fa-envelope"></i> Email</label> <input type="text" id="email"
name="email" placeholder="john@example.com"> <label
for="adr"><i class="fa fa-address-card-o"></i> Address</label> <input
type="text" id="adr" name="address"
placeholder="542 W. 15th Street"> <label for="city"><i
class="fa fa-institution"></i> City</label> <input type="text" id="city"
name="city" placeholder="New York">

<div class="row">
<div class="col-50">
<label for="state">State</label> <input type="text" id="state"
name="state" placeholder="NY">
</div>
<div class="col-50">
<label for="zip">Zip</label> <input type="text" id="zip"
name="zip" placeholder="10001">
</div>
</div>
</div>
 -->
<div class="col-50">
<h3>Payment</h3>
<label for="fname">Accepted Cards</label>
<div class="icon-container">
<i class="fab fa-cc-visa" style="color: navy;"></i> <i
class="fab fa-cc-amex" style="color: blue;"></i> <i
class="fab fa-cc-discover" style="color: orange;"></i> <i
class="fab fa-cc-mastercard" style="color: red;"></i>
</div>
<label for="cname">Name on Card</label> <input type="text"
id="cname" name="cardname" placeholder="Arjun Rawat"> <label
for="ccnum">Credit card number</label> <input type="text"
id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
<label for="expmonth">Exp Month</label> <input type="text"
id="expmonth" name="expmonth" placeholder="September">

<div class="row">
<div class="col-50">
<label for="expyear">Exp Year</label> <input type="text"
id="expyear" name="expyear" placeholder="2018">
</div>
<div class="col-50">
<label for="cvv">CVV</label> <input type="text" id="cvv"
name="cvv" placeholder="352">
</div>
</div>
</div>
</form>
</div>
</div>
</div>
<!-- <label> <input type="checkbox" checked="checked"
name="sameadr"> Shipping address same as billing
</label> -->
<br>
<br>
<div class="container" style="background-color: none !important">
<a class="btn btn-success"
href="DestroyUserCart?userId=${sessionScope.currentUser.getId()}">
<i class="far fa-credit-card"></i>&nbsp;Continue to Pay
</a>
</div>



</body>
</html>
