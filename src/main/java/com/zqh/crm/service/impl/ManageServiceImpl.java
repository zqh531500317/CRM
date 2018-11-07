package com.zqh.crm.service.impl;


import com.zqh.crm.exception.ManageException;
import com.zqh.crm.mapper.ManageMapper;
import com.zqh.crm.pojo.Manage;
import com.zqh.crm.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ManageServiceImpl implements ManageService {
    @Autowired
    private ManageMapper manageMapper;

    @Override
    public Manage find(String name)throws Exception {

        return manageMapper.getManageByName(name);
    }
}
