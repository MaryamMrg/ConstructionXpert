package com.example.constructionxpert.Dao;

import com.example.constructionxpert.bean.Resource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AssigneR_to_T_Dao {

private Connection con;
public AssigneR_to_T_Dao(){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con= DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionxpert","root","");
        System.out.println("Connected to the database successfully");

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("Failed to connect to database");;
    }
}


    public void assigneResourceToTask(int T_id,int resource_id){
    String sql ="insert into task_res(T_id,resource_id) values(?,?)";
    try (PreparedStatement ps=con.prepareStatement(sql)){

        ps.setInt(1,T_id);
        ps.setInt(2,resource_id);
        ps.executeUpdate();
        System.out.println("goood");

    }catch (Exception e){
        e.printStackTrace();
        System.out.println("failed");
    }
    }
  public List<Resource> getRbyTid(int T_id){
      List<Resource> resourcelist = new ArrayList<>();
      String sql = "SELECT r.resource_id, r.R_name, r.type, r.quantity, r.fornisseur " +
              "FROM resource r " +
              "JOIN task_res tr ON r.resource_id = tr.resource_id " +
              "WHERE tr.T_id = ?";

      try(PreparedStatement ps= con.prepareStatement(sql)){
        ps.setInt(1,T_id);

        try(ResultSet rs =ps.executeQuery()){
            while (rs.next()){
                int resource_id=rs.getInt("resource_id");
                String name =rs.getString("R_name");
                String type =rs.getString("type");
                int quantity=rs.getInt("quantity");
                String fornisseur =rs.getString("fornisseur");

                Resource resource =new Resource(resource_id,name,type,quantity,fornisseur);

                resourcelist.add(resource);
            }
        }
    }catch (Exception e){
        e.printStackTrace();
    }

    return resourcelist;

  }


  public  void updateQuantity(int resource_id,int quantityused){
    String sql="update resource set quantity=quantity-?where resource_id=?";
    try(PreparedStatement ps= con.prepareStatement(sql)){
        ps.setInt(1,quantityused);
        ps.setInt(2,resource_id);
        ps.executeUpdate();


    } catch (Exception e) {
        e.printStackTrace();
    }

  }


}
