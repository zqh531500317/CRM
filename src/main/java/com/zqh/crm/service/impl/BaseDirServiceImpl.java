package com.zqh.crm.service.impl;


import com.zqh.crm.mapper.BaseDirMapper;
import com.zqh.crm.pojo.BaseDir;
import com.zqh.crm.service.BaseDirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BaseDirServiceImpl implements BaseDirService {
    @Autowired
    private BaseDirMapper baseDirMapper;

    @Override
    public List<BaseDir> findByTypeId(int type_id) throws Exception {
        List<BaseDir> list = baseDirMapper.findByTypeId(type_id);
        //移除enable=false的
        list = removeEnable(list);
        return list;
    }

    @Override
    public List<BaseDir> findByTypeName(String type_name) throws Exception {
        List<BaseDir> list =baseDirMapper.findByTypeName(type_name);
        //移除enable=false的
        list = removeEnable(list);
        return list;
    }

    @Override
    public BaseDir findByValue(String value) throws Exception {
        BaseDir baseDir =baseDirMapper.findByValue(value);
        //移除enable=false的
        baseDir = removeEnable(baseDir);
        return baseDir;
    }
    private List<BaseDir> removeEnable(List<BaseDir> list){
        for (BaseDir baseDir : list) {
            if(!baseDir.getEnable()){
                list.remove(baseDir);
            }
        }
        return list;
    }
    private BaseDir removeEnable(BaseDir baseDir){
            if(!baseDir.getEnable()){
                return null;
            }

        return baseDir;
    }
}
