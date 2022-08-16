<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="sidenav-footer position-absolute w-100 bottom-0 ">
    <div class="mx-3">
        <form action="<c:url value="/logout"/>" method="post">
            <input class="btn bg-gradient-primary mt-4 w-100" type="submit" value=<spring:message code="signOut.text"/>>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>