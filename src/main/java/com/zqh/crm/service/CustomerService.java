package com.zqh.crm.service;

import com.zqh.crm.utils.EchartsUtil.Count;
import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.QueryVo;
import com.zqh.crm.utils.Page;

import java.util.List;

public interface CustomerService {
    void add(Customer customer) throws Exception;
    void delete(Customer customer) throws Exception;
    boolean update(Customer customer) throws Exception;
    List<Customer> find(String cus_name) throws Exception;
    Customer find(Customer customer) throws Exception;
    List<Customer> find() throws Exception;
    Customer find(Integer id) throws Exception;
    Page<Customer> getCustomerByQueryVo(QueryVo queryVo) throws Exception;
    List<Count> getCountGroupByRank() throws Exception;
    List<Count> getCountGroupByDest() throws Exception;
}
