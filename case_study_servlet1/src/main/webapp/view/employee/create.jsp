<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06-Jul-22
  Time: 8:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create Employee</h1>

<a href="/employee">Back Employee list</a>
<form action="/employee?action=create" method="post">
    <table>
        <tr>
            <th>Name</th>
            <td><input name="nameE" type="text"></td>
        </tr>
        <tr>
            <th>DayOfBirth</th>
            <td><input name="dayOfBirthE" type="text"></td>
        </tr>
        <tr>
            <th>IdCard</th>
            <td><input name="idCardE" type="text"></td>
        </tr>
        <tr>
            <th>Salary</th>
            <td><input name="salaryE" type="text"></td>
        </tr>
        <tr>
            <th>PhoneNumber</th>
            <td><input name="phoneE" type="text"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input name="emailE" type="text"></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><input name="addressE" type="text"></td>
        </tr>
        <tr>
            <th>idPosition</th>
            <td><input name="idPosition" type="number"></td>
        </tr>
        <tr>
            <th>idEducation</th>
            <td><input name="idEducation" type="number"></td>
        </tr>
        <tr>
            <th>idDivision</th>
            <td><input name="idDivision" type="number"></td>
        </tr>
        <tr>
            <th>userName</th>
            <td><input name="userName" type="text"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save"></td>
        </tr>
    </table>
</form>
</body>
</html>
