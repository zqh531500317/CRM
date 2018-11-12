package com.zqh.crm.service;

import com.zqh.crm.pojo.BaseDir;

import java.util.List;

public interface BaseDirService {
    List<BaseDir> findByTypeId(int type_id) throws Exception;
}
