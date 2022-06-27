<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 27-Jun-22
  Time: 2:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/calculate " method="post">
    <label>Product Description:</label><br>
    <input type="text" name="product" placeholder="Mô tả của sản phẩm"><br>
    <label>List Price:</label><br>
    <input type="text" name="price" placeholder="Giá niêm yết của sản phẩm"><br>
    <label>Discount Percent:</label><br>
    <input type="text" name="discount" placeholder="Tỷ lệ chiết khấu (phần trăm)"><br>
    <input type="submit" id="submit" value="Calculate Discount">

</form>
</body>
</html>
