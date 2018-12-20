<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Online Shopping - ${title}</title>

<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap dataTable -->
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css"
	integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">




</head>

<body>
	<div class="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
			role="navigation">
			<div class="container">
				<div class="navbar-header">
					<a class="navbar-brand" href="${contextRoot}/home">Online
						Shopping</a>
				</div>
			</div>
		</nav>

		<!-- Page Content -->
		<div class="container">
		
		<%-- this will be display if credentials are wrong --%>
		<c:if test="${not empty message}">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="alert alert-danger">${message}</div>
				</div>
			</div>
			
		</c:if>
		
		<%-- this will be display when user logged out --%>
		<c:if test="${not empty logout}">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="alert alert-success">${logout}</div>
				</div>
			</div>
			
		</c:if>
		
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header bg-primary text-white">
							<h4>Login</h4>
						</div>
						</br>
						<div class="card-block">
							<form action="${contextRoot}/login" method="POST"
								class="form-horizontal" id="loginForm">

								<div class="form-group ">
									<label class="control-label col-md-4" for="username"><strong>Email:</strong>
									</label>
									<div class="col-md-11">
										<input type="text" name="username" id="username"
											class="form-control" />
									</div>
								</div>

								<div class="form-group ">
									<label class="control-label col-md-4" for="password"><strong>Password:</strong>
									</label>
									<div class="col-md-11">
										<input type="password" name="password" id="password"
											class="form-control" />
									</div>
								</div>

								<div class="form-group ">
									<div class="col-3 mx-auto">
										<div class="text-center">
											<input type="submit"  value="login" class="btn btn-primary"/>
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										</div>
									</div>
								</div>

							</form>
						</div>
						<div class="card-footer">			
								<div class="text-right">
									New User - <a href="${contextRoot}/register">Register Here</a>
								</div>
							</div>
					</div>
				</div>

			</div>
	</div>
			<!-- /.container -->

			<!-- Footer -->
			<%@include file="./shared/footer.jsp"%>

			<!-- Bootstrap core JavaScript -->
			<script src="${js}/jquery.js"></script>
			<!--  JQuery validation -->
			<script src="${js}/jquery.validate.js"></script>

			<script src="${js}/bootstrap.bundle.min.js"></script>





			<script src="${js}/myapp.js"></script>


		</div>
</body>

</html>
