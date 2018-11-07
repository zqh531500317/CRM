package com.zqh.crm.mapper;

import com.zqh.crm.utils.EchartsUtil.Count;
import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.pojo.QueryVo;
import core.superTest;
import org.junit.Test;

import java.util.List;

public class CustomerMapperTest extends superTest {

    @Test
    public void insert() {
    }

    @Test
    public void deleteById() {
    }

    @Test
    public void updateByCustomer() {
    }

    @Test
    public void find() {
    }

    @Test
    public void getCustomerByCustomer() {
    }

    @Test
    public void getCustomerByName() {
    }

    @Test
    public void getCustomerById() {
    }

    @Test
    public void getTotalNum() {
        CustomerMapper mapper = applicationContext.getBean(CustomerMapper.class);
        QueryVo queryVo=new QueryVo();
        queryVo.setCus_name("张");
        queryVo.setCus_rank("普通用户");
        queryVo.setCus_dest("广告");
        int num = mapper.getTotalNum(queryVo);
        System.out.println(num);
    }
    @Test
    public void getCustomerByQueryVo(){
        CustomerMapper mapper = applicationContext.getBean(CustomerMapper.class);
        QueryVo queryVo=new QueryVo();
        queryVo.setStart(0);
        List<Customer> list = mapper.getCustomerByQueryVo(queryVo);
        for (Customer customer : list) {
            System.out.println(customer);
            if(customer.getLinkManList()!=null)
            for (LinkMan linkMan : customer.getLinkManList()) {
                System.out.println("对应的联系人"+linkMan);
            }
        }

    }
    @Test
    public void getCountGroupByRank(){
        CustomerMapper mapper = applicationContext.getBean(CustomerMapper.class);
        List<Count> list = mapper.getCountGroupByRank();
        for (Count count : list) {
            System.out.println(count.getName()+"   "+count.getValue());
        }
    }
    @Test
    public void getCountGroupByDest(){
        CustomerMapper mapper = applicationContext.getBean(CustomerMapper.class);
        List<Count> list = mapper.getCountGroupByDest();
        for (Count count : list) {
            System.out.println(count.getName()+"   "+count.getValue());
        }
    }
}