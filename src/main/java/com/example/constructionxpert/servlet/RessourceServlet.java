package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.ResourceDao;
import com.example.constructionxpert.bean.Project;
import com.example.constructionxpert.bean.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/ResourceServlet")
public class RessourceServlet extends HttpServlet {
    private ResourceDao rd;

    @Override
    public void init() throws ServletException {
        rd=new ResourceDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String action =req.getParameter("action");
        if("update".equals(action)){
            int id=Integer.parseInt(req.getParameter("resource_id"));
            Resource resource =rd.getResourcebyId(id);
            req.setAttribute("resource",resource);
            req.getRequestDispatcher("updateresource.jsp").forward(req,resp);



        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("resource_id"));
            rd.deletersource(id);
            resp.sendRedirect(req.getContextPath()+"/ResourceServlet");

        }else{
            List<Resource> resourcelist =rd.getallresource();
            req.setAttribute("resourcelist",resourcelist);
            req.getRequestDispatcher("resourcelist.jsp").forward(req,resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if("update".equals(action)){
            int id=Integer.parseInt(req.getParameter("resource_id"));
            String name=req.getParameter("R_name");
            String type=req.getParameter("type");
            int quantity=Integer.parseInt(req.getParameter("quantity"));
            String fournisseur=req.getParameter("fornisseur");

            Resource resource=new Resource(name,type,quantity,fournisseur);
            resource.setResource_id(id);
            rd.updateresource(resource);

        }else {
            String name=req.getParameter("R_name");
            String type=req.getParameter("type");
            int quantity=Integer.parseInt(req.getParameter("quantity"));
            String fournisseur=req.getParameter("fornisseur");

            Resource resource=new Resource(name,type,quantity,fournisseur);
            rd.add_resource(resource);

        }
        resp.sendRedirect(req.getContextPath()+"/ResourceServlet");


    }
}
