<%@ page language="java" contentType="text/html; charset=UTF8"
         pageEncoding="UTF8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF8">
    <title>Create</title>
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
<form:form modelAttribute="category" action="${pageContext.request.contextPath}" method="POST"
           cssStyle="width: 22rem;margin-left: 40%;margin-top: 1%">
    <div class="form-outline mb-4">
        <form:input path="name" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Name</label>
        <form:errors path="name" class="error"/>
    </div>
    <div>
        <input type="submit" value="Create">
    </div>

</form:form>
</body>
</html>