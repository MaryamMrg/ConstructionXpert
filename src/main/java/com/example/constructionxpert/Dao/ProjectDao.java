package com.example.constructionxpert.Dao;

import com.example.constructionxpert.bean.Project;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProjectDao {

private Connection con;

    public ProjectDao() {


        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionxpert","root","");
            System.out.println("Connected to the database successfully");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Failed to connect to database");;
        }
    }


 public void addProject(Project p) {
      String sql = "insert into project(name,description,date_start,date_end,budget) values(?,?,?,?,?)";
      try (PreparedStatement ps = con.prepareStatement(sql)) {


          ps.setString(1, p.getP_name());
          ps.setString(2, p.getP_description());
          ps.setString(3, p.getP_start_date());
          ps.setString(4, p.getP_end_date());
          ps.setString(5, p.getBudget());
          ps.executeUpdate();
      } catch (SQLException e) {
          e.printStackTrace();
      }

  }

 public List<Project> getallProject(){
        List<Project> projectlist = new ArrayList<>();
        String sql ="select * from project";
        try(Statement ps = con.createStatement(); ResultSet rs= ps.executeQuery(sql)){
            while (rs.next()){
                Project project=new Project();
                project.setP_id(rs.getInt("P_id"));
                project.setP_name(rs.getString("name"));
                project.setP_description(rs.getString("description"));
                project.setP_start_date(rs.getString("date_start"));
                project.setP_end_date(rs.getString("date_end"));
                project.setBudget(rs.getString("budget"));

          projectlist.add(project);

            }



        } catch (Exception e) {
            e.printStackTrace();
        }
        return projectlist;
 }
 public Project getProjectbyId(int id){
        Project project=null;
        String sql ="select * from project where P_id=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1, id);
            try(ResultSet rs= ps.executeQuery()) {

                while (rs.next()) {
                    project = new Project();
                    project.setP_id(rs.getInt("P_id"));
                    project.setP_name(rs.getString("name"));
                    project.setP_description(rs.getString("description"));
                    project.setP_start_date(rs.getString("date_start"));
                    project.setP_end_date(rs.getString("date_end"));
                    project.setBudget(rs.getString("budget"));


                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return project;

 }
 public void modifyProject(Project project){
        String sql ="update project set name=?,description=?,date_start=?,date_end=?,budget=? where P_id=?";
        try(PreparedStatement ps =con.prepareStatement(sql)){
            ps.setString(1,project.getP_name());
            ps.setString(2,project.getP_description());
            ps.setString(3,project.getP_start_date());
            ps.setString(4,project.getP_end_date());
            ps.setString(5,project.getBudget());
            ps.setInt(6,project.getP_id());
            ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }
 }
 public void deleteProject(int id){
        String sql="delete from project where P_id=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
             ps.setInt(1,id);
             ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
 }

}
