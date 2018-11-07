package com.zqh.crm.pojo;

public class Manage {
    private Integer id;
    private String manageName;
    private String managePsw;

    @Override
    public String toString() {
        return "Manage{" +
                "id=" + id +
                ", manageName='" + manageName + '\'' +
                ", managePsw='" + managePsw + '\'' +
                '}';
    }

    public Manage(String manageName, String managePsw) {
        this.manageName = manageName;
        this.managePsw = managePsw;
    }

    public Manage(Integer id, String manageName, String managePsw) {
        this.id = id;
        this.manageName = manageName;
        this.managePsw = managePsw;
    }

    public Manage() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getManageName() {
        return manageName;
    }

    public void setManageName(String manageName) {
        this.manageName = manageName;
    }

    public String getManagePsw() {
        return managePsw;
    }

    public void setManagePsw(String managePsw) {
        this.managePsw = managePsw;
    }
}
