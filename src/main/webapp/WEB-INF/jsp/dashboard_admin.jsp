<!DOCTYPE HTML>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>


<c:if test="${sessionScope.userId == null}">
	<c:redirect url="${path}/index" />
</c:if>
<html>
<head>
<meta charset="UTF-8" />
<title>Welcome - ${title}</title>
<link rel="stylesheet" href="${path}/css/style.css" />
</head>
<body>

	<!-- User Page after login -->
	<table border="1" width="80%" align="center">
		<tr>
			<td height="80px">
				<!-- Header --> <jsp:include page="common/header.jsp" />
				<h1>Welcome - ${user.name}</h1>
			</td>
		</tr>

		<tr>
			<td height="25px">
				<!-- Menu --><jsp:include page="common/menu.jsp" />
			</td>
		</tr>
		<tr>
			<td height="350px" valign="top">
				<!-- Page Content Area -->
				<h1>Admin Dasboard</h1>

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
