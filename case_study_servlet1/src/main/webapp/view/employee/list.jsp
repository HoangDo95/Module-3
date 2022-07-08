<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 06-Jul-22
  Time: 8:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/boostrap/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/boostrap/datatables/css/dataTables.bootstrap4.min.css"/>

</head>
<body>
<div class="container-fluid">
    <h1>Employee List</h1>
    <a href="/employee?action=create">Create Employee</a><br>
    <a href="/home">Back Home</a>
    <table class="table text-center table-striped" id="table">
        <thead>
        <tr>
            <th>idE</th>
            <th>nameE</th>
            <th>dayOfBirthE</th>
            <th>idCardE</th>
            <th>salaryE</th>
            <th>phoneE</th>
            <th>emailE</th>
            <th>addressE</th>
            <th>idPosition</th>
            <th>idEducation</th>
            <th>idDivision</th>
            <th>userName</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td> ${employee.idE}</td>
                <td> ${employee.nameE}</td>
                <td> ${employee.dayOfBirthE}</td>
                <td> ${employee.idCardE}</td>
                <td> ${employee.salaryE}</td>
                <td> ${employee.phoneE}</td>
                <td> ${employee.emailE}</td>
                <td> ${employee.addressE}</td>
                <td> ${employee.idPosition}</td>
                <td> ${employee.idEducation}</td>
                <td> ${employee.idDivision}</td>
                <td> ${employee.userName}</td>
                <td><a href="/employee?action=edit&idE=${employee.idE}">Edit</a></td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                            onclick="infoDelete('${employee.idE}','${employee.nameE}')">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/employee" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Employee</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- id trung voi serverlet xoa-->
                    <input type="text" hidden name="idE" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <san>Bạn có muốn xóa khách hàng: </san>
                    <span id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không Xóa</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>

<script src="/boostrap/jquery/jquery-3.5.1.min.js"></script>
<script src="/boostrap/datatables/js/jquery.dataTables.min.js"></script>
<script src="/boostrap/datatables/js/dataTables.bootstrap4.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="../boostrap/bootstrap413/js/bootstrap.bundle.min.js"></script>
<%--<script src="../bootstrap/js/bootstrap.bundle.js"></script>--%>

<script>
    $(document).ready(function () {
        $('#table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    })
</script>
</body>
</html>
