<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-image:
		url("https://images.unsplash.com/photo-1564053051381-5cb91813736b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1426&q=80");
	height: 100%;
	background-size: cover;
	background-position: top;
	background-repeat: no-repeat;
	background-color: rgb(45, 51, 51);
}

.custbrand {
	font-family: 'Nunito';
	font-size: 1.5em;
	text-shadow: rgba(0, 0, 0, 0.2);
}

h2 {
	text-align: center;
	font-family: 'Nunito';
	color: rgb(255, 255, 255)
}

.nav-item:hover {
	color: rgb(205, 92, 101);
}
</style>
<title>Sign In</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>


	<!-- Sign Up         ||||       Sign In -->
	<section class="container">
		<div class="row">
			<div class="col">
				<h2 class="tester">
					<span>Existing Account</span>
				</h2>
			</div>
		</div>
	</section>
	
	<%
		if ((request.getAttribute("viewMessage") == null)) {
	%>

	<%
		} else {
	%>
	<section class="container">
		<div class="row justify-content-center">
			<div class="col-3">
				<div class="alert alert-warning text-align-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>${viewMessage}</strong>
				</div>
			</div>
		</div>
	</section>	
	<%
		}
	%>


	<section class="mainForms container">
		<div
			class="row align-items-center mt-5 mx-0 mx-md-2 justify-content-center">
			<div class="col-12 col-md-6 bg-light rounded p-3 ">
				<h4 class="tester">Sign In</h4>
				<form action="profile" method="POST" id="form1" class="my-2">
					<div class="form-group">
						<label for="usernameInput">Username or Email</label> <input
							type="text" class="form-control" id="usernameInput"
							placeholder="Enter Username" name="usernameInput">
					</div>
					<div class="form-group">
						<label for="passwordInput">Password</label> <input type="password"
							class="form-control" id="passwordInput"
							placeholder="Enter Password" name="passwordInput">
					</div>
					<input type="submit" class="btn btn-success"value="submit">
				</form>
				​
			</div>
			<!-- 			<div class="col-12 col-sm-6 bg-light">
				<form action="#" method="POST" id="form2" class="my-2">
					<div class="form-group">
						<label for="emailInput">Email Address</label> <input type="text"
							class="form-control" id="emailInput" placeholder="Enter Email">
					</div>
					<div class="form-group">
						<label for="passwordInput">Password</label> <input type="password"
							class="form-control" id="passwordInput"
							placeholder="Enter Password">
					</div>
					<button type="submit" class="btn btn-info">Submit</button>
				</form>

			</div> -->
		</div>
	</section>




	<!-- 	<form action="myform" method="POST">
		<label>UserName</label> <input type="text" name="username"
			label="username">
		<hr>
		<label>Password</label> <input type="password" name="password"
			label="password">
		<hr>
		<input type="submit" value="submit">
	</form> -->

	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>
