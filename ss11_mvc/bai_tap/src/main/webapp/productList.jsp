<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29-Jun-22
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h1>Product List</h1>
<a href="/product?action=create">Thêm mới Product</a><br>
<form action="/product">
<input type="text" placeholder="Tìm kiếm" name="nameFind">
<input type="submit" value="find" name="action">
</form>
<form action="/product">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Amount</th>
            <th>Production</th>
            <th>Edit</th>
            <th>Delete</th>
            <th>View</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.amount}</td>
                <td>${product.production}</td>
                <td><a href="/product?action=edit&id=${product.getId()}">edit</a></td>
                <td><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
                <td><a href="/product?action=view&id=${product.getId()}">view</a></td>
            </tr>
        </c:forEach>

    </table>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
