package com.zqh.crm.pojo;

import com.zqh.crm.controller.validations.cus.cusLoginValidation;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import java.io.Serializable;
import java.util.List;
public class Customer implements Serializable {
    @Null(message = "{cus.id.null}",groups = {cusLoginValidation.class})
    private Integer id;
    @NotBlank(message = "cus.name.notnull",groups = {cusLoginValidation.class})
    private String cus_name;
    //信息来源
    @NotNull(message = "{cus.dest.notnull}",groups = {cusLoginValidation.class})
    private String cus_dest;
    private String cus_phone;
    private String cus_address;
    //级别
    @NotNull(message = "{cus.rank.notnull}",groups = {cusLoginValidation.class})
    private String cus_rank;
    private Integer cus_mobile;
    @Email(message = "{cus.email}")
    private String cus_email;

    private List<LinkMan> linkManList;

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", cus_name='" + cus_name + '\'' +
                ", cus_dest='" + cus_dest + '\'' +
                ", cus_phone='" + cus_phone + '\'' +
                ", cus_address='" + cus_address + '\'' +
                ", cus_rank='" + cus_rank + '\'' +
                ", cus_mobile=" + cus_mobile +
                ", cus_email='" + cus_email + '\'' +
                '}';
    }

    public List<LinkMan> getLinkManList() {
        return linkManList;
    }

    public void setLinkManList(List<LinkMan> linkManList) {
        this.linkManList = linkManList;
    }

    public Customer() {
    }

    public String getCus_dest() {
        return cus_dest;
    }

    public void setCus_dest(String cus_dest) {
        this.cus_dest = cus_dest;
    }

    public String getCus_rank() {
        return cus_rank;
    }

    public void setCus_rank(String cus_rank) {
        this.cus_rank = cus_rank;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
    }


    public String getCus_phone() {
        return cus_phone;
    }

    public void setCus_phone(String cus_phone) {
        this.cus_phone = cus_phone;
    }

    public String getCus_address() {
        return cus_address;
    }

    public void setCus_address(String cus_address) {
        this.cus_address = cus_address;
    }


    public Integer getCus_mobile() {
        return cus_mobile;
    }

    public void setCus_mobile(Integer cus_mobile) {
        this.cus_mobile = cus_mobile;
    }

    public String getCus_email() {
        return cus_email;
    }

    public void setCus_email(String cus_email) {
        this.cus_email = cus_email;
    }
}
