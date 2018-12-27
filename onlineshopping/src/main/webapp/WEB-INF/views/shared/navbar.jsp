<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">Online Shopping</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav mr-auto">

				<li id="listProducts" class="nav-item">
					<a class="nav-link" href="${contextRoot}/show/all/products">View Products</a>
				</li>
				<li id="contact" class="nav-item">
					<a class="nav-link" href="${contextRoot}/contact">Contact</a>
				</li>
				<li id="about" class="nav-item">
					<a class="nav-link" href="${contextRoot}/about">About</a>
				</li>
				<security:authorize access="hasAuthority('ADMIN')">
					<li id="manageProducts" class="nav-item">
						<a class="nav-link" href="${contextRoot}/manage/products">Manage Products</a>
					</li>
				</security:authorize>
			</ul>
			<ul class="navbar-nav">
			
				<security:authorize access="isAnonymous()">
				<li id="register" class="nav-item">
					<a class="nav-link" href="${contextRoot}/register">Sign Up</a>
				<li id="login" class="nav-item">
					<a class="nav-link" href="${contextRoot}/login">Login</a>
				</li>
				</security:authorize>
				
				<security:authorize access="isAuthenticated()">
				<li  class="dropdown" id="userCart">
					<a href="javascript:void(0)" class="btn btn-default dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
					${userModel.fullName} <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					
						<security:authorize access="hasAuthority('USER')">
							<li>
								<a class="dropdown-item" href="${contextRoot}/cart/show">
									<span class="fas fa-shopping-cart"></span>
									<span class="badge badge-light">${userModel.cart.cartLines}</span> ${userModel.cart.grandTotal} PLN
								</a>
							</li>
							<li class="dropdown-divider" role="separator"></li>
						</security:authorize>
						
						<li>
							<a class="dropdown-item" href="${contextRoot}/perform-logout">Logout</a>
						</li>
					</ul>
				</li>
				</security:authorize>
			</ul>
		</div>
	</div>
</nav>

<script>
	window.userRole = '${userModel.role}';
</script>
