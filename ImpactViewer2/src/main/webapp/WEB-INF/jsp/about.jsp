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
		url("https://images.unsplash.com/photo-1563985336376-568060942b80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2110&q=80");
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
</style>
<title>About</title>
</head>
<body>


	<jsp:include page="nav.jsp"></jsp:include>

	<section
		class="container justify-content-center align-items-center p-3 p-sm-6 p-md-9 p-lg-12">
		<div class="row">
			<div class="col">
				<div class="card bg-dark text-white m-3 m-sm-6 m-md-9 m-lg-12">
					<div class="card-body">
						<h2 class="card-title">A big thanks...</h2>
						<div class="card-text row justify-content-center">
						    <ul class="col-6">
							  <li>To the team at <a href="http://www.perscholas.org">Per Scholas </a></li>
							  <li>To <a href="http://www.unsplashed.com">Unsplashed</a> for the photos used in this project</li>
							  <li>To Manuel Pinto for the animated bg <a href="https://manuelpinto.in">(manuelpinto.in)</a></li>
							  <li>To <a href="https://topnonprofits.com/lists/types-of-charities/">topnonprofits.com</a> for the 6 types of charity categories</li>
							  <li>To <a href="https://stackoverflow.com">Stack Overflow</a> and its community for answering all my questions</li>
							</ul>
							
						</div>
						
						<br>

					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>
