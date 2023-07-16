<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/"><s:message code="label.home.web"/></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/admin"><s:message
                        code="label.home.home"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/bill/index"><s:message code="label.home.bill"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/product/index"><s:message
                        code="label.home.product"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/category/index"><s:message
                        code="label.home.category"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/Tai-khoan/indexAdmin"><s:message
                        code="label.home.user"/></a></li>
            </ul>
            <a href="?language=vi">
                <img alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/vi.png">
            </a>

            <a href="?language=en">
                <img alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/en.png">
            </a>
            <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#">
                <span class="d-none d-md-block ps-2">${userLoggedAdmin.name}</span>
            </a>
            <button type="button" class="btn btn-danger" style="margin-left: 10px"><a href="/logoutAdmin"><s:message
                    code="label.home.logout"/></a></button>
        </div>
    </div>
</nav>
   