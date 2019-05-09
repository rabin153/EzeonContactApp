<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<meta charset="UTF-8" />
<title>Welcome</title>
<link rel="stylesheet" href="${path}/css/style.css" />
</head>
<body>


	<table border="1" width="80%" align="center">
		<tr>
			<td height="80px">
				<!-- Header --> <jsp:include page="common/header.jsp" />
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
				<h1>User Login</h1> <form:form action="${path}/user/register"
					method="POST" modelAttribute="user">
					<table border="1">

						<tr>
							<td>User Name</td>
							<td><form:input path="name" />
						</tr>

						<tr>
							<td>Email:</td>
							<td><form:input path="email" />
						</tr>

						<tr>
							<td>Phone:</td>
							<td><form:input path="phone" />
						</tr>


						<tr>
							<td>Address</td>
							<td><form:textarea path="address" rows="8" cols="20" />
						</tr>

						<tr>
							<td>Login Name</td>
							<td><form:input path="loginName" />
						</tr>

						<tr>
							<td>Password</td>
							<td><form:password path="password" />
						</tr>

						<tr>
							<td colspan="2" align="right">
								<button type="submit">Register</button> <a href="#">Login</a>
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
