package com.zqh.crm.service.impl;

import com.zqh.crm.mapper.VisitMapper;
import com.zqh.crm.pojo.Visit;
import com.zqh.crm.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class VisitServiceImpl implements VisitService {
    @Autowired
    private VisitMapper visitMapper;
    @Override
    public void insert(Visit visit) throws Exception {
        visitMapper.insert(visit);
    }

    @Override
    public List<Visit> selectAll() throws Exception {
        return visitMapper.selectAll();
    }
}
