package com.zqh.crm.pojo;


import java.io.Serializable;


public class BaseDir implements Serializable{
    private Integer id;
    private Integer type_id;
    private String type_name;
    private String value;
    private Boolean enable;

    @Override
    public String toString() {
        return "BaseDir{" +
                "id=" + id +
                ", type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                ", value='" + value + '\'' +
                ", enable=" + enable +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getType_id() {
        return type_id;
    }

    public void setType_id(Integer type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }
}
