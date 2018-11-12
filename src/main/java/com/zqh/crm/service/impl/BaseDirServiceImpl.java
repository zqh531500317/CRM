package com.zqh.crm.service.impl;


import com.zqh.crm.mapper.BaseDirMapper;
import com.zqh.crm.pojo.BaseDir;
import com.zqh.crm.service.BaseDirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BaseDirServiceImpl implements BaseDirService {
    @Autowired
    private BaseDirMapper baseDirMapper;
    @Autowired
    private RedisTemplate<String, BaseDir> redisTemplate;

    @Override
    public List<BaseDir> findByTypeId(int type_id) throws Exception {
        //先在redis中寻找
        List<BaseDir> l = redisTemplate.opsForList().range("baseDir:" + type_id, 0, -1);
        if (l.size()!=0)
            return l;
        //在数据库中找
        List<BaseDir> list = baseDirMapper.findByTypeId(type_id);
        //移除enable=false的
        list = removeEnable(list);
        //存入redis
        redisTemplate.opsForList().rightPushAll("baseDir:"+type_id,list);
        return list;
    }


    private List<BaseDir> removeEnable(List<BaseDir> list) {
        for (BaseDir baseDir : list) {
            if (!baseDir.getEnable()) {
                list.remove(baseDir);
            }
        }
        return list;
    }

    private BaseDir removeEnable(BaseDir baseDir) {
        if (!baseDir.getEnable()) {
            return null;
        }

        return baseDir;
    }
}
