package com.zqh.crm.service.impl;

import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.QueryVo;
import com.zqh.crm.utils.Page;
import core.superTest;
import org.junit.Test;

import static org.junit.Assert.*;

public class CustomerServiceImplTest extends superTest {

    @Test
    public void add() {
    }

    @Test
    public void delete() {
    }

    @Test
    public void update() {
    }

    @Test
    public void find() {
    }

    @Test
    public void find1() {
    }

    @Test
    public void find2() {
    }

    @Test
    public void find3() {
    }

    @Test
    public void findByQueryVo() throws Exception {
        CustomerServiceImpl service = applicationContext.getBean(CustomerServiceImpl.class);
        QueryVo queryVo=new QueryVo();
        queryVo.setPage(2);
        Page<Customer> customerPage = service.getCustomerByQueryVo(queryVo);
    }
}