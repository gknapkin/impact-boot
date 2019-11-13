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
<title>${charityCurrent.charityName}</title>
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
			<div class="col-12 col-md-6 col-lg-3">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">${charityCurrent.charityName}</h5>
						<p class="card-text">
						<div>Category: ${charityCurrent.category.catName}</div>
						<div>Rating: ${charityRating != null ? charityRating : "0"}</div>
						<div>
							Website: <a href="http://${charityCurrent.charityWeb}">${charityCurrent.charityWeb}</a>
						</div>
						<div>Admin: ${charityCurrent.user.getUserName()}</div>
						<div>Impact: ${charityCurrent.charityImpact}</div>

						<c:choose>
							<c:when test="${userCurrent.getUserId()==charAdmin}">
								<form action="impactviewer/charity/editOrg" method="POST">
									<button class="btn btn-danger" name="charity" type="submit"
										value="${charityCurrent.charityId}">Edit Charity</button>
								</form>
							</c:when>
						</c:choose>



						<br>




					</div>
				</div>


				<c:choose>
					<c:when test="${userCurrent.getUserId()==charAdmin}">
						<div class="card mt-2">
							<div class="card-body">
								<h5 class="card-title">${charityCurrent.charityName}
									Statistics</h5>
								<p class="card-text">
								<div>Number of Reviews: ${charityReviews != null ? charityReviews.size() : "0"}</div>

							</div>
						</div>
					</c:when>
				</c:choose>



				<br>





			</div>
			<div class="col-12 col-md-6 col-lg-9">
			


				<c:forEach items="${charityReviews}" var="item">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Reviewer: ${item.getUser().userName}</h5>
							<h5 class="card-title">Rating: ${item.getRating()}</h5>
							<h5 class="card-title">Date:
								${item.getReviewDateFormatted()}</h5>
							<p class="card-text">Comment: ${item.getComment()}</p>
						</div>
					</div>
				</c:forEach>

				<div>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Leave Review</h5>

							<c:choose>
								<c:when test="${userCurrent == null}">
									<p>Log In or Register to Leave Review</p>
									<a class="btn btn-info"
										href="${pageContext.request.contextPath}/registration">Register</a>
									<a class="btn btn-info"
										href="${pageContext.request.contextPath}/signin">Sign In</a>
								</c:when>

								<c:when test="${userCurrent.getUserId()==charAdmin}">

								</c:when>

								<c:otherwise>
									<section class="mainForms container" id="leaveReview">
										<div class="col  bg-light rounded p-3 ">














											<form
												action="${pageContext.request.contextPath}/charity/leaveReview"
												method="POST">
												<div class="form-group">
													<label for="user">Reviewer: ${userCurrent.userName}</label>
													<input type="hidden" id="user" name="user"
														value="${userCurrent}"
														placeholder="${userCurrent.userName}" disabled>
												</div>
												<div class="form-group">
													<label for="charity">Charity:
														${charityCurrent.charityName}</label> <input type="hidden"
														id="charity" name="charity"
														value="${charityCurrent.charityName}">
												</div>
												<div class="form-group">
													<label for="rating">Rating (1-5):</label> <input
														type="number" id="rating" name="rating" min="1" max="5">
												</div>
												<div class="form-group">
													<label for="comment">Comment:</label> <input type="text"
														class="form-control" id="comment"
														placeholder="Enter Comment" name="comment">
												</div>
												<button type="submit" value="submit" id="sendButton">Submit</button>
											</form>
											​
										</div>

									</section>
								</c:otherwise>



							</c:choose>


						</div>
					</div>
				</div>







			</div>
		</div>


	</section>

	<jsp:include page="footer.jsp"></jsp:include>

	<jsp:include page="ajjqboot.jsp"></jsp:include>
</body>
</html>