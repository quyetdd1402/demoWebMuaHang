<%@ page language="java" contentType="text/html; charset=UTF8"
         pageEncoding="UTF8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF8">
    <title>Edit</title>
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
<form:form modelAttribute="product" action="${pageContext.request.contextPath}?id=${product.id}" method="POST"
           cssStyle="width: 22rem;margin-left: 40%;margin-top: 1%">
    <div class="form-outline mb-4">
        <form:input path="name" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Name</label>
        <form:errors path="name" class="error"/>
    </div>

    <div class="form-outline mb-4">
        <form:textarea path="image" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Image</label>
        <form:errors path="image" class="error"/>
    </div>

    <div class="form-outline mb-4">
        <form:input path="price" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">price</label>
        <form:errors path="price" class="error"/>
    </div>

    <div class="form-outline mb-4">
        <form:input path="description" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">description</label>
        <form:errors path="description" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:select path="category.id">
            <c:forEach var="khC" items="${ category }">
                <tr>
                    <form:option value="${khC.id}">${khC.name}</form:option>
                </tr>
            </c:forEach>
        </form:select>
        <label class="form-label" for="form2Example1">Category</label>
    </div>
    <div>
        <input type="submit" value="Update">
    </div>

</form:form>
</body>
</html>