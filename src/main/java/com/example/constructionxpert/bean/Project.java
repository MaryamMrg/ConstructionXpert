package com.example.constructionxpert.bean;

public class Project {
    private int P_id;
    private String P_name;
    private String P_description;
    private String P_start_date;
    private String P_end_date;
    private String budget;

    public Project() {
    }

    public Project(int p_id, String p_name, String p_description, String p_start_date, String p_end_date, String budget) {
        P_id = p_id;
        P_name = p_name;
        P_description = p_description;
        P_start_date = p_start_date;
        P_end_date = p_end_date;
        this.budget = budget;
    }

    public Project(String name, String description, String start, String end, String budget) {
        P_name = name;
        P_description = description;
        P_start_date = start;
        P_end_date = end;
        this.budget = budget;
    }

    public int getP_id() {
        return P_id;
    }

    public void setP_id(int p_id) {
        P_id = p_id;
    }

    public String getP_name() {
        return P_name;
    }

    public void setP_name(String p_name) {
        P_name = p_name;
    }

    public String getP_description() {
        return P_description;
    }

    public void setP_description(String p_description) {
        P_description = p_description;
    }

    public String getP_start_date() {
        return P_start_date;
    }

    public void setP_start_date(String p_start_date) {
        P_start_date = p_start_date;
    }

    public String getP_end_date() {
        return P_end_date;
    }

    public void setP_end_date(String p_end_date) {
        P_end_date = p_end_date;
    }

    public String getBudget() {
        return budget;
    }

    public void setBudget(String budget) {
        this.budget = budget;
    }
}
