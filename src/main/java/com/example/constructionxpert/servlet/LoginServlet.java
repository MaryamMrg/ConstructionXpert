package com.example.constructionxpert.servlet;

import com.example.constructionxpert.Dao.UserDao;
import com.example.constructionxpert.bean.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
private UserDao userdao;

    @Override
    public void init() throws ServletException {
        userdao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String username = req.getParameter("username");
       String password = req.getParameter("user_password");

        User user =userdao.getUser(username,password);
        if(user!=null){
            HttpSession session=req.getSession();
            session.setAttribute("user",user);
            resp.sendRedirect(req.getContextPath()+"/Home");
        }else {
            req.setAttribute("error","Invalid username or password");
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }
    }




}
