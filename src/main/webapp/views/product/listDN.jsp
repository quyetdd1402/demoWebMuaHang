<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="row">
    <div class="col-sm-8">
        <div class="row">
            <c:forEach var="product" items="${productsDN}">
                <a class="card col-sm-4" href="${pageContext.request.contextPath}/product/${product.id}DN">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" alt="Image cap [100%x180]"
                             style="height: 180px; width: 80%; display: block;" src="${product.image}"
                             data-holder-rendered="true">
                        <div class="card-body">
                            <h5 class="card-title">${product.name}</h5>
                            <p class="card-text">${product.price}đ</p>
                        </div>
                    </div>
                </a>
                <a href="${pageContext.request.contextPath}/gioHang/buy/${product.id}">Buy</a>
            </c:forEach>
        </div>
        <div>
            <ul class="pagination">
                <c:forEach begin="1" end="${totalPage}" varStatus="status">
                    <li class="page-item"><a class="page-link"
                                             href="${pageContext.request.contextPath}/product/listDN?pageNum=${status.index}">${status.index}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
</html>