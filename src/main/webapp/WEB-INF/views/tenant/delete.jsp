<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <li class="breadcrumb-item text-sm text-dark active" aria-current="page"><spring:message code="navbar.my.tenants.text"/></li>
                </ol>
                <h6 class="font-weight-bolder mb-0"><spring:message code="navbar.my.tenants.text"/></h6>
            </nav>
            <jsp:include page="../navbars/navbarRight.jsp"/>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card my-4">
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                        <tr>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.property.text"/>
                                            </th>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.address.text"/>
                                            </th>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.text"/>
                                            </th>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.rent.text"/>
                                            </th>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.tenancyPeriod.text"/>
                                            </th>
                                            <th class="align-middle text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                                <spring:message code="tenant.actions.text"/>
                                            </th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="d-flex px-2 py-1">
                                                        <div>
                                                            <img src="../../assets/img/House.jpg"
                                                                 class="avatar avatar-sm me-3 border-radius-lg"
                                                                 alt="user1">
                                                        </div>
                                                        <div class="d-flex flex-column justify-content-center">
                                                            <h6 class="mb-0 text-sm">${tenant.property.name}</h6>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="align-middle">
                                                <p class="text-xs font-weight-bold mb-0">${tenant.property.town}</p>
                                                <p class="text-xs text-secondary mb-0">${tenant.property.address}</p>
                                                </td>
                                                    <td class="align-middle text-center">
                                                        <p class="text-xs font-weight-bold mb-0">${tenant.firstName} ${tenant.lastName}</p>
                                                    </td>
                                                <td class="align-middle text-center">
                                                    <span class="badge badge-sm bg-gradient-success">PLN ${tenant.property.rent}</span>
                                                </td>
                                                <td style="white-space: pre-wrap; max-width: 350px;" class="align-middle text-xs text-secondary mb-0">
                                                    <p class="text-xs text-secondary mb-0">${tenant.property.description}</p>
                                                </td>
                                                <td class="align-middle text-center">
                                                        <a class="align-middle btn btn-link text-danger text-gradient px-3 mb-0" href="<c:url value="/tenant/delete/${id}"/>"><i class="align-middle material-icons text-sm me-2"></i><spring:message code="confirm.text"/></a>
                                                        <a class="align-middle btn btn-link text-dark px-3 mb-0" href="/user/tenant"><i class="align-middle material-icons text-sm me-2"></i><spring:message code="return.text"/></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<jsp:include page="../navbars/footer.jsp"/>