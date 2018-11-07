package com.zqh.crm.mapper;

import com.zqh.crm.pojo.Visit;

import java.util.List;

public interface VisitMapper {
    void insert(Visit visit) throws Exception;
    List<Visit> selectAll() throws Exception;
}
