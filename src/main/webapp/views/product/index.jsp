<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
</head>
<body>
<div class="container">
    <table class="table">
        <tr>
            <td>Tên</td>
            <td>Miêu tả</td>
            <td>Ảnh</td>
            <td>Giá</td>
            <td>category</td>
            <td>Hành động</td>
        </tr>

        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.name}</td>
                <td>${product.description}</td>
                <td><img class="card-img-top" style="width: 100px" src="${product.image}"></td>
                <td>${product.price}</td>
                <td>${product.getCategory().name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/product/edit?maUpdate=${product.id}"
                       class="btn btn-primary">Edit</a>
                    <a href="${pageContext.request.contextPath}/product/delete?maDelete=${product.id}"
                       class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <br><a href="${pageContext.request.contextPath}/product/create" class="btn btn-primary">Add new user</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
