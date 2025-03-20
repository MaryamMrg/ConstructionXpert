<%@ page import="com.example.constructionxpert.bean.Project" %><%--
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
    <h2 class="text-center mb-4">Update Project</h2>

    <%
        Project project = (Project) request.getAttribute("project");
    %>

    <form action="ProjectServlet" method="post">
        <input type="hidden" name="P_id" value="<%= project.getP_id() %>"/>
        <input type="hidden" name="action" value="update"/>

        <div class="form-group">
            <input type="text" class="form-control" name="name" value="<%=project.getP_name() %>" required />
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="description" value="<%=project.getP_description() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="date_start" value="<%=project.getP_start_date() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="date_end" value="<%=project.getP_end_date()%>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="budget" value="<%=project.getBudget()%>" required />
        </div>

        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>


    <br>
    <a href="ProjectServlet" class="btn btn-secondary"> <- list </a>
</div>

</body>
</html>
