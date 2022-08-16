<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../navbars/header.jsp"/>
<body class="g-sidenav-show  bg-gray-200">
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="/" target="_blank">
            <img src="../assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
            <span class="ms-1 font-weight-bold text-white"><spring:message code="app.name"/></span>
        </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white " href="/user/property">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">dashboard</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.properties.text"/></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white " href="/user/tenant">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons text-lg position-relative">home</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.tenants.text"/></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white active bg-gradient-primary " href="/user/billing">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">receipt_long</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.billings.text"/></span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8"><spring:message code="sidenav.accountPages.text"/></h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white " href="/user/details">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">person</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.profile.text"/></span>
                </a>
            </li>
        </ul>
    </div>
    <jsp:include page="../home/sign-out.jsp"/>
</aside>
<main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
        <div class="container-fluid py-1 px-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                    <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;"><spring:message code="navbar.pages.text"/></a></li>
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><spring:message code="navbar.my.billings.text"/></li>
                </ol>
                <h6 class="font-weight-bolder mb-0"><spring:message code="navbar.my.billings.text"/></h6>
            </nav>
            <jsp:include page="../navbars/navbarRight.jsp"/>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-7 mt-4">
                <div class="card">
                    <div class="card-header pb-0 px-3">
                        <h6 class="mb-0"><spring:message code="billing.pendingPayments.text"/></h6>
                    </div>
                    <div class="card-body pt-4 p-3">
                        <ul class="list-group">
                            <c:forEach items="${billings}" var="billing">
                                    <c:if test="${billing.status.equalsIgnoreCase('status.pending')}">
                                        <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                            <div class="d-flex flex-column">
                                                <h6 class="mb-3 text-sm">${billing.tenant.firstName} ${billing.tenant.lastName}</h6>
                                                <span class="mb-2 text-xs"><spring:message code="emailAddress.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.tenant.email}</span></span>
                                                <span class="mb-2 text-xs"><spring:message code="phoneNumber.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.tenant.phone}</span></span>
                                                <span class="mb-2 text-xs"><spring:message code="form.billing.startDate.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.billingStart}</span></span>
                                                <span class="mb-2 text-xs"><spring:message code="form.billing.endDate.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.billingEnd}</span></span>
                                                <span class="mb-2 text-xs"><spring:message code="form.billing.rent.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">PLN ${billing.rent}</span></span>
                                                <c:choose>
                                                    <c:when test="${billing.status.equalsIgnoreCase('status.pending')}">
                                                        <span class="mb-2 text-xs"><spring:message code="billing.payment.status.text"/> :<span style="color: crimson" class=" ms-sm-2 font-weight-bold"><spring:message code="${billing.status}"/></span></span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="mb-2 text-xs"><spring:message code="billing.payment.status.text"/> :<span style="color: green" class=" ms-sm-2 font-weight-bold"><spring:message code="${billing.status}"/></span></span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="ms-auto text-end">
                                                <a class="btn btn-link text-danger text-gradient px-3 mb-0" href="/billing/sendEmail/${billing.id}"><i class="material-icons text-sm me-2">email</i><i class="material-icons text-sm me-2">message</i><spring:message code="billing.sendMessage.text"/></a>
                                                <a class="btn btn-link text-dark px-3 mb-0" href="<c:url value="/billing/edit/${billing.id}"/>"><i class="material-icons text-sm me-2">edit</i><spring:message code="edit.text"/></a>
                                            </div>
                                        </li>
                                    </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-5 mt-4">
                <div class="card h-100 mb-4">
                    <div class="card-header pb-0 px-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h6 class="mb-0"><spring:message code="billing.confirmedPayments.text"/></h6>
                            </div>
                            <div class="card-body pt-4 p-3">
                                <ul class="list-group">
                                    <c:forEach items="${billings}" var="billing">
                                        <c:if test="${!billing.status.equalsIgnoreCase('status.pending')}">
                                            <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                                <div class="d-flex flex-column">
                                                    <h6 class="mb-3 text-sm">${billing.tenant.firstName} ${billing.tenant.lastName}</h6>
                                                    <span class="mb-2 text-xs"><spring:message code="emailAddress.text"/> : <span class="text-dark ms-sm-2 font-weight-bold">${billing.tenant.email}</span></span>
                                                    <span class="mb-2 text-xs"><spring:message code="phoneNumber.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.tenant.phone}</span></span>
                                                    <span class="mb-2 text-xs"><spring:message code="form.billing.startDate.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.billingStart}</span></span>
                                                    <span class="mb-2 text-xs"><spring:message code="form.billing.endDate.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">${billing.billingEnd}</span></span>
                                                    <span class="mb-2 text-xs"><spring:message code="form.billing.rent.text"/> :<span class="text-dark ms-sm-2 font-weight-bold">PLN ${billing.rent}</span></span>
                                                    <c:choose>
                                                        <c:when test="${billing.status.equalsIgnoreCase('status.pending')}">
                                                            <span class="mb-2 text-xs"><spring:message code="billing.payment.status.text"/> :<span style="color: crimson" class=" ms-sm-2 font-weight-bold"><spring:message code="${billing.status}"/></span></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="mb-2 text-xs"><spring:message code="billing.payment.status.text"/> :<span style="color: green" class=" ms-sm-2 font-weight-bold"><spring:message code="${billing.status}"/></span></span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<jsp:include page="../navbars/footer.jsp"/>