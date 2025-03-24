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
        <h2 class="card-title text-center mb-4">add a new task</h2>
        <form action="TaskServlet" method="post">
            <div class="mb-3">
                <label for="T_name" class="form-label">Name of task</label>
                <input type="text" class="form-control" id="T_name" name="T_name">
            </div>
            <div class="mb-3">
                <label for="T_description" class="form-label">description</label>
                <input type="text" class="form-control" id="T_description" name="T_description">
            </div>
            <div class="mb-3">
                <label for="T_start_date" class="form-label">date of start</label>
                <input type="date" class="form-control" id="T_start_date" name="T_start_date">
            </div>
            <div class="mb-3">
                <label for="T_end_date" class="form-label">date of end</label>
                <input type="date" class="form-control" id="T_end_date" name="T_end_date">
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
