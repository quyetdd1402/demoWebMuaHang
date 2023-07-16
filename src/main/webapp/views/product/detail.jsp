<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
			<div class="product-item">
				<span>${product.id}</span>
				<span>${product.name}</span>
				<img width="300px" src="${product.image}">
				<span>${product.price} VNĐ</span>
				<span>${product.getCategory().name}</span>
			</div>
</body>
</html>