<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		url("https://images.unsplash.com/photo-1563923084194-878d186c3ff0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1953&q=80");
	height: 100%;
	background-size: cover;
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
<title>Profile Edit</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>


	<!-- Sign Up         ||||       Sign In -->
	<section class="container">
		<div class="row">
			<div class="col">
				<h2 class="tester">
					<span>Edit User</span>
				</h2>
			</div>
		</div>
	</section>

	<section class="mainForms container" id="editProfile">
		<div class="row mt-5 mx-0 mx-md-2 justify-content-center">
			<div class="col-6  bg-light rounded p-3 ">
				<h4 class="tester">Profile Edit</h4>
				<form action="editUser" method="POST">
					<div class="form-group">
						<label for="usernameInput">Username</label> <input type="text"
							class="form-control" id="usernameInput"
							placeholder="Enter Username" name="userName"
							value="${userCurrent.getUserName()}">
					</div>
					<div class="form-group">
						<label for="emailInput">Email</label> <input type="email"
							class="form-control" id="emailInput" placeholder="Enter Email"
							name="userEmail" value="${userCurrent.getUserEmail()}">
					</div>
					<div class="form-group">
						<label for="passwordInput">Password</label> <input type="password"
							class="form-control" id="passwordInput"
							placeholder="Enter Password" name="userPassword"
							value="${userCurrent.getUserPassword()}">
					</div>
					<div class="form-group">
						<label for="passwordInputRecheck">Password</label> <input type="password"
							class="form-control" id="passwordInputRecheck"
							placeholder="Retype Password" 
							value="${userCurrent.getUserPassword()}">
					</div>
					<button class = "btn btn-success" type="submit" value="submit" id="sendButton">Submit</button>
				</form>
				​
			</div>
		</div>
	</section>

	<script>
		var password = document.getElementById("passwordInput"), retype_password = document
				.getElementById("passwordInputRecheck");

		function validatePW() {
			if (password.value != retype_password.value) {
				retype_password.setCustomValidity("Passwords Don't Match");
			} else {
				retype_password.setCustomValidity('');
			}
		}

		password.onchange = validatePW;
		retype_password.onkeyup = validatePW;
	</script>


	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>