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
        <h2 class="card-title text-center mb-4">add a new Project</h2>
        <form action="ProjectServlet" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">description</label>
                <input type="text" class="form-control" id="description" name="description">
            </div>
            <div class="mb-3">
                <label for="date_start" class="form-label">date of start</label>
                <input type="text" class="form-control" id="date_start" name="date_start">
            </div>
            <div class="mb-3">
                <label for="date_end" class="form-label">date of end</label>
                <input type="text" class="form-control" id="date_end" name="date_end">
            </div>
            <div class="mb-3">
                <label for="budget" class="form-label">budget</label>
                <input type="text" class="form-control" id="budget" name="budget">
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
