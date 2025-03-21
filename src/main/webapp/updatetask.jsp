<%@ page import="com.example.constructionxpert.bean.Project" %>
<%@ page import="com.example.constructionxpert.bean.Task" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 20/03/2025
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>update form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Update Task</h2>

    <%
        Task task = (Task) request.getAttribute("task");
    %>

    <form action="TaskServlet" method="post">
        <input type="hidden" name="T_id" value="<%= task.getT_id() %>"/>
        <input type="hidden" name="action" value="update"/>

        <div class="form-group">
            <input type="text" class="form-control" name="T_name" value="<%= task.getT_name() %>" required />
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="T_description" value="<%=task.getT_description() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="T_start_date" value="<%= task.getT_start_date() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="T_end_date" value="<%=  task.getT_end_date()%>" required />
        </div>


        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>


    <br>
    <a href="TaskServlet" class="btn btn-secondary"> <- list </a>
</div>

</body>
</html>
