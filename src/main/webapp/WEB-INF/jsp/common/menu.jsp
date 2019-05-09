<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!-- for all user User is not logged at all -->
<c:if test="${sessionScope.userId == null}">

	<!-- User is not yet logged in :Guest Menu -->

	<s:url var="url_reg_form" value="/reg_form" />


	<a href="#">Home</a>
|
<a href="#">Login</a>
|
<a href="${url_reg_form}">Register</a>
|
<a href="#">About</a>
</c:if>

<!-- For admin  1 means it is admin-->
<c:if test="${sessionScope.userId !=null && sessionScope.role == 1}">
	<a href="#">Home</a>
|
<a href="#">User List</a>
|
<a href="#">Logout</a>

</c:if>

<!-- For General user which is by role 2 -->
<c:if test="${sessionScope.userId !=null && sessionScope.role == 2}">
	<a href="#">Home</a>
|
<a href="#">Add Contact</a>
|
<a href="#">Contact List</a>
|
<a href="#">Logout</a>

</c:if>

