package com.example.constructionxpert.bean;

public class Resource {
    private String R_name;
    private String type;
    private int quantity;
    private String fornisseur;
    private int resource_id;
    private  int T_id;

    public Resource() {
    }

    public Resource(String r_name, String type, int quantity, String fornisseur) {
        R_name = r_name;
        this.type = type;
        this.quantity = quantity;
        this.fornisseur = fornisseur;
    }

    public String getR_name() {
        return R_name;
    }

    public void setR_name(String r_name) {
        R_name = r_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getFornisseur() {
        return fornisseur;
    }

    public void setFornisseur(String fornisseur) {
        this.fornisseur = fornisseur;
    }

    public int getResource_id() {
        return resource_id;
    }

    public void setResource_id(int resource_id) {
        this.resource_id = resource_id;
    }

    public int getT_id() {
        return T_id;
    }

    public void setT_id(int t_id) {
        T_id = t_id;
    }
}
