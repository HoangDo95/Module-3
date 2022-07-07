<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04-Jul-22
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit Product</h1>
<p><a href="/customer">Back Product List</a></p>
<form action="/customer?action=edit" method="post">
    <table>
        <tr>
            <th>IdCustomer</th>
            <td><input name="idC" hidden type="number" value="${customer.idCustomer}"></td>
        </tr>
        <tr>
            <th>IdCusType</th>
            <td>
                <select name="idCT">
                    <option value="">Chon kieu khach</option>
                    <c:forEach var="cusType" items="${customerTypeList}">
                        <c:if test="${cusType.idCusType == customer.idCusType}">
                            <option selected value="${cusType.idCusType}">${cusType.nameCusType}</option>
                        </c:if>
                        <c:if test="${cusType.idCusType != customer.idCusType}">
                            <option value="${cusType.idCusType}">${cusType.nameCusType}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>Name</th>
            <td><input name="name" type="text" value="${customer.name}"></td>
        </tr>
        <tr>
            <th>DayOfBirth</th>
            <td><input name="dayOfBirth" type="text" value="${customer.dayOfBirth}"></td>
        </tr>
        <tr>
            <th>Gender</th>
            <td>
                <%--                <input name="gender" type="text" value="${customer.gender}">--%>
                <select name="gender">
                    <c:if test="${customer.gender == 0}">
                        <option selected value="0">Male</option>
                        <option   value="1">Female</option>
                    </c:if>
                    <c:if test="${customer.gender == 1}">
                        <option value="0">Male</option>
                        <option selected value="1">Female</option>
                    </c:if>
                </select>
            </td>
        </tr>
        <tr>
            <th>IdCard</th>
            <td><input name="idCard" type="text" value="${customer.idCard}"></td>
        </tr>
        <tr>
            <th>PhoneNumber</th>
            <td><input name="phone" type="text" value="${customer.phoneNumber}"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input name="email" type="text" value="${customer.email}"></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><input name="address" type="text" value="${customer.address}"></td>
        </tr>
        <tr>
            <td><input type="Submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
