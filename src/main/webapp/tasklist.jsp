<%@ page import="com.example.constructionxpert.bean.Task" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Tasks</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Tasks List</h2>

    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>date of start</th>
            <th>Date of end</th>

        </tr>
        </thead>
        <tbody>
        <%
            List<Task> tasklist = (List<Task>) request.getAttribute("tasklist");

            for (Task task : tasklist) {
        %>
        <tr>
            <td><%= task.getT_id() %></td>
            <td><%=  task.getT_name() %></td>
            <td><%= task.getT_description()%></td>
            <td><%= task.getT_start_date() %></td>
            <td><%= task.getT_end_date()%></td>

            <td>
                <a href="TaskServlet?action=update&T_id=<%= task.getT_id()%>" class="btn btn-warning btn-sm">Edit</a>
                <a href="TaskServlet?action=delete&T_id=<%= task.getT_id()%>" class="btn btn-danger btn-sm">Delete</a>




            </td>
        </tr>
        <%

            }
        %>
        </tbody>
    </table>

    <a href="add_task.jsp" class="btn btn-success">Add new task</a>
</div>

</body>
</html>
