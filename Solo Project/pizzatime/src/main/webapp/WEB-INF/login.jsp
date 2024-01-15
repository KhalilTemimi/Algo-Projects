<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css">
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
	<section id="register" class="vh-100" style="background-color: #eee;">
		<div class="container h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Register</p>
									<form:form class="mx-1 mx-md-4" action="/register"
										method="post" modelAttribute="newUser">
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="firstName">First Name : </form:label>
											<form:errors style="color:red" path="firstName" />
											<form:input type="text" path="firstName"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="lastName">Last Name : </form:label>
											<form:errors style="color:red" path="lastName" />
											<form:input type="text" path="lastName"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="adress">Adress : </form:label>
											<form:errors style="color:red" path="adress" />
											<form:input type="text" path="adress"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="email">Email : </form:label>
											<form:errors style="color:red" path="email" />
											<form:input type="text" path="email"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="password">Password : </form:label>
											<form:errors style="color:red" path="password" />
											<form:input type="password" path="password"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="confirmPassword">Confirm Password : </form:label>
											<form:errors style="color:red" path="confirmPassword" />
											<form:input type="password" path="confirmPassword"
												class="form-control form-control-lg" />
										</div>
										<div class="text-center text-lg-start mt-4 pt-2">
											<button type="submit" class="btn btn-primary btn-lg"
												style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</button>
											<p class="small fw-bold mt-2 pt-1 mb-0">
												Have already an account? <a href="#login"
													class="link-danger">Login here</a>
											</p>
										</div>
									</form:form>
								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="login" class="vh-100" style="background-color: #eee;">
		<div class="container h-70">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-lg-12 col-xl-11">
					<div class="card text-black" style="border-radius: 25px;">
						<div class="card-body p-md-5">
							<div class="row justify-content-center">
								<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
									<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Login</p>
									<form:form action="/login" method="post"
										modelAttribute="newLogin">
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="email">Email : </form:label>
											<form:errors style="color:red" path="email" />
											<form:input type="text" path="email"
												class="form-control form-control-lg" />
										</div>
										<div class="form-outline flex-fill mb-0">
											<form:label class="form-label" path="password">Password : </form:label>
											<form:errors style="color:red" path="password" />
											<form:input type="password" path="password"
												class="form-control form-control-lg" />
										</div>
										<div class="text-center text-lg-start mt-4 pt-2">
											<button type="submit" class="btn btn-primary btn-lg"
												style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
											<p class="small fw-bold mt-2 pt-1 mb-0">
												Don't have an account? <a href="#register"
													class="link-danger">Register</a>
											</p>
										</div>
									</form:form>
								</div>
								<div
									class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

									<img
										src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
										class="img-fluid" alt="Sample image">

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
