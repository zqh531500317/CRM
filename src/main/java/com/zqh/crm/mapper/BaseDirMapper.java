package com.zqh.crm.mapper;

import com.zqh.crm.pojo.BaseDir;

import java.util.List;

public interface BaseDirMapper {
    List<BaseDir> findByTypeId(int type_id) throws Exception;
    List<BaseDir> findByTypeName(String type_name) throws Exception;
    BaseDir findByValue(String value) throws Exception;
}
