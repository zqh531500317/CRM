package com.zqh.crm.mapper;

import com.zqh.crm.pojo.BaseDir;
import core.superTest;
import org.junit.Test;

import java.util.List;


public class BaseDirMapperTest extends superTest {

    @Test
    public void findByTypeId() throws Exception {
        BaseDirMapper mapper = applicationContext.getBean(BaseDirMapper.class);
        List<BaseDir> list = mapper.findByTypeId(1);
        for (BaseDir baseDir : list) {
            System.out.println(baseDir);
        }
    }

    @Test
    public void findByTypeName() throws Exception {
        BaseDirMapper mapper = applicationContext.getBean(BaseDirMapper.class);
        List<BaseDir> list = mapper.findByTypeName("客户级别");
        for (BaseDir baseDir : list) {
            System.out.println(baseDir);
        }
    }

    @Test
    public void findByValue() throws Exception {
        BaseDirMapper mapper = applicationContext.getBean(BaseDirMapper.class);
        BaseDir baseDir = mapper.findByValue("普通用户");
        System.out.println(baseDir);

    }
}