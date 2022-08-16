<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
    <div class="ms-md-auto pe-md-3 d-flex align-items-center">
<sec:authorize access="isAuthenticated()">
        <div class="px-3">
            <h6 class="font-weight-bolder mb-0"><a href=/user/details>
                <spring:message code="loggedAs.text"/> :
                <span class="d-sm-inline d-none"><sec:authentication property="principal.username"/></span>

            </a></h6>

        </div>
</sec:authorize>
        <div class="px-3">
            <a href=/billing/add class="nav-link text-body font-weight-bold px-0">
                <i class="material-icons opacity-10">receipt_long</i>
                <span class="d-sm-inline d-none"><spring:message code="navbar.add.billing.text"/></span>
            </a>
        </div>
        <div>
            <a href=/tenant/add class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1" aria-hidden="true"></i>
                <span class="d-sm-inline d-none"><spring:message code="navbar.add.tenant.text"/></span>
            </a>
        </div>
    </div>
    <ul class="navbar-nav  justify-content-end">
        <li class="nav-item d-flex align-items-center">
            <a href="/property/add" class="nav-link text-body font-weight-bold px-0">
                <i class="fas fa-home me-sm-1" aria-hidden="true"></i>
                <span class="d-sm-inline d-none"><spring:message code="navbar.add.property.text"/></span>
            </a>
        </li>
        <li class="nav-item px-3 d-flex align-items-center">
            <a href="/user/details" class="nav-link text-body p-0">
                <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
            </a>
        </li>
    </ul>
</div>
</nav>
<!-- End Navbar -->