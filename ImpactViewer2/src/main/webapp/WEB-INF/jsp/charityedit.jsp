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


<title>Charity Edit</title>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>

	<section class="container">
		<div class="row">
			<div class="col">
				<h2 class="tester">
					<span>Edit Charity</span>
				</h2>
			</div>
		</div>
	</section>

	<section class="mainForms container" id="editCharity">
		<div class="row mt-5 mx-0 mx-md-2 justify-content-center">
			<div class="col-6  bg-light rounded p-3 ">
				<h4 class="tester">Profile Edit</h4>
				<form action="editCharity" method="POST">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="charityName">Charity Name</label> <input type="text"
								class="form-control" id="inputName" placeholder="Charity Name"
								value="${charity.getCharityName()}" name="charityName">
						</div>
						<div class="form-group col-md-6">
							<label for="inputCat">Category</label> <select id="inputCat"
								class="form-control" name="category"
								>
								<c:forEach items="${listOfCategories}" var="item">
									<c:choose>
										<c:when test="${charity.getCategory()==item}">
											<option selected>${item.getCatName()}</option>
										</c:when>
										<c:otherwise>
										<option>${item.getCatName()}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputWeb">Charity Website</label> <input type="text"
								class="form-control" id="inputWeb" pattern="www.+"
								value="${charity.getCharityWeb()}" name="charityWeb"
								placeholder="www.examplecharity.com" required>
						</div>
						<div class="form-group col-md-6">
							<label for="inputImpact">Charity Impact</label>
							<textarea id="inputImpact" name="charityImpact">${charity.getCharityImpact()}</textarea>

						</div>
						<div class="form-group col-md-6">
							<input type="hidden" class="form-control"
								value="${charity.getCharityId()}" name="charityId">

						</div>

					</div>
					<button type="submit" class="btn btn-primary">Edit</button>
				</form>
				​
			</div>
		</div>
	</section>






	<jsp:include page="footer.jsp"></jsp:include>


	<jsp:include page="ajjqboot.jsp"></jsp:include>

</body>
</html>