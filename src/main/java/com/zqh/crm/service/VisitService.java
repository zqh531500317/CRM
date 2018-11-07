package com.zqh.crm.service;

import com.zqh.crm.pojo.Visit;

import java.util.List;

public interface VisitService {
    void insert(Visit visit) throws Exception;
    List<Visit> selectAll() throws Exception;
}
