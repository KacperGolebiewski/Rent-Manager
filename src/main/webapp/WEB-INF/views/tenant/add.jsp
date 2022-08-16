<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:include page="../navbars/header.jsp"/>
<body class="g-sidenav-show  bg-gray-200">
<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="/" target="_blank">
            <img src="../../assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
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
                <a class="nav-link text-white active bg-gradient-primary " href="/user/tenant">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons text-lg position-relative">home</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.tenants.text"/></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white " href="/user/billing">
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
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><spring:message code="navbar.add.tenant.text"/></li>
                </ol>
                <h6 class="font-weight-bolder mb-0"><spring:message code="navbar.add.tenant.text"/></h6>
            </nav>
            <jsp:include page="../navbars/navbarRight.jsp"/>
            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="card mt-4">
                            <div class="card-header p-3">
                                <h5 class="mb-0"><spring:message code="navbar.add.tenant.text"/></h5>
                            </div>
                            <div class="card-body p-3 pb-0">
                                <%--@elvariable id="tenant" type="pl.coderslab.rentmanager.model.Tenant"--%>
                                <form:form modelAttribute="tenant">
                                    <form:hidden path="id"/>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label "><spring:message code="form.tenant.firstName.text"/></label>
                                        <form:input type="text" path="firstName" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="firstName" />
                                    </span>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label"><spring:message code="form.tenant.lastName.text"/></label>
                                        <form:input type="text" path="lastName" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="lastName" />
                                    </span>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label"><spring:message code="emailAddress.text"/></label>
                                            <form:input type="email" path="email" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="email" />
                                    </span>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label"><spring:message code="phoneNumber.text"/></label>
                                        <form:input type="text" path="phone" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="phone" />
                                    </span>
                                    <div class="form-group">
                                        <label><spring:message code="property.text"/></label>
                                        <form:select path="property" class="form-control" >
                                        <form:options items="${properties}" itemLabel="name" itemValue="id"/>
                                        </form:select>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="property" />
                                    </span>
                                    <div class="input-group input-group-static my-3">
                                        <label><spring:message code="form.tenancyStartDate.text"/></label>
                                        <form:input type="date" class="form-control" path="tenancyStartDate"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="tenancyStartDate" />
                                    </span>
                                    <div class="input-group input-group-static my-3">
                                        <label><spring:message code="form.tenancyEndDate.text"/></label>
                                        <form:input type="date" class="form-control" path="tenancyEndDate"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="tenancyEndDate" />
                                    </span>
                                    <div class="input-group input-group-static my-3">
                                        <input type="submit" class="btn bg-gradient-primary mt-4 w-15" value=<spring:message code="form.submit.text"/>>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<jsp:include page="../navbars/footer.jsp"/>