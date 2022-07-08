<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 04-Jul-22
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">

</head>
<body>
<div class="col-12 container-fluid ">

    <div class="container">
        <div class="row" style="align-items: center">
            <div class="col">
                <img src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png" alt="">
            </div>
            <div class="col">
                <img src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png" alt="">
            </div>
            <div class="col">
                Đỗ Trọng Hoàng - C0322G1
            </div>
        </div>
    </div>


</div>
<div class="col-12 container-fluid h-100">
    <div class="row border border-5 mt-2 mb-2 ">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="http://localhost:8080/employee">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="http://localhost:8080/customer">Customer</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="http://localhost:8080/facility">Facility</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Contact</a>
                        </li>
                    </ul>
                    <%--                        <form class="d-flex">--%>
                    <%--                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">--%>
                    <%--                            <button class="btn btn-outline-success" type="submit">Search</button>--%>
                    <%--                        </form>--%>
                </div>
            </div>
        </nav>
    </div>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 ">
        <div class="col-3  border-5" style="height: 500px">
            <div class="col-12  ">
                <div class="card" style="width: 18rem;">
                    <ul class="list-group list-group-flush">
                        <%--                            <li class="list-group-item">An item</li>--%>
                        <%--                            <li class="list-group-item">A second item</li>--%>
                        <%--                            <li class="list-group-item">A third item</li>--%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-9 border border-5 " style="height: 500px">
            <div><span class="col-12 text-center"> Body...</span></div>
        </div>
    </div>
</div>
<div class="col-12 container-fluid">
    <div class="row border border-5 mt-2">
        <div class="row "><span class="text-center"> Footer...</span></div>


    </div>
</div>
</div>
<script src="../bootstrap/js/bootstrap.bundle.js"></script>

</body>
</html>
