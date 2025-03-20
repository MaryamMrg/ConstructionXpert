package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.ProjectDao;
import com.example.constructionxpert.bean.Project;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
    private ProjectDao pd;

    @Override
    public void init() throws ServletException {
       pd=new ProjectDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if("update".equals(action)){
            int id=Integer.parseInt(req.getParameter("P_id"));
            Project project = pd.getProjectbyId(id);
            req.setAttribute("project",project);
            req.getRequestDispatcher("updateproject.jsp").forward(req,resp);



        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("P_id"));
            pd.deleteProject(id);
            resp.sendRedirect(req.getContextPath()+"/ProjectServlet");

        }else{
            List<Project> projectlist =pd.getallProject();
            req.setAttribute("projectlist",projectlist);
            req.getRequestDispatcher("Projectlist.jsp").forward(req,resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String action =req.getParameter("action");
      if("update".equals(action)){
          int id=Integer.parseInt(req.getParameter("P_id"));
          String name=req.getParameter("name");
          String description=req.getParameter("description");
          String start=req.getParameter("date_start");
          String end=req.getParameter("date_end");
          String budget=req.getParameter("budget");

          Project project=new Project(name,description,start,end,budget);
          project.setP_id(id);
          pd.modifyProject(project);
      }else {
          String name=req.getParameter("name");
          String description=req.getParameter("description");
          String start=req.getParameter("date_start");
          String end=req.getParameter("date_end");
          String budget=req.getParameter("budget");
          Project project=new Project(name,description,start,end,budget);
          pd.addProject(project);
      }
      resp.sendRedirect(req.getContextPath()+"/ProjectServlet");
    }
}
