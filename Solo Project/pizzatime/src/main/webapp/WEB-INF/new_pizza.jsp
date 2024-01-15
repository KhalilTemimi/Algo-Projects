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
<title>New Order</title>
</head>
<body>
	<div class="container">
		<h1>
			Welcome,
			<c:out value="${user.firstName}" />
			to PIZZA PETE'S
		</h1>
		<a href="/home">Home</a>
		<div class="row">
			<div class="col-12">
				<form:form action="/pizzas" method="POST" modelAttribute="pizza">

					<div class="dropdown">
						<form:label path="method" class="form-label">Method</form:label>
						<form:errors path="method" style="color:red" />
						<form:select path="method">
							<option value="CarryOut">CarryOut</option>
							<option value="OnTable">OnTable</option>
						</form:select>
					</div>
					<div class="dropdown">
						<form:label path="size" class="form-label">Size</form:label>
						<form:errors path="size" style="color:red" />
						<form:select path="size">
							<option value="Small">Small</option>
							<option value="Medium">Medium</option>
							<option value="Large">Large</option>
						</form:select>
					</div>
					<div class="dropdown">
						<form:label path="crust" class="form-label">Crust</form:label>
						<form:errors path="crust" style="color:red" />
						<form:select path="crust">
							<option value="ThinCrust">ThinCrust</option>
							<option value="HandTossed">HandTossed</option>
							<option value="StuffedCrust">StuffedCrust</option>
						</form:select>
					</div>
					<div>
						<form:label path="quantity" class="form-label">Quantity</form:label>
						<form:errors path="quantity" style="color:red" />
						<form:input type="number" path="quantity" />
					</div>
					<div>
						<table>
							<tr>
								<td><form:label path="topping" class="form-label">Topping</form:label></td>
								<td><form:errors path="topping" style="color:red" /></td>
								<td>
									<form:checkbox path="topping" value="Pepperoni" label="Pepperoni"/>
									<form:checkbox path="topping" value="Onion" label="Onion"/>
									<form:checkbox path="topping" value="Cheese" label="Cheese"/>
									<form:checkbox path="topping" value="Bacon" label="Bacon"/>
									<form:checkbox path="topping" value="Olive" label="Olive"/>
									<form:checkbox path="topping" value="Mushroom" label="Mushroom"/>
								</td>
							</tr>
						</table>

					</div>
					<br>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>