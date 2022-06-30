<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 30-Jun-22
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/user?action=create">
    <tr>
        <th>Id</th>
        <td><input name="id" type="number"></td><br>
    </tr>
    <tr>
        <th>Name</th>
        <td><input name="name" type="text"></td><br>
    </tr>
    <tr>
        <th>Email</th>
        <td><input name="email" type="text"></td><br>
    </tr>
    <tr>
        <th>Country</th>
        <td><input name="country" type="text"></td><br>
    </tr>
    <tr>
        <td><input type="Submit" value="Save"></td>
    </tr>
</form>
</body>
</html>
