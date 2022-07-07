<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <%--    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/boostrap/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/boostrap/datatables/css/dataTables.bootstrap4.min.css"/>
</head>
<body>
<h1>Customer List</h1>
<a href="/customer?action=create">Create Customer</a>

<div align="center" class="container-fluid">
    <table class="table text-center table-striped" id="table">
        <thead>
        <tr>
            <th>id_cus</th>
            <th>id_cus_type</th>
            <th>name</th>
            <th>day_of_birth</th>
            <th>gender</th>
            <th>id_card</th>
            <th>phone</th>
            <th>email</th>
            <th>address</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${customerList}" var="customer">
            <tr>
                <td> ${customer.idCustomer}</td>
                <c:forEach items="${customerTypeList}" var="cusType">
                    <c:if test="${cusType.idCusType == customer.idCusType}">
                        <td>${cusType.nameCusType}</td>
                    </c:if>
                </c:forEach>
                <td> ${customer.name}</td>
                <td> ${customer.dayOfBirth}</td>
<%--                           <td> ${customer.gender}</td>--%>
                <c:if test="${customer.gender == 0}">
                    <td>Male</td>
                </c:if>
                <c:if test="${customer.gender == 1}">
                    <td>Female</td>
                </c:if>

                <td> ${customer.idCard}</td>
                <td> ${customer.phoneNumber}</td>
                <td> ${customer.email}</td>
                <td> ${customer.address}</td>
                <td>
                    <button class="btn btn-primary" type="button">
                        <a href="/customer?action=edit&idC=${customer.idCustomer}"
                           style="color: white; text-decoration: none ">Edit</a>
                    </button>
                </td>
                <td>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                            onclick="infoDelete('${customer.idCustomer}','${customer.name}')">Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal Xóa -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <form action="/customer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Customer</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- id trung voi serverlet xoa-->
                    <input type="text" hidden name="idC" id="idDelete">
                    <input type="text" hidden name="action" value="delete">
                    <span>Bạn có muốn xóa khách hàng: </span>
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

<script>
    $(document).ready(function () {
        $('#table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    })
</script>
<%--<script src="../bootstrap/js/bootstrap.bundle.js"></script>--%>

</body>
</html>
