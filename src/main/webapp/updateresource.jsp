<%@ page import="com.example.constructionxpert.bean.Project" %>
<%@ page import="com.example.constructionxpert.bean.Resource" %><%--
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
    <h2 class="text-center mb-4">Update Resource</h2>

    <%
        Resource resource =(Resource) request.getAttribute("resource");


    %>

    <form action="ResourceServlet" method="post">
        <input type="hidden" name="resource_id" value="<%= resource.getResource_id() %>"/>
        <input type="hidden" name="action" value="update"/>

        <div class="form-group">
            <input type="text" class="form-control" name="R_name" value="<%=resource.getR_name() %>" required />
        </div>

        <div class="form-group">
            <input type="text" class="form-control" name="type" value="<%= resource.getType() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="quantity" value="<%= resource.getQuantity() %>" required />
        </div>
        <div class="form-group">
            <input type="text" class="form-control" name="fornisseur" value="<%=resource.getFornisseur()%>" required />
        </div>


        <button type="submit" class="btn btn-primary btn-block">Update</button>
    </form>


    <br>
    <a href="ResourceServlet" class="btn btn-secondary"> <- list </a>
</div>

</body>
</html>
