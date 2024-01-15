<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/static/css/style.css">
<!-- handling form and errors -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>
</head>
<body>
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<div class="container">
		<h1>Edit User Page</h1>
		<a href="/home">Home</a>
		<div class="row">
			<div class="col-sm-6">
				<h1>Account Info</h1>
				<form:form action="/users" method="POST" modelAttribute="user">
					<input type="hidden" name="_method" value="put">
					<div class="mb-3">
						<form:label path="firstName" class="form-label">First Name</form:label>
						<form:errors path="firstName" style="color:red" />
						<form:input type="text" path="firstName" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="lastName" class="form-label">Last Name</form:label>
						<form:errors path="lastName" style="color:red" />
						<form:input type="text" path="lastName" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="adress" class="form-label">Adress</form:label>
						<form:errors path="adress" style="color:red" />
						<form:input type="text" path="adress" class="form-control" />
					</div>
					<div class="mb-3">
						<form:label path="email" class="form-label">Email</form:label>
						<form:errors path="email" style="color:red" />
						<form:input type="text" path="email" class="form-control" />
					</div>
					<div class="mb-3">
						<form:input type="hidden" path="password" value="${user.password}" />
					</div>
					<div class="mb-3">
						<form:input type="hidden" path="confirmPassword"
							value="${user.password}" />
					</div>

					<button type="submit" class="btn btn-primary">update</button>

				</form:form>
			</div>
			<div class="col-sm-6">
				<h1>Past Orders</h1>
				<ul>
					<c:forEach var="order" items="${user.pastOrders}">
						<div class="card" style="width: 18rem;">
							<div class="card-body">
								<p class="card-text">
									<c:out value="${order.createdAt}" />
								</p>
								<p class="card-text">
									<c:out value="${order.size}" />
									-
									<c:out value="${order.topping}" /></p>
								<p class="card-text">$ <c:out value="${order.price}" />
								</p>
								<p class="card-text">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="defaultChek1"> 
									<label class="form-check-label" for="defaultCheck1">Favorite</label>
								</div>
								</p>
							</div>
						</div>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>