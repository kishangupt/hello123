
<style>
#n{
background-color: #9bd1d1!important;
margin: -10px!important;
padding: 0px!important;
}
#kishan{
font-size: 40px;

}

</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav style="height: 1.5cm; width: 100%"
	class="navbar navbar-expand-sm  navbar-light" id="n">
	<!-- Brand -->



	<c:if test="${not empty sessionScope.currentUser}">
		<a class="navbar-brand" href="#">
		<i class="fas fa-user-secret" id="kishan"></i>
			${sessionScope.currentUser.getEmail()}</a>

	</c:if>
	<c:if test="${ empty sessionScope.currentUser}">
		<a class="btn-outline-primary" href="Login.jsp">Login</a>
		<a class="btn-outline-primary" href="AddUser.jsp">Sign Up</a>
	</c:if>

	<div class="collapse navbar-collapse" id="myNavbar">




		<!-- Links -->
		<ul class="navbar-nav">
			<c:if test="${not empty sessionScope.currentUser}">
				<li class="nav-item"><a class="nav-link" href="#">About Us</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact
						Us</a></li>
				<!-- Dropdown -->
			</c:if>
			<c:if test="${sessionScope.currentUser.getRole() == 'user'}">
				<li class="nav-item"><a class="nav-link" href="ViewCart.jsp"><i
						class="fas fa-luggage-cart"></i></a></li>
			</c:if>

			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Category </a>
				</c:if>
				<div class="dropdown-menu">
					<c:if test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
						<a class="dropdown-item" href="ViewCategory.jsp">View
							Categories</a>
						<a class="dropdown-item" href="AddCategory.jsp">Add Category</a>
					</c:if>
				</div></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbardrop"
				data-toggle="dropdown"> Product </a>
				<div class="dropdown-menu">
					<c:if test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
						<a class="dropdown-item" href="AddProduct.jsp">Add Product</a>
					</c:if>
					<a class="dropdown-item" href="ViewProduct.jsp">View Product</a>
				</div></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Image </a>
				</c:if>
				<div class="dropdown-menu">


					<a class="dropdown-item" href="AddImageToBank.jsp">Add Image</a> <a
						class="dropdown-item" href="ViewImageBank.jsp">View Image</a>

				</div></li>

			<!-- Dropdown -->
			<li class="nav-item dropdown"><c:if
					test="${sessionScope.currentUser.getRole() == 'ADMIN'}">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> User </a>
				</c:if>
				<div class="dropdown-menu">

					<a class="dropdown-item" href="ViewUser.jsp">View User</a> 	
					
				</div></li>




		</ul>
	</div>
	
	<c:if test="${not empty sessionScope.currentUser}">
	<div >
	<a class="btn btn-deafult btn-sm" href="Logout">LogOut<i class="fas fa-sign-out-alt"></i></a>
	
	</div>
	</c:if>
</nav>
