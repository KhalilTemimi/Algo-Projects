<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read share</title>
</head>
<body>
	<div class="container">
		<h1>
			Welcome,
			<c:out value="${user.firstName}" />
			to PIZZA PETE'S
		</h1>
		<a href="/home">Home</a> |
		<a href="/order">Orders (<c:out value="${user.orders.size()}" />)</a> |
		<a href="/edit">Account</a> |
		<a href="/logout">LogOut</a>
		<h3>Your Orders</h3>
		<c:forEach var="order" items="${orders}">
			<!-- 		check if the loggedIn user is the user id of the pizza -->
			<c:if test="${order.user.id==user.id}">
				<c:if test="${order.buyer.id!=user.id}">
				<div class="card" style="width: 18rem;">
					<div class="card-body">
						<h5 class="card-title">Your Order</h5>
						<p class="card-text">Method:<c:out value="${order.method}"/></p>
						<p class="card-text">Quantity: <c:out value="${order.quantity}" /></p>
						<p class="card-text">Size: <c:out value="${order.size}" /></p>
						<p class="card-text">Crust:<c:out value="${order.crust}" /></p>
						<p class="card-text">Topping:<c:out value="${order.topping}" /></p>
						<h6 class="card-text-right">Price: $<c:out value="${order.price}" /></h6>
						<a href="/pizzas/startOver/${order.id}" class="btn btn-danger btn-lg btn-block">Start Over</a> 
						<a href="/purchase/${order.id}" class="btn btn-success btn-lg btn-block">Purchase</a>
					</div>
				</div>
				</c:if>
			</c:if>
		</c:forEach>
		<br>
	</div>
</body>
</html>
