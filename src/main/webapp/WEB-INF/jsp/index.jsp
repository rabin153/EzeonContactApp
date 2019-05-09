<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8" />
<title>Welcome</title>
<link rel="stylesheet" href="${path}/css/style.css" />
<style>
#user_added {
	color: green;
	font-family: sans-serif;
	font-style: oblique;
}
</style>
</head>
<body>


	<table border="1" width="80%" align="center">
		<tr>
			<td height="80px">
				<!-- Header --> <jsp:include page="common/header.jsp" /> <c:if
					test="${param.msg eq 'reg'}">
					<p id="user_added">${msg}</p>
				</c:if>
			</td>
		</tr>

		<tr>
			<td height="25px">
				<!-- Menu --><jsp:include page="common/menu.jsp" />
			</td>
		</tr>
		<tr>
			<td height="350px" valign="top">
				<p style="color: red; font-family: fantasy;">${msg }</p> <!-- Page Content Area -->
				<h1>User Login</h1> <form:form action="${path}/user/login"
					method="POST" modelAttribute="command">
					<table border="1">
						<tr>
							<td>Username</td>
							<td><form:input path="loginName" />
						</tr>

						<tr>
							<td>Password</td>
							<td><form:password path="loginPassword" />
						</tr>

						<tr>
							<td colspan="2" align="right">
								<button type="submit">Login</button> <a href="#">New User
									Registration</a>
							</td>
						</tr>


					</table>

				</form:form>
			</td>
		</tr>
		<tr>
			<td height="25px">
				<!-- Footer --> <jsp:include page="common/footer.jsp" />
			</td>
		</tr>

	</table>



</body>
</html>
