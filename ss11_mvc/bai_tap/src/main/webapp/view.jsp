<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 29-Jun-22
  Time: 7:41 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
  <title>View Product</title>
</head>
<body>
<h1>Customer details</h1>
<p>
  <a href="/product">Back to customer list</a>
</p>
<table>
  <tr>
    <td>Id: </td>
    <td>${product.getId()}</td>
  </tr>
  <tr>
    <td>Name: </td>
    <td>${product.getName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${product.getPrice()}</td>
  </tr>
  <tr>
    <td>Amount: </td>
    <td>${product.getAmount()}</td>
  </tr>
  <tr>
    <td>Production: </td>
    <td>${product.getProduction()}</td>
  </tr>
</table>
</body>
</html>
