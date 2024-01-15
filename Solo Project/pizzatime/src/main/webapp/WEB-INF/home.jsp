<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- handling form and errors -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="container">
		<h1>
			Welcome,
			<c:out value="${user.firstName}" />
			to PIZZA PETE'S
		</h1>
		<a href="/logout">LogOut</a> |
		<a href="/order">Orders (<c:out value="${user.orders.size()}" />)</a> |
		<a href="/edit">Account</a>
		<div>
		<br>
			<div class="row">
				<div class="col-sm-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">Feel free to compose your personal pizza</h5>
							<a href="/pizzas/new" class="btn btn-primary">New Order</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">You already love it last time, re-order it</h5>
							<a href="#" class="btn btn-primary">Re-Order</a>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card text-center">
						<div class="card-body">
							<h5 class="card-title">You don't know what to choose let us surprise you, you'll never regret it.</h5>
							<form:form action="/pizzaRandom" method="POST">
							<button type="submit" class="btn btn-primary">Surprise Me</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>
