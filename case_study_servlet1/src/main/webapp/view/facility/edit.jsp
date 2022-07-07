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
<form action="/facility?action=edit" method="post">
    <table>
        <tr>
            <th>idF</th>
            <td><input name="idF" hidden type="number" value="${facility.idF}"></td>
        </tr>
        <tr>
            <th>nameF</th>
            <td><input name="nameF" type="text"  value="${facility.nameF}"></td>
        </tr>
        <tr>
            <th>areaF</th>
            <td><input name="areaF" type="number" value="${facility.areaF}"></td>
        </tr>
        <tr>
            <th>costF</th>
            <td><input name="costF" type="number" value="${facility.costF}"></td>
        </tr>
        <tr>
            <th>maxPeopleF</th>
            <td><input name="maxPeopleF" type="number" value="${facility.maxPeopleF}"></td>
        </tr>
        <tr>
            <th>idRT</th>
            <td>
                <select name="idRT"  >
                    <option value="">Chon kieu thue</option>
                    <c:forEach var="rentType" items="${rentTypeList}">
                        <c:if test="${rentType.idRT == facility.idRentType}">
                            <option selected value="${rentType.idRT}">${rentType.nameRT}</option>
                        </c:if>
                        <c:if test="${rentType.idRT != facility.idRentType}">
                            <option value="${rentType.idRT}">${rentType.nameRT}</option>
                        </c:if>
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
                        <c:if test="${facilityType.idFT == facility.idFacType}">
                            <option selected value="${facilityType.idFT}">${facilityType.nameFT}</option>
                        </c:if>
                        <c:if test="${facilityType.idFT != facility.idFacType}">
                            <option value="${facilityType.idFT}">${facilityType.nameFT}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th>standardRoom</th>
            <td><input name="standardRoom" type="text" value="${facility.standardRoom}"></td>
        </tr>
        <tr>
            <th>convenience</th>
            <td><input name="convenience" type="text" value="${facility.convenience}"></td>
        </tr>
        <tr>
            <th>poolArea</th>
            <td><input name="poolArea" type="number" value="${facility.poolArea}"></td>
        </tr>
        <tr>
            <th>floors</th>
            <td><input name="floors" type="number" value="${facility.floors}"></td>
        </tr>
        <tr>
            <th>freeF</th>
            <td><input name="freeF" type="text" value="${facility.freeF}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
