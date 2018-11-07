package com.zqh.crm.mapper;

import com.zqh.crm.pojo.Manage;
import core.superTest;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class ManageMapperTest  extends superTest {

    @Test
    public void getManageByName() {
        ManageMapper manageMapper = applicationContext.getBean(ManageMapper.class);
        Manage manage = manageMapper.getManageByName("zqh");
        System.out.println(manage);
    }
}