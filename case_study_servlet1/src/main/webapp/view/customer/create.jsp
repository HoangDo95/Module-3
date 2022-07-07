<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04-Jul-22
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create Customer</h1>

<a href="/customer">Back Customer list</a>
<form action="/customer?action=create" method="post">
    <table>
        <tr>
            <th>IdCusType</th>
            <td>
                <select name="idCT">
                    <option value="">Chon kieu khach</option>
<%--                    <option value="1">VIP</option>--%>
<%--                    <option value="2">Normal</option>--%>

                    <c:forEach var="cusType" items="${customerTypeList}">
                        <option value="${cusType.idCusType}">${cusType.nameCusType}</option>
                    </c:forEach>
                </select>
            </td>
            <%--            <td><input name="idCT" type="number"></td>--%>
        </tr>
        <tr>
            <th>Name</th>
            <td>
                <input name="name" type="text">
<%--                <c:if test="${validate.size() > 0}"><label class="text-danger">--%>
<%--                    ${validate.get('customer_name')}<label>--%>
<%--                </c:if>--%>
            </td>

        </tr>
        <tr>
            <th>DayOfBirth</th>
            <td><input name="dayOfBirth" type="text"></td>
        </tr>
        <tr>
            <th>Gender</th>
            <td>
<%--                <input name="gender" type="text">--%>
<%--                <select>--%>
<%--                    <c:if test="${customer.gender == 0}">--%>
<%--                        <option value="Male">${customer.gender}</option>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${customer.gender == 1}">--%>
<%--                        <option value="Female">${customer.gender}</option>--%>
<%--                    </c:if>--%>
<%--                </select>--%>
                <select name="gender" >
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>IdCard</th>
            <td>

                <input name="idCard" type="text">
<%--                <c:if test="${validate.size() > 0}"><label class="text-danger">--%>
<%--                        ${validate.get("customer_id_card")}<label>--%>
<%--                    </c:if>--%>
            </td>
        </tr>
        <tr>
            <th>PhoneNumber</th>
            <td><input name="phone" type="text">
<%--                <c:if test="${validate.size() > 0}"><label class="text-danger">--%>
<%--                        ${validate.get("customer_phone")}<label>--%>
<%--                    </c:if>--%>
            </td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input name="email" type="text"></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><input name="address" type="text">
<%--                <c:if test="${validate.size() > 0}"><label class="text-danger">--%>
<%--                        ${validate.get("customer_address")}<label>--%>
<%--                    </c:if>--%>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
