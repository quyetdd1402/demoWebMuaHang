<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<ul class="list-group">
    <div>
        <div>shop cart</div>
        <div class="row">
            <c:forEach var="CT" items="${gioHangCT}">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" alt="Image cap [100%x180]"
                         style="height: 180px; width: 80%; display: block;" src="${CT.img}"
                         data-holder-rendered="true">
                    <div class="card-body">
                        <h5 class="card-title">${CT.name}</h5>
                        <p class="card-text">${CT.price}đ</p>
                        <p class="card-text">${CT.tongTien}đ</p>
                        <p class="card-text">${CT.soLuong}</p>
                        <button><a href="${pageContext.request.contextPath}/gioHang/tang/${CT.id}">+</a></button>
                        <button><a href="${pageContext.request.contextPath}/gioHang/giam/${CT.id}">-</a></button>
                        <button style="background-color: red"><a href="${pageContext.request.contextPath}/gioHang/huy/${CT.id}">X</a></button>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button>
            <a href="${pageContext.request.contextPath}/gioHang/thanhToan">Mua Hàng</a>
        </button>


    </div>
</ul>