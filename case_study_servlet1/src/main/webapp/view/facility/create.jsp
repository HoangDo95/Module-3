<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04-Jul-22
  Time: 9:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create Facility</h1>

<a href="/facility">Back Customer list</a>
<form action="/facility?action=create" method="post">
    <table>
        <tr>
            <th>nameF</th>
            <td><input name="nameF" type="text"></td>
        </tr>
        <tr>
            <th>areaF</th>
            <td><input name="areaF" type="number"></td>
        </tr>
        <tr>
            <th>costF</th>
            <td><input name="costF" type="number"></td>
        </tr>
        <tr>
            <th>maxPeopleF</th>
            <td><input name="maxPeopleF" type="number"></td>
        </tr>
        <tr>
            <th>idRT</th>
            <td>
                <select name="idRT"  >
                    <option value="">Chon kieu thue</option>
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <option value="${rentType.idRT}">${rentType.nameRT}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>idFT</th>
            <td>
                <select name="idFT"  >
                    <option value="">Chon kieu phong</option>
                    <c:forEach var="facilityType" items="${facilityTypeList}">
                        <option value="${facilityType.idFT}">${facilityType.nameFT}</option>
                    </c:forEach>
                </select>
            </td>
<%--            <td><input name="idFT" type="number"></td>--%>
        </tr>
        <tr>
            <th>standardRoom</th>
            <td><input name="standardRoom" type="text"></td>
        </tr>
        <tr>
            <th>convenience</th>
            <td><input name="convenience" type="text"></td>
        </tr>
        <tr>
            <th>poolArea</th>
            <td><input name="poolArea" type="number"></td>
        </tr>
        <tr>
            <th>floors</th>
            <td><input name="floors" type="number"></td>
        </tr>
        <tr>
            <th>freeF</th>
            <td><input name="freeF" type="text"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
