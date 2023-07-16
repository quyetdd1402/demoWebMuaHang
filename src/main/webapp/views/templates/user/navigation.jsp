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
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/"><s:message
                        code="label.home.home"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/login"><s:message code="label.home.login"/></a></li>
                <li class="nav-item"><a class="nav-link" href="/createLogin"><s:message code="label.home.createLogin"/></a>
                </li>
                <li class="nav-item"><a class="nav-link" href="/login"><s:message code="label.home.history"/></a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown"
                       data-bs-toggle="dropdown" aria-expanded="false"><s:message code="label.home.shop"/></a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/product/list"><s:message code="label.home.all"/></a></li>
                        <li><a class="dropdown-item" href="/product/increase"><s:message code="label.home.increase"/></a>
                        </li>
                        <li><a class="dropdown-item" href="/product/reduce"><s:message code="label.home.reduce"/></a></li>
                        <li>
                            <hr class="dropdown-divider"/>
                        </li>
                        <c:forEach var="cate" items="${categories}">
                            <li class="dropdown-item"><a
                                    href="${pageContext.request.contextPath}/category/${cate.id}/product">${cate.name}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </ul>
            <a href="/loginAdmin" class="auth-modal-toggle btn btn-primary ripple-surface ms-2 me-1"
               data-auth-modal-tab="sign-in"> <s:message code="label.home.loginAdmin"/></a>
            <a href="/#" class="auth-modal-toggle btn btn-primary ripple-surface ms-2 me-1"
               data-auth-modal-tab="sign-in"> <s:message code="label.home.cart"/> <span
                    class="badge bg-dark text-white ms-1 rounded-pill">0</span></a>
            <a href="?language=vi">
                <img alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/vi.png">
            </a>

            <a href="?language=en">
                <img alt="" src="https://s2.o7planning.com/templates/o7planning/resources/images/languages/en.png">
            </a>
        </div>

    </div>
</nav>
   