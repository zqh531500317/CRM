package com.zqh.crm.pojo;


public class QueryVo {
    private String cus_name;
    private String cus_dest;
    private String cus_rank;
    private int page=1;
    private int start;
    private int size=8;

    public int getSize() {
        return size;
    }

    public String getCus_name() {
        return cus_name;
    }

    public void setCus_name(String cus_name) {
        this.cus_name = cus_name;
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }
}
