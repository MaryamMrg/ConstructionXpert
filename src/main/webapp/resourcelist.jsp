
<%@ page import="java.util.List" %>
<%@ page import="com.example.constructionxpert.bean.Resource" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Resources</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Resources List</h2>

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
            List<Resource> resourcelist = (List<Resource>) request.getAttribute("resourcelist");

            for (Resource resource : resourcelist) {
        %>
        <tr>
            <td><%= resource.getResource_id() %></td>
            <td><%=  resource.getR_name() %></td>
            <td><%= resource.getType()%></td>
            <td><%= resource.getQuantity() %></td>
            <td><%= resource.getFornisseur()%></td>

            <td>
                <a href="ResourceServlet?action=update&resource_id=<%= resource.getResource_id()%>" class="btn btn-warning btn-sm">Edit</a>
                <a href="ResourceServlet?action=delete&resource_id=<%= resource.getResource_id()%>" class="btn btn-danger btn-sm">Delete</a>




            </td>
        </tr>
        <%

            }
        %>
        </tbody>
    </table>

    <a href="add_resource.jsp" class="btn btn-success">Add new resource</a>
</div>

</body>
</html>
