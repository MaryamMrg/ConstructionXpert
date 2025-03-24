
<%@ page import="java.util.List" %>
<%@ page import="com.example.constructionxpert.bean.Task" %>
<%@ page import="com.example.constructionxpert.bean.Resource" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
<%
    Task task =(Task) request.getAttribute("task") ;

%>
<form action="AssigneServlet" method="post">
    <input type="hidden" name="T_id" value="<%= task.getT_id() %>">
    <input type="hidden" name="action" value="assigne">


    <div class="form-group">
        <label for="select">RESOURCES :</label>
        <select name="select" class="form-control" id="select" style="margin-bottom: 40px">
            <%
                List<Resource> resourcelist =(List<Resource>) request.getAttribute("resourcelist");


                for (Resource resource : resourcelist) {
            %>
            <option value="<%=resource.getResource_id()%>"><%=resource.getR_name() %>

                <p style="color: bisque">QUANTITE</p> <%=resource.getQuantity()%></option>
            <%
                }
            %>
        </select>
        <input type="number" name="quantity" placeholder="Quantity">
    </div>
    <button type="submit" class="btn btn-primary">Assigner</button>
</form>

</body>
</html>