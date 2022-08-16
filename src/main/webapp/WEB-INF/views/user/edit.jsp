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
                <a class="nav-link text-white active bg-gradient-primary" href="/user/details">
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
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><spring:message code="navbar.edit.profile.text"/></li>
                </ol>
                <h6 class="font-weight-bolder mb-0"><spring:message code="navbar.edit.profile.text"/></h6>
            </nav>
            <jsp:include page="../navbars/navbarRight.jsp"/>
            <div class="container-fluid px-2 px-md-4">
        <div class="page-header min-height-300 border-radius-xl mt-4" style="background-image: url('https://images.unsplash.com/photo-1531512073830-ba890ca4eba2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80');">
            <span class="mask  bg-gradient-primary  opacity-6"></span>
        </div>
        <div class="card card-body mx-3 mx-md-4 mt-n6">
            <div class="row gx-4 mb-2">
                <div class="col-auto">
                    <div class="avatar avatar-xl position-relative">
                        <img src="../../assets/img/bruce-mars.jpg" alt="profile_image" class="w-100 border-radius-lg shadow-sm">
                    </div>
                </div>
                <div class="col-auto my-auto">
                    <div class="h-100">
                        <h5 class="mb-1">
                            ${user.fullName}
                        </h5>
                    </div>
                </div>
                <div class="col-lg-2 col-md-6 my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3">
                    <div class="nav-wrapper position-relative end-0">
                        <ul class="nav nav-pills nav-fill p-1" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link mb-0 px-0 py-1 " href="/user/details" >
                                    <span class="ms-1"><spring:message code="return.text"/></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
                <div class="row">
                    <div class="row">
                        <div class="col-12 col-xl-4">
                            <div class="card card-plain h-100">
                                <hr class="horizontal gray-light my-4">
                                <ul class="list-group">
                                    <li class="list-group-item border-0 ps-0 pt-0 text-sm"><strong class="text-dark"><spring:message code="profile.fullName.text"/> :</strong> &nbsp; ${user.fullName}</li>
                                    <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark"><spring:message code="profile.userName.text"/> :</strong> &nbsp; ${user.username}</li>
                                    <li class="list-group-item border-0 ps-0 text-sm"><strong class="text-dark"><spring:message code="emailAddress.text"/> :</strong> &nbsp; ${user.email}</li>
                                </ul>
                            </div>
                        </div>
                            <div class="col-12 col-xl-4">
                                <%--@elvariable id="user" type="pl.coderslab.rentmanager.model.User"--%>
                                    <form:form modelAttribute="user">
                                        <form:hidden path="id"/>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label"><spring:message code="profile.fullName.text"/></label>
                                            <form:input type="text" path="fullName" class="form-control"/>
                                        </div>
                                        <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                          <form:errors  path="fullName" />
                                        </span>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label"><spring:message code="profile.userName.text"/></label>
                                            <form:input type="text" path="username" class="form-control"/>
                                        </div>
                                        <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                          <form:errors  path="username" />
                                        </span>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label"><spring:message code="emailAddress.text"/></label>
                                            <form:input type="email" path="email" class="form-control"/>
                                        </div>
                                        <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                          <form:errors  path="email" />
                                        </span>
                                        <div class="input-group input-group-outline mb-3">
                                            <label class="form-label"><spring:message code="form.profile.password.text"/></label>
                                            <form:input type="password" path="password" class="form-control"/>
                                        </div>
                                        <span class="mb-2 text-xs text-color-red" style="color: crimson">
                                          <form:errors  path="password" />
                                        </span>
                                        <div class="text-center">
                                            <input type="submit" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0" value=<spring:message code="form.submit.text"/>>
                                        </div>
                                    </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>


<jsp:include page="../navbars/footer.jsp"/>



