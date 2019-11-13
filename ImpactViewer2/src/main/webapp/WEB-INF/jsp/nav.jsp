
<nav class="navbar navbar-expand-md navbar-dark">
	<a class="navbar-brand custbrand"
		href="${pageContext.request.contextPath}/index">Impact</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<!-- 				<li class="nav-item active"><a class="nav-link" href="index">Home
						<span class="sr-only">(current)</span>
				</a></li> -->
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/about">About</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdownCH"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Charity </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdownCH">
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/allcat">Find a
						Charity</a> <a class="dropdown-item"
						href="${pageContext.request.contextPath}/surprise">Surprise Me</a> <a class="dropdown-item"
						href="${pageContext.request.contextPath}/organization">Org
						Login/Sign Up</a>
				</div>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> ${userCurrent!=null ? userCurrent.userName: "Profile" }



			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<%-- <a class="dropdown-item"
						href="${pageContext.request.contextPath}/registration">Register</a>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/signin">Sign In</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/logout">Log Out</a> --%>

					<%
						if ((session.getAttribute("userCurrent") == null)) {
					%>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/registration">Register</a>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/signin">Sign In</a>
					<%
						} else {
					%>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/myprofile">My Profile</a>
					<a class="dropdown-item"
						href="${pageContext.request.contextPath}/logout">Log Out</a>
					<%
						}
					%>
				</div></li>
		</ul>
	</div>
</nav>




