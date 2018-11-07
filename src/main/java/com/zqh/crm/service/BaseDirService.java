package com.zqh.crm.service;

import com.zqh.crm.pojo.BaseDir;

import java.util.List;

public interface BaseDirService {
    List<BaseDir> findByTypeId(int type_id) throws Exception;
    List<BaseDir> findByTypeName(String type_name) throws Exception;
    BaseDir findByValue(String value) throws Exception;
}
