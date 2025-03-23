<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 15/02/2025
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CnstructionXpert</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
</head>
<body class="bg-light" >

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">ConstructionXpert</a>
    </div>
</nav>

<div class="container my-5">
    <div class="card-body">
        <h2 class="card-title text-center mb-4">add a new resource</h2>
        <form action="ResourceServlet" method="post">
            <div class="mb-3">
                <label for="R_name" class="form-label">Name of resource</label>
                <input type="text" class="form-control" id="R_name" name="R_name">
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">type</label>
                <input type="text" class="form-control" id="type" name="type">
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">quantity</label>
                <input type="number" class="form-control" id="quantity" name="quantity">
            </div>
            <div class="mb-3">
                <label for="fornisseur" class="form-label">Fornisseur</label>
                <input type="text" class="form-control" id="fornisseur" name="fornisseur">
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
