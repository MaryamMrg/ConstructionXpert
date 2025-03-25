<%@ page import="com.example.constructionxpert.bean.Project" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Project</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">project List</h2>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>date of start</th>
            <th>Date of end</th>
            <th>Budget</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Project> projectlist = (List<Project>) request.getAttribute("projectlist");

            for (Project project : projectlist) {
        %>
        <tr>
            <td><%= project.getP_id() %></td>
            <td><%= project.getP_name() %></td>
            <td><%= project.getP_description() %></td>
            <td><%= project.getP_start_date() %></td>
            <td><%= project.getP_end_date() %></td>
            <td><%= project.getBudget() %></td>
            <td>
                <a href="ProjectServlet?action=update&P_id=<%= project.getP_id() %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="ProjectServlet?action=delete&P_id=<%= project.getP_id()%>" class="btn btn-danger btn-sm">Delete</a>
                <a href="TaskServlet?action=assigneTtoP&P_id=<%= project.getP_id()%>" class="btn btn-primary">add task</a>
                <a href="TaskServlet?action=TbyP&P_id=<%= project.getP_id()%>" class="btn btn-primary">tasks</a>



            </td>
        </tr>
        <%

            }
        %>
        </tbody>
    </table>

    <a href="add_Project.jsp" class="btn btn-success">Add new Project</a>
</div>

</body>
</html>
