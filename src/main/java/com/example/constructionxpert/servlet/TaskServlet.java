package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.TaskDao;

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

        }else{
            List<Task> tasklist =td.getalltasks();
            req.setAttribute("tasklist",tasklist);
            req.getRequestDispatcher("tasklist.jsp").forward(req,resp);

        }




    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if("update".equals(action)){
            int id = Integer.parseInt(req.getParameter("T_id"));
            String name=req.getParameter("T_name");
            String description=req.getParameter("T_description");
            String start=req.getParameter("T_start_date");
            String end=req.getParameter("T_end_date");

            Task task = new  Task( name, description, start, end);
            task.setT_id(id);
            td.updatetask(task);

        }else {

            String name=req.getParameter("T_name");
            String description=req.getParameter("T_description");
            String start=req.getParameter("T_start_date");
            String end=req.getParameter("T_end_date");

            Task task = new  Task(name, description, start, end);
             td.addTask(task);

        }
        resp.sendRedirect(req.getContextPath()+"/TaskServlet");

    }
}
