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
<title>Organization Landing Page</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<section class="container pt-0 pt-md-5">
		<div class="row justify-content-center">
			<div class="col-10 my-2">

				<div class="card">
					<div class="card-body">
						<c:choose>

							<c:when test="${userCurrent==null}">
								<h4 class="card-title">Can't create charity account without
									logging in!</h4>
								<p>
									<a class="btn btn-info"
										href="${pageContext.request.contextPath}/registration">Register</a>
									<a class="btn btn-info"
										href="${pageContext.request.contextPath}/signin">Sign In</a>
								</p>


							</c:when>
							<c:otherwise>
								<h4 class="card-title">Charity - Join Impact</h4>
								<form action="regOrg" method="POST">
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="charityName">Charity Name</label> <input
												type="text" class="form-control" id="inputName"
												placeholder="Charity Name" name="charityName">
										</div>
										<div class="form-group col-md-6">
											<label for="inputCat">Category</label> <select id="inputCat"
												class="form-control" name="category">
												<c:forEach items="${listOfCategories}" var="item">
													<option>${item.getCatName()}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="inputWeb">Charity Website</label> <input
												type="text" class="form-control" id="inputWeb"
												pattern="www.+" name="charityWeb"
												placeholder="www.examplecharity.com" required>
										</div>
										<div class="form-group col-md-6">
											<label for="inputImpact">Charity Impact</label> <input
												type="text" class="form-control" id="inputImpact"
												name="charityImpact"
												placeholder="Every 100 dollars we receive goes towards..."
												required>
										</div>

									</div>
									<button type="submit" class="btn btn-primary">Register</button>
								</form>


							</c:otherwise>






						</c:choose>


					</div>
				</div>


			</div>

		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>

</body>
</html>