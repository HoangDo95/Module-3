<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06-Jul-22
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create Employee</h1>
<a href="/employee">Back Employee list</a>

<form action="/employee?action=edit" method="post">
    <table>
        <tr>
            <th>IdE</th>
            <td><input name="idE" hidden  type="number" value="${employee.idE}"></td>
        </tr>
        <tr>
            <th>Name</th>
            <td><input name="nameE" type="text" value="${employee.nameE}"></td>
        </tr>
        <tr>
            <th>DayOfBirth</th>
            <td><input name="dayOfBirthE" type="date" value="${employee.dayOfBirthE}"></td>
        </tr>
        <tr>
            <th>IdCard</th>
            <td><input name="idCardE" type="text" value="${employee.idCardE}"></td>
        </tr>
        <tr>
            <th>Salary</th>
            <td><input name="salaryE" type="text" value="${employee.salaryE}"></td>
        </tr>
        <tr>
            <th>PhoneNumber</th>
            <td><input name="phoneE" type="text" value="${employee.phoneE}"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input name="emailE" type="text" value="${employee.emailE}"></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><input name="addressE" type="text" value="${employee.addressE}"></td>
        </tr>
        <tr>
            <th>idPosition</th>
            <td><input name="idPosition" type="number" value="${employee.idPosition}"></td>
        </tr>
        <tr>
            <th>idEducation</th>
            <td><input name="idEducation" type="number" value="${employee.idEducation}"></td>
        </tr>
        <tr>
            <th>idDivision</th>
            <td><input name="idDivision" type="number" value="${employee.idDivision}"></td>
        </tr>
        <tr>
            <th>userName</th>
            <td><input name="userName" type="text" value="${employee.userName}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
