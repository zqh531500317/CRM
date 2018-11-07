package com.zqh.crm.mapper;

import com.zqh.crm.utils.EchartsUtil.Count;
import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.QueryVo;

import java.util.List;

public interface CustomerMapper {
    void insert(Customer customer);
    void deleteById(Integer id);
    void updateByCustomer(Customer customer);
    List<Customer> find();
    Customer getCustomerByCustomer(Customer customer);
    List<Customer> getCustomerByName(String cus_name);
    Customer getCustomerById(Integer id);
    int getTotalNum(QueryVo queryVo);
    List<Customer> getCustomerByQueryVo(QueryVo queryVo);
    List<Count> getCountGroupByRank();
    List<Count> getCountGroupByDest();
}
