package com.example.constructionxpert.bean;

public class Task {

    private int T_id;
    private String T_name;
    private String T_description;
    private String T_start_date;
    private String T_end_date;
    private int resource_id;
    private int P_id;

    public Task() {
    }



    public Task( String name, String description, String start, String end) {

        T_name=name;
        T_description=description;
        T_start_date=start;
        T_end_date=end;
    }


    public int getT_id() {
        return T_id;
    }

    public void setT_id(int t_id) {
        T_id = t_id;
    }

    public String getT_name() {
        return T_name;
    }

    public void setT_name(String t_name) {
        T_name = t_name;
    }

    public String getT_description() {
        return T_description;
    }

    public void setT_description(String t_description) {
        T_description = t_description;
    }

    public String getT_start_date() {
        return T_start_date;
    }

    public void setT_start_date(String t_start_date) {
        T_start_date = t_start_date;
    }

    public String getT_end_date() {
        return T_end_date;
    }

    public void setT_end_date(String t_end_date) {
        T_end_date = t_end_date;
    }

    public int getResource_id() {
        return resource_id;
    }

    public void setResource_id(int resource_id) {
        this.resource_id = resource_id;
    }

    public int getP_id() {
        return P_id;
    }

    public void setP_id(int p_id) {
        P_id = p_id;
    }
}
