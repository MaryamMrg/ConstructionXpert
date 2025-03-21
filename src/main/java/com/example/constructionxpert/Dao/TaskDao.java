package com.example.constructionxpert.Dao;

import com.example.constructionxpert.bean.Project;
import com.example.constructionxpert.bean.Task;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TaskDao {
private Connection con;
public TaskDao() {
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionxpert","root","");
        System.out.println("Connected to the database successfully");

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("Failed to connect to database");;
    }
}

public void addTask(Task t) {
    String sql="insert into task(T_name,T_description,T_start_date,T_end_date) values(?,?,?,?)";
    try(PreparedStatement ps = con.prepareStatement(sql)){
        ps.setString(1,t.getT_name());
        ps.setString(2,t.getT_description());
        ps.setString(3,t.getT_start_date());
        ps.setString(4,t.getT_end_date());

        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }

}
public List<Task> getalltasks(){
    List<Task> tasklist = new ArrayList<>();
    String sql ="select * from task";
    try(PreparedStatement ps =con.prepareStatement(sql); ResultSet rs=ps.executeQuery()){
        while(rs.next()){
            Task task=new Task();
            task.setT_id(rs.getInt("T_id"));
            task.setT_name(rs.getString("T_name"));
            task.setT_description(rs.getString("T_description"));
            task.setT_start_date(rs.getString("T_start_date"));
            task.setT_end_date(rs.getString("T_end_date"));

            tasklist.add(task);

        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return tasklist;
}
public Task gettaskbyId(int id) {
    Task task =null;
    String sql ="select * from task where T_id=?";
    try(PreparedStatement ps = con.prepareStatement(sql)){
        ps.setInt(1, id);
        try(ResultSet rs= ps.executeQuery()) {

            while (rs.next()) {
                task = new Task();
                task.setT_id(rs.getInt("T_id"));
                task.setT_name(rs.getString("T_name"));
                task.setT_description(rs.getString("T_description"));
                task.setT_start_date(rs.getString("T_start_date"));
                task.setT_end_date(rs.getString("T_end_date"));




            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return task;



}

public void updatetask(Task task){
    String sql ="update task set T_name=?,T_description=?,T_start_date=?,T_end_date=? where T_id=? ";
    try(PreparedStatement ps =con.prepareStatement(sql)){
        ps.setString(1,task.getT_name());
        ps.setString(2,task.getT_description());
        ps.setString(3,task.getT_start_date());
        ps.setString(4,task.getT_end_date());
        ps.setInt(5,task.getT_id());
        ps.executeUpdate();


    } catch (Exception e) {
        e.printStackTrace();
    }


}


    public void deletetask(int id){
        String sql="delete from task where T_id=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
