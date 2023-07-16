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
            <td>Địa chỉ</td>
            <td>Ngày Sinh</td>
            <td>Giới Tính</td>
            <td>Số Căn Cước</td>
            <td>username</td>
            <td>password</td>
            <td>SĐT</td>
            <td>Trạng Thái</td>
            <td>Hành động</td>
        </tr>

        <tbody>
        <c:forEach var="kh" items="${khachHang}">
            <tr>
                <td>${kh.name}</td>
                <td>${kh.diaChi}</td>
                <td>${kh.ngaySinh}</td>
                <td>${kh.gioiTinh == 0 ? "nam" :" nữ"}</td>
                <td>${kh.soCanCuoc}</td>
                <td>${kh.username}</td>
                <td>${kh.password}</td>
                <td>${kh.phone}</td>
                <td>${kh.trangThai == 1 ? "hoạt động" :"không hoạt động"}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/Tai-khoan/editAdmin?maUpdate=${kh.id}"
                       class="btn btn-primary">Edit</a>
                    <a href="${pageContext.request.contextPath}/Tai-khoan/delete?maDelete=${kh.id}"
                       class="btn btn-danger">Cancel</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
