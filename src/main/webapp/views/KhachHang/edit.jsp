<%@ page language="java" contentType="text/html; charset=UTF8"
         pageEncoding="UTF8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

<form:form modelAttribute="khachHang" action="${pageContext.request.contextPath}?id=${khachHang.id}" method="POST"
           cssStyle="width: 22rem;margin-left: 40%;margin-top: 1%">
    <div class="form-outline mb-4">
        <form:input path="name" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Name</label>
        <form:errors path="name" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <label class="form-label">Ngày Sinh</label>
        <input type="date" class="form-control" name="ngaySinh" value="${khachHang.ngaySinh}">
    </div>
    <div class="form-outline mb-4">
        <form:input path="soCanCuoc" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Số căn cước</label>
        <form:errors path="soCanCuoc" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:input path="diaChi" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Địa Chỉ</label>
        <form:errors path="diaChi" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:input path="phone" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Số Đt</label>
        <form:errors path="phone" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:radiobutton path="gioiTinh" class="form-check-input" name="gridRadios" id="gridRadios1" value="0"/>
        <label class="form-check-label" for="gridRadios1" style="margin-right:20px">
            Nam
        </label>
        <form:radiobutton path="gioiTinh" class="form-check-input" name="gridRadios" id="gridRadios1" value="1"/>
        <label class="form-check-label" for="gridRadios1">
            Nữ
        </label>
        <div></div>
        <label class="form-label" for="form2Example1">Giới Tính</label>
        <form:errors path="gioiTinh" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:input path="username" id="form2Example1" cssClass="form-control"/>
        <label class="form-label" for="form2Example1">Username</label>
        <form:errors path="username" class="error"/>
    </div>
    <div class="form-outline mb-4">
        <form:input path="password" id="form2Example2" class="form-control"/>
        <label path="" class="form-label" for="form2Example2">Password</label>
        <form:errors path="password" class="error"/>
    </div>
    <div>
        <input type="submit" value="Update">
    </div>
</form:form>
</body>
</html>