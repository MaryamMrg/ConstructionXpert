package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.AssigneR_to_T_Dao;
import com.example.constructionxpert.Dao.ResourceDao;
import com.example.constructionxpert.Dao.TaskDao;
import com.example.constructionxpert.bean.Resource;
import com.example.constructionxpert.bean.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/AssigneServlet")
public class AssignementServlet extends HttpServlet {
    private AssigneR_to_T_Dao rtd=new AssigneR_to_T_Dao();
    private TaskDao td =new TaskDao();
    private ResourceDao rd=new ResourceDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action=req.getParameter("action");
        if ("assigne".equals(action)){
            int id=Integer.parseInt(req.getParameter("T_id"));

            List<Resource> resourcelist =rtd.getRbyTid(id);
            req.setAttribute("resourcelist",resourcelist);
            req.getRequestDispatcher("resTask.jsp").forward(req,resp);
        }else {
            int id = Integer.parseInt(req.getParameter("T_id"));
            Task task= td.gettaskbyId(id);
            req.setAttribute("task",task);

            List<Resource> resourcelist =rd.getallresource();
            req.setAttribute("resourcelist",resourcelist);
            req.getRequestDispatcher("resTask.jsp").forward(req,resp);


        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int T_id = Integer.parseInt(req.getParameter("T_id"));
        int resource_id = Integer.parseInt(req.getParameter("select"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
       rtd.updateQuantity(resource_id,quantity);
      rtd.assigneResourceToTask(T_id,resource_id);
        resp.sendRedirect(req.getContextPath()+"/TaskServlet");

    }
}
