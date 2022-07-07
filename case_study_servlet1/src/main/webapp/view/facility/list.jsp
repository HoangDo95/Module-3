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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/boostrap/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/boostrap/datatables/css/dataTables.bootstrap4.min.css"/>

</head>
<body>
<h1>Facility List</h1>
<a href="/facility?action=create">Create Facility</a>
<form action="/facility">
    <input type="text" name="findName" placeholder="name">
    <input type="text" name="findRoom" placeholder="room">
    <input type="text" name="findConvenience" placeholder="convenience">
    <input type="submit" name="action" value="find">
</form>

<table class="table text-center table-striped" id="table">
    <thead>


    <tr>
        <th>idF</th>
        <th>nameF</th>
        <th>areaF</th>
        <th>costF</th>
        <th>maxPeople</th>
        <th>idRentType</th>
        <th>idFacType</th>
        <th>standardRoom</th>
        <th>convenience</th>
        <th>poolArea</th>
        <th>floors</th>
        <th>freeF</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${facilityList}" var="facility">
        <tr>
            <td> ${facility.idF}</td>
            <td> ${facility.nameF}</td>
            <td> ${facility.areaF}</td>
            <td> ${facility.costF}</td>
            <td> ${facility.maxPeopleF}</td>

            <c:forEach items="${rentTypeList}" var="rentType">
                <c:if test="${rentType.idRT == facility.idRentType}">
                    <td>${rentType.nameRT}</td>
                </c:if>
            </c:forEach>

            <c:forEach items="${facilityTypeList}" var="facilityType">
                <c:if test="${facilityType.idFT == facility.idFacType}">
                    <td>${facilityType.nameFT}</td>
                </c:if>
            </c:forEach>

            <td> ${facility.standardRoom}</td>
            <td> ${facility.convenience}</td>
            <td> ${facility.poolArea}</td>
            <td> ${facility.floors}</td>
            <td> ${facility.freeF}</td>
            <td><a href="/facility?action=edit&idF=${facility.idF}">Edit</a></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="infoDelete('${facility.idF}','${facility.nameF}')">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<!-- Modal Xóa -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/facility" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Facility</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- id trung voi serverlet xoa-->
                    <input type="text" hidden name="idF" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span>Bạn có muốn xóa dịch vụ: </span>
                    <span id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không Xóa</button>
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
            "pageLength": 5
        });
    })
</script>
</body>
</html>
