package com.example.constructionxpert.Dao;

import com.example.constructionxpert.bean.Project;
import com.example.constructionxpert.bean.Resource;
import com.example.constructionxpert.bean.Task;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ResourceDao {
    private Connection con;
    public ResourceDao(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/constructionxpert","root","");
            System.out.println("Connected to the database successfully");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Failed to connect to database");;
        }
    }

 public void add_resource(Resource r){
     String sql="insert into resource(R_name,type,quantity,fornisseur) values(?,?,?,?)";
     try(PreparedStatement ps = con.prepareStatement(sql)){
         ps.setString(1,r.getR_name());
         ps.setString(2,r.getType());
         ps.setInt(3,r.getQuantity());
         ps.setString(4,r.getFornisseur());

         ps.executeUpdate();
     } catch (Exception e) {
         e.printStackTrace();
     }
 }

    public List<Resource> getallresource(){
        List<Resource> resourcelist = new ArrayList<>();
        String sql ="select * from resource";
        try(PreparedStatement ps =con.prepareStatement(sql); ResultSet rs=ps.executeQuery()){
            while(rs.next()){
                Resource r=new Resource();
                r.setResource_id(rs.getInt("resource_id"));
                r.setR_name(rs.getString("R_name"));
                r.setType(rs.getString("type"));
                r.setQuantity(rs.getInt("quantity"));
                r.setFornisseur(rs.getString("fornisseur"));
                 resourcelist.add(r);


            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return resourcelist;
    }



    public Resource getResourcebyId(int id) {
        Resource r =null;
        String sql ="select * from resource where resource_id=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1, id);
            try(ResultSet rs= ps.executeQuery()) {

                while (rs.next()) {
                    r= new Resource();
                    r.setResource_id(rs.getInt("resource_id"));
                    r.setR_name(rs.getString("R_name"));
                    r.setType(rs.getString("type"));
                    r.setQuantity(rs.getInt("quantity"));
                    r.setFornisseur(rs.getString("fornisseur"));


                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return r;



    }

    public void updateresource(Resource r){
        String sql ="update resource set R_name=?,type=?,quantity=?,fornisseur=? where resource_id=?";
        try(PreparedStatement ps =con.prepareStatement(sql)){
            ps.setString(1,r.getR_name());
            ps.setString(2,r.getType());
            ps.setInt(3,r.getQuantity());
            ps.setString(4,r.getFornisseur());
            ps.setInt(5,r.getResource_id());

            ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void deletersource(int id){
        String sql="delete from resource where resource_id=?";
        try(PreparedStatement ps = con.prepareStatement(sql)){
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
