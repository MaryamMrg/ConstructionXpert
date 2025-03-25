package com.example.constructionxpert.Dao;

import com.example.constructionxpert.bean.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection con;
    public UserDao() {

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionxpert","root","");
            System.out.println("Connected to the database successfully");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Failed to connect to database");
        }
    }
    public User getUser(String username,String password) {
        User user = null;
        String sql = "select * from useer where username=? and user_password=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setString(1,username);
            ps.setString(2,password);
            try(ResultSet rs = ps.executeQuery()){
                while(rs.next()){
                    user = new User();
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("user_password"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
