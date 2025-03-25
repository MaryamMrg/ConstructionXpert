package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.AssigneR_to_T_Dao;
import com.example.constructionxpert.Dao.ProjectDao;
import com.example.constructionxpert.Dao.TaskDao;

import com.example.constructionxpert.bean.Project;
import com.example.constructionxpert.bean.Resource;
import com.example.constructionxpert.bean.Task;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
private TaskDao td;
private AssigneR_to_T_Dao rtd= new AssigneR_to_T_Dao();
private ProjectDao pd=new ProjectDao();

    @Override
    public void init() throws ServletException {
        td=new TaskDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if("update".equals(action)){
            int id=Integer.parseInt(req.getParameter("T_id"));
            Task task = td.gettaskbyId(id);
            req.setAttribute("task",task);
            req.getRequestDispatcher("updatetask.jsp").forward(req,resp);



        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("T_id"));
            td.deletetask(id);
            resp.sendRedirect(req.getContextPath()+"/TaskServlet");

        /*} else if ("newtask".equals(action)) {
            int P_id = Integer.parseInt(req.getParameter("P_id"));
            ProjectDao pd=new ProjectDao();
            Project project=pd.getProjectbyId(P_id);
            req.setAttribute("project",project);
            req.getRequestDispatcher("add_task.jsp").forward(req,resp);*/

        } else if ("TbyP".equals(action)) {
            int P_id = Integer.parseInt(req.getParameter("P_id"));
           List<Task> tasklist =td.getTaskByProjectId(P_id);
           req.setAttribute("tasklist",tasklist);
           Project project=pd.getProjectbyId(P_id);
           req.setAttribute("project",project);
           req.getRequestDispatcher("taskproject.jsp").forward(req,resp);

        } else if ("assigneTtoP".equals(action)) {
            int P_id = Integer.parseInt(req.getParameter("P_id"));
            ProjectDao pd=new ProjectDao();
            Project project=pd.getProjectbyId(P_id);

            req.setAttribute("project",project);

            req.getRequestDispatcher("add_task.jsp").forward(req,resp);
        } else{
            int P_id=Integer.parseInt(req.getParameter("P_id"));
            resp.sendRedirect(req.getContextPath()+"/TaskServlet?action=TbyP&P_id"+P_id);
         /*   List<Task> tasklist =td.getalltasks();
            for (Task task : tasklist){
                List<Resource> resourcelist =rtd.getRbyTid(task.getT_id());
                req.setAttribute("resourcelist"+task.getT_id(),resourcelist);
            }
            req.setAttribute("tasklist",tasklist);
            req.getRequestDispatcher("tasklist.jsp").forward(req,resp);
*/

        }




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("T_id"));
            String name = req.getParameter("T_name");
            String description = req.getParameter("T_description");
            String start = req.getParameter("T_start_date");
            String end = req.getParameter("T_end_date");
            int P_id = Integer.parseInt(req.getParameter("P_id"));
            Task task = new Task(name, description, start, end);
            task.setT_id(id);
            task.setP_id(P_id);
            td.updatetask(task);
            resp.sendRedirect(req.getContextPath()+"/TaskServlet?action=TbyP&P_id"+P_id);

        } else if ("assigneTtoP".equals(action)) {
            String T_name = req.getParameter("T_name");
            String T_description = req.getParameter("T_description");
            String T_start_date = req.getParameter("T_start_date");
            String T_end_date = req.getParameter("T_end_date");
            int P_id = Integer.parseInt(req.getParameter("P_id"));
            Task task = new Task(T_name, T_description, T_start_date, T_end_date);
            task.setP_id(P_id);
            td.assigneTtoP(task);
    resp.sendRedirect(req.getContextPath()+"/TaskServlet?action=TbyP&P_id"+P_id);





        }
    }
}
