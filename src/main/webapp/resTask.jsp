<%@ page import="com.example.constructionxpert.bean.Task" %>
<%@ page import="com.example.constructionxpert.bean.Resource" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Assign Resources to Task</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
        }
        .task-info {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        select, input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
        .message {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Assign Resources to Task</h1>

    <%-- Display Task Information --%>
    <div class="task-info">
        <h2>Task Details</h2>
        <%
            Task task = (Task) request.getAttribute("task");
            if (task != null) {
        %>
        <p><strong>Task ID:</strong> <%= task.getT_id() %></p>
        <p><strong>Name:</strong> <%= task.getT_name() %></p>
        <p><strong>Description:</strong> <%= task.getT_description() %></p>
        <p><strong>Start Date:</strong> <%= task.getT_start_date() %></p>
        <p><strong>End Date:</strong> <%= task.getT_end_date() %></p>
        <%
            }
        %>
    </div>

    <%-- Display success/error messages --%>
    <% if (request.getParameter("success") != null) { %>
    <div class="message success">
        Resource assigned successfully!
    </div>
    <% } else if (request.getParameter("error") != null) { %>
    <div class="message error">
        Error assigning resource. Please try again.
    </div>
    <% } %>

    <%-- Assignment Form --%>
    <h2>Assign New Resource</h2>
    <form action="AssigneServlet" method="post">
        <input type="hidden" name="T_id" value="<%=  task.getT_id() %>">
        <input type="hidden" name="action" value="assigne"  >

        <div class="form-group">
            <label for="select">Select Resource:</label>
            <select id="select" name="select" required>
                <option value="">-- Select Resource --</option>
                <%
                    List<Resource> allResources = (List<Resource>) request.getAttribute("resourcelist");
                    if (allResources != null) {
                        for (Resource resource : allResources) {
                %>
                <option value="<%= resource.getResource_id() %>">
                    <%= resource.getR_name() %> (<%= resource.getType() %>) - Available: <%= resource.getQuantity() %>
                </option>
                <%
                        }
                    }
                %>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" required>
        </div>

        <button type="submit">Assign Resource</button>
    </form>

    <%-- Display Assigned Resources --%>
    <h2>Currently Assigned Resources</h2>
    <%
        List<Resource> assignedResources = (List<Resource>) request.getAttribute("resourcelist");
        if (assignedResources != null && !assignedResources.isEmpty()) {
    %>
    <table>
        <thead>
        <tr>
            <th>Resource ID</th>
            <th>Name</th>
            <th>Type</th>
            <th>Quantity Used</th>
            <th>Supplier</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Resource resource : assignedResources) {
        %>
        <tr>
            <td><%= resource.getResource_id() %></td>
            <td><%= resource.getR_name() %></td>
            <td><%= resource.getType() %></td>
            <td><%= resource.getQuantity() %></td>
            <td><%= resource.getFornisseur() %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <%
    } else {
    %>
    <p>No resources have been assigned to this task yet.</p>
    <%
        }
    %>
</div>
</body>
</html>