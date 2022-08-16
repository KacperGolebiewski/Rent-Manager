<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
    <spring:message code="app.name"/>
  </title>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
</head>

<body class="">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">

    </div>
  </div>
  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style="background-image: url('../../assets/img/illustrations/illustration-signup.jpg'); background-size: cover;">
              </div>
            </div>
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
              <div class="card card-plain">
                <div class="card-header">
                  <h4 class="font-weight-bolder"><spring:message code="signIn.signUp.text"/></h4>
                  <p class="mb-0"><spring:message code="enterYourEmailAndPassword.text"/></p>
                </div>
                <div class="card-body">
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
                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-2 text-sm mx-auto">
                    <spring:message code="alreadyHaveAnAccount.text"/>?
                    <a href="${pageContext.request.contextPath}/login" class="text-primary text-gradient font-weight-bold"><spring:message code="signIn.text"/></a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.min.js?v=3.0.4"></script>
</body>

</html>