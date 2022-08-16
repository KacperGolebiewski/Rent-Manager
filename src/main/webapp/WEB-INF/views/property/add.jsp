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
                <a class="nav-link text-white active bg-gradient-primary" href="/user/property">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="material-icons opacity-10">dashboard</i>
                    </div>
                    <span class="nav-link-text ms-1"><spring:message code="sidenav.properties.text"/></span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white  " href="/user/tenant">
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
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><spring:message code="navbar.add.property.text"/></li>
                </ol>
                <h6 class="font-weight-bolder mb-0"><spring:message code="navbar.add.property.text"/></h6>
            </nav>
            <jsp:include page="../navbars/navbarRight.jsp"/>
            <div class="container-fluid py-4">
                <div class="row">
                    <div class="col-lg-8 col-md-10 mx-auto">
                        <div class="card mt-4">
                            <div class="card-header p-3">
                                <h5 class="mb-0"><spring:message code="navbar.add.property.text"/></h5>
                            </div>
                            <div class="card-body p-3 pb-0">
                                <%--@elvariable id="property" type="pl.coderslab.rentmanager.model.Property"--%>
                                <form:form modelAttribute="property">
                                    <form:hidden path="id"/>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label "><spring:message code="form.property.propertyName.text"/></label>
                                        <form:input type="text" path="name" class="form-control"/><br>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="name" />
                                    </span>

                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label "><spring:message code="form.property.propertyAddress.text"/></label>
                                        <form:input type="text" path="address" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="address" />
                                    </span>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label "><spring:message code="form.property.town.text"/></label>
                                        <form:input type="text" path="town" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="town" />
                                    </span>
                                    <div class="input-group input-group-outline my-3">
                                        <label class="form-label"><spring:message code="form.property.rent.text"/></label>
                                        <form:input type="text" path="rent" class="form-control"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="rent" />
                                    </span>
                                    <div class="input-group input-group-dynamic">
                                        <form:textarea class="form-control" rows="5" path="description" placeholder="Description" spellcheck="false"/>
                                    </div>
                                    <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                    <form:errors  path="description" />
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