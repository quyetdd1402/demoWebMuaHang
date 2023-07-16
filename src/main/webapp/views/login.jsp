<%@ page language="java" contentType="text/html; charset=UTF8"
         pageEncoding="UTF8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF8">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .error {
            color: red;
        }
    </style>

</head>
<body>

<form:form modelAttribute="userKH" action="/login" method="POST"
           cssStyle="width: 22rem;margin-left: 40%;margin-top: 1%">
    <!-- Email input -->
    <div class="form-outline mb-4">
        <form:input path="username" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Username</label>
        <form:errors path="username" class="error"/>
    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
        <form:password path="password" id="form2Example2" class="form-control"/>
        <label path="" class="form-label" for="form2Example2">Password</label>
        <form:errors path="password" class="error"/>
    </div>
    <form:input path="name" cssStyle="display: none"/>
    <form:input path="diaChi" cssStyle="display: none"/>
    <form:input path="phone" cssStyle="display: none"/>
    <form:input path="soCanCuoc" cssStyle="display: none"/>
    <input type="submit" value="Login" class="btn btn-primary btn-block mb-4">
</form:form>
</body>
</html>