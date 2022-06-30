<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30-Jun-22
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>List User</h1>
<a href="/user?action=create">Create User</a>
<form action="/user">
    <input type="text" name="findCountry">
    <input type="submit" name="action" value="search">
</form>
<form action="/user?action=sort">
    <input type="submit" name="action" value="sort">
</form>
<form action="/user">
    <table class="table">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td><a href="/user?action=edit&id=${user.getId()}">edit</a></td>
                <td><a href="/user?action=delete&id=${user.getId()}">delete</a></td>
            </tr>
        </c:forEach>

    </table>
</form>
</body>
</html>
