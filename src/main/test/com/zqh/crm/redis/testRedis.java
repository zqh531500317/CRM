package com.zqh.crm.redis;

import com.zqh.crm.pojo.BaseDir;
import core.superTest;
import org.junit.Test;
import org.springframework.data.redis.core.RedisTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class testRedis extends superTest {
    @Test
    public void t1() {
        RedisTemplate<String, BaseDir> redisTemplate = applicationContext.getBean(RedisTemplate.class);
        List<BaseDir> list = new ArrayList<>();
        BaseDir a = new BaseDir();
        a.setId(1);
        a.setType_id(1);
        a.setType_name("a");
        a.setValue("v1");
        BaseDir b = new BaseDir();
        b.setId(2);
        b.setType_id(2);
        b.setType_name("b");
        b.setValue("v2");

        list.add(a);
        list.add(b);
        redisTemplate.opsForList().rightPushAll("aa",list);
    }
}
