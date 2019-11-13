<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://fonts.googleapis.com/css?family=Nunito&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Darker+Grotesque&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/60d7e418a1.js"></script>

<style>
body {
	background-image:
		url(https://images.unsplash.com/photo-1508796079212-a4b83cbf734d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80);
	background-size: cover;
	background-repeat: no-repeat;
	background-color: rgb(45, 51, 51);
	font-family: 'Nunito';
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

.blurb {
	font-family: 'Darker Grotesque', sans-serif;
	font-size: 1.2em;
}

.jumbotron {
	margin: 0;
	width: 100%;
	height: 100vh;
	color: #fff;
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradientBG 15s ease infinite;
}

@media only screen and (max-width: 768px) {
	.jumbotron {
		background-size: 100%;
		width: 100%;
		height: 100%;
	}
	#animatedContainer {
		width: 100%;
		position: relative;
		text-align: top;
	}
}

@
keyframes gradientBG { 0% {
	background-position: 0% 50%;
}

50%{
background-position
:
100%
 
50%;
}
100%{
background-position
:
0%
 
50%;
}
}
#animatedContainer {
	width: 100%;
	position: relative;
	top: 25%;
	text-align: center;
}
</style>
<title>Impact</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<section class="jumbotron jumbotron-fluid d-md-block">
		<div class="container d-md-block" id="animatedContainer">
			<div class="row d-block d-md-inline">
				<div class="col">
					<span class="display-3 d-none d-md-inline"> This is... </span> <span
						class="display-2 d-none d-md-inline"
						style="text-shadow: 2px 2px 4px #000000;"><strong>Impact</strong></span>
				</div>

				<p class="lead d-none d-md-block">The platform for finding
					causes with transparent results</p>
				<div class="row justify-content-center mt-md-5 ">
					<div
						class="col-10 col-md-6 blurb mb-5 mt-md-5 align-items-stretch d-flex">
						<div class="card bg-transparent border-dark text-light">
							<div class="card-body">

								<h2 class="card-title">For those seeking...</h2>
								<p class="card-text">Impact is a project and platform for
									charities to be transparent with their donations, and a way for
									users to discover new causes. Come find a new mission, or let
									others know about your favorite cause.</p>
								<a href="allcat"
									class="btn btn-primary">Find a Cause</a>

							</div>
						</div>
					</div>
					<div
						class="col-10 col-md-6 blurb mb-5 mt-md-5 align-items-stretch d-flex">
						<div class="card bg-transparent border-dark text-light">
							<div class="card-body">
								<h2 class="card-title">For organizations...</h2>
								<p class="card-text">Make a statement. Let the world know
									what your organization hopes to achieve with every donation,
									and let your mission reach a broader, more curious audience.</p>
								<a href="organization"
									class="btn btn-primary">Join Impact</a>


							</div>
						</div>
					</div>
				</div>

			</div>
		</div>

	</section>




	<section class="container-fluid bg-light  pt-3 pt-md-5">
		<div class="row justify-content-center text-center">
			<div class="col-10 col-md-4">
				<h5>Most Recent Reviews</h5>
			</div>
		</div>


		<div class="row  justify-content-center">
			<%
		if ((request.getAttribute("lastReviews").toString().length() != 2)) { 
				/* if ((request.getAttribute("lastReviews")!= null)) { */
			%>
			<c:forEach items="${lastReviews}" var="item">
				<div class="col-12 col-sm-6 col-md-4 ">
					<div class="card border-dark text-dark m-1 p-2 rounded">
						<h5 class="card-title">Charity: ${item.charity.charityName}</h5>
						<p class="card-text">
							User: ${item.user.userName}<br>Rating: ${item.getRating()}<br>Date:
							${item.getReviewDateFormatted()}<br>Comment:
							${item.getComment()}
						</p>
					</div>
				</div>
			</c:forEach>
			<%
				} else {
			%>
			<div class="col-10">
				<div class="card bg-dark text-white p-2  align-items-center">
					<h5 class="card-title">Start rating charities!</h5>
					<p class="card-text">No Comments Yet!</p>
				</div>
			</div>
			<%
				}
			%>


		</div>

		<br> <br>
	</section>



	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>
