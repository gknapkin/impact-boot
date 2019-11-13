<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		url("https://images.unsplash.com/photo-1531206715517-5c0ba140b2b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
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
<title>Charities</title>
</head>
<body>


	<jsp:include page="nav.jsp"></jsp:include>


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
		<div class="row">





			<%
				/* if (request.getAttribute("listOfCharities").toString().length() != 6) { */
					if (request.getAttribute("listOfCharities")!=null){
			%>
			<c:forEach items="${listOfCharities}" var="item">
				<div class="col-12 col-md-3">
					<div class="card">
						<div class="card-body">

							<h5 class="card-title">
							
								Charity: ${item.getCharityName()}<br>
								<%--Rating:
								  ${item.getCharityRating()}--%>
							</h5>
							<p class="card-text">${item.getCharityImpact()}</p>
							<a
								href="${pageContext.request.contextPath}/charity/${item.getCharityName()}"
								class="btn btn-primary">See charity profile</a>

						</div>
					</div>
				</div>
			</c:forEach>
			<%
				} else {
			%>
			<div class="col-12 col-md-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">No Charities in this Category yet!</h5>
						<p class="card-text">Let's change that!</p>
						<a href="organization"
							class="btn btn-primary">Create new Org</a>
					</div>
				</div>
			</div>
			<%
				}
			%>



		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

		<jsp:include page="ajjqboot.jsp"></jsp:include>

</body>
</html>