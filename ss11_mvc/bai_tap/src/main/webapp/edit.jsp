<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29-Jun-22
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Edit Product</h1>
<p>
    <a href="/product">Back to home</a>
</p>
<form method="post" >
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><input type="text" name="amount" value="${product.getAmount()}"></td>
            </tr>
            <tr>
                <td>Production:</td>
                <td><input type="text" name="production" value="${product.getProduction()}"></td>
            </tr>
            <tr>
                <td><input type="Submit" value="Edit"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
