<%@ page import="com.example.constructionxpert.bean.Project" %>
<%@ page import="com.example.constructionxpert.bean.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project Tasks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
    <%
        Project project = (Project) request.getAttribute("project");

        List<Task> tasks = (List<Task>) request.getAttribute("tasklist");
    %>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <h3><%= project.getP_name() %></h3>
        </div>
        <div class="card-body">
            <p><strong>Description:</strong> <%= project.getP_description() %></p>
            <p><strong>Duration:</strong> <%= project.getP_start_date() %> to <%= project.getP_end_date() %></p>
            <p><strong>Budget:</strong> <%= project.getBudget() %></p>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Project Tasks</h4>
        <a href="TaskServlet?action=assigneTtoP&P_id=<%= project.getP_id() %>"
           class="btn btn-primary">Add New Task</a>
    </div>

    <% if (tasks != null && !tasks.isEmpty()) { %>
    <table class="table table-bordered table-hover">
        <thead class="table-light">
        <tr>
            <th>Task Name</th>
            <th>Description</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (Task task : tasks) { %>
        <tr>
            <td><%= task.getT_name() %></td>
            <td><%= task.getT_description() %></td>
            <td><%= task.getT_start_date() %></td>
            <td><%= task.getT_end_date() %></td>
            <td>
                <a href="TaskServlet?action=update&T_id=<%= task.getT_id() %>"
                   class="btn btn-sm btn-outline-warning">Edit</a>
                <a href="TaskServlet?action=delete&T_id=<%= task.getT_id() %>"
                   class="btn btn-sm btn-outline-danger"
                   onclick="return confirm('Are you sure you want to delete this task?')">Delete</a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <% } else { %>
    <div class="alert alert-info">
        No tasks found for this project. Click "Add New Task" to create one.
    </div>
    <% } %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>