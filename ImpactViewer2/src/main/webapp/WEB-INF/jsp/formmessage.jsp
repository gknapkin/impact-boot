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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
body {
	background-image:
		url("https://images.unsplash.com/photo-1564369790710-671d2a07d5da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2128&q=80");
	height: 100%;
	background-size: stretch;
	background-position: center;
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
<title>Profile</title>

<c:choose>
	<c:when test="${userCurrent==null}">
		<c:redirect context="index.jsp"></c:redirect>
	</c:when>
</c:choose>



</head>
<body>


	<jsp:include page="nav.jsp"></jsp:include>


	<!-- Sign Up         ||||       Sign In -->
	<section class="container">
		<div class="row">
			<div class="col">
				<h2 class="tester">
					<span>Charity Impact Transparency</span>
				</h2>
			</div>
		</div>
	</section>

	<section class="container">
		<div class="row m-1 p-1">
			<div class="col-12 col-md-6 col-lg-4">
				<div class="card m-1">
					<div class="card-body">
						<h5 class="card-title">User: ${userCurrent.getUserName()}</h5>
						<p class="card-text">
							Email: ${userCurrent.getUserEmail()} <br>User Since:
							${userCurrent.getJoinDateFormatted()}
						</p>
						<a class="btn btn-info"
							href="profileedit">Edit
							Profile</a>

					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 col-lg-8">

				<div>
					<div class="card m-1">
						<div class="card-body">
							<%
								if ((request.getAttribute("reviewsList").toString().length() != 2)) {
							%>


							<c:forEach items="${reviewsList}" var="item">
								<h5 class="card-title">Charity: <a href="${pageContext.request.contextPath}/charity/${item.charity.charityName}">${item.charity.charityName}</a></h5>
								<p class="card-text">
									Rating: ${item.getRating()}<br>Date:
									${item.getReviewDateFormatted()}<br>Comment: ${item.getComment()}
								</p>
								<form action="deleteReview" method="POST">
									<button class = "btn btn-danger" name="reviewId" type="submit"
										value="${item.getReviewId()}">Delete Review</button>
								</form>

								<hr>
							</c:forEach>

							<%
								} else {
							%>
							<h5 class="card-title">Start rating charities!</h5>
							<p class="card-text">No Comments Yet!</p>
							<a class="btn btn-info"
								href="allcat">Find a
								Charity</a>
							<%
								}
							%>

						</div>

					</div>
				</div>

			</div>

		</div>
	</section>

	<%
		if ((request.getAttribute("message") == null)) {
	%>

	<%
		} else {
	%>
	<section class="container">
		<div class="row justify-content-center">
			<div class="col-3">
				<div class="alert alert-warning text-align-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>${message}</strong>
				</div>
			</div>
		</div>
	</section>
	<%
		}
	%>


	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>