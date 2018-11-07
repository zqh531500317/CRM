package com.zqh.crm.pojo;


import java.util.Date;

public class Visit {
    private Integer cus_id;
    private Integer lm_id;
    private String cus_name;
    private String lm_name;
    private String address;
    private Date date;

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public String getLm_name() {
        return lm_name;
    }

    public void setLm_name(String lm_name) {
        this.lm_name = lm_name;
    }

    public Integer getCus_id() {
        return cus_id;
    }

    public void setCus_id(Integer cus_id) {
        this.cus_id = cus_id;
    }

    public Integer getLm_id() {
        return lm_id;
    }

    public void setLm_id(Integer lm_id) {
        this.lm_id = lm_id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
