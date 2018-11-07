package com.zqh.crm.pojo;


import java.io.Serializable;

public class LinkMan implements Serializable {
    private Integer id;
    private String lm_name;
    private boolean lm_sex;
    private String lm_phone;
    private Integer lm_mobile;
    private String lm_file;
    private Integer cus_id;
    private String cus_name;

    @Override
    public String toString() {
        return "LinkMan{" +
                "id=" + id +
                ", lm_name='" + lm_name + '\'' +
                ", lm_sex=" + lm_sex +
                ", lm_phone='" + lm_phone + '\'' +
                ", lm_mobile=" + lm_mobile +
                ", lm_file='" + lm_file + '\'' +
                ", cus_id=" + cus_id +
                ", cus_name='" + cus_name + '\'' +
                '}';
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }

    public Integer getCus_id() {
        return cus_id;
    }

    public void setCus_id(Integer cus_id) {
        this.cus_id = cus_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLm_name() {
        return lm_name;
    }

    public void setLm_name(String lm_name) {
        this.lm_name = lm_name;
    }

    public boolean isLm_sex() {
        return lm_sex;
    }

    public void setLm_sex(boolean lm_sex) {
        this.lm_sex = lm_sex;
    }

    public String getLm_phone() {
        return lm_phone;
    }

    public void setLm_phone(String lm_phone) {
        this.lm_phone = lm_phone;
    }

    public Integer getLm_mobile() {
        return lm_mobile;
    }

    public void setLm_mobile(Integer lm_mobile) {
        this.lm_mobile = lm_mobile;
    }

    public String getLm_file() {
        return lm_file;
    }

    public void setLm_file(String lm_file) {
        this.lm_file = lm_file;
    }


}
