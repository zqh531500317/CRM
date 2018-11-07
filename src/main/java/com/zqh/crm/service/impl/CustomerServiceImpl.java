package com.zqh.crm.service.impl;

import com.zqh.crm.exception.ManageException;
import com.zqh.crm.mapper.CustomerMapper;
import com.zqh.crm.mapper.LinkManMapper;
import com.zqh.crm.utils.EchartsUtil.Count;
import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.pojo.QueryVo;
import com.zqh.crm.service.CustomerService;
import com.zqh.crm.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private LinkManMapper linkManMapper;

    @Override
    public void add(Customer customer) throws Exception {
        customerMapper.insert(customer);
        Integer id = customer.getId();
        List<LinkMan> linkManList = customer.getLinkManList();
        for (LinkMan linkMan : linkManList) {
            linkMan.setCus_id(id);
            linkManMapper.updateByLinkMan(linkMan);
        }
    }

    @Override
    public void delete(Customer customer) throws Exception {
        customerMapper.deleteById(customer.getId());
    }

    @Override
    public boolean update(Customer customer) throws Exception {
        try {

            Customer customer1 = customerMapper.getCustomerById(customer.getId());
            if (customer1 == null) {
                throw new ManageException("该用户已经不存在");
            }
            Integer id = customer1.getId();

            customerMapper.updateByCustomer(customer);
            //更新联系人
            List<LinkMan> linkManList = customer.getLinkManList();
            if (linkManList != null && linkManList.size() > 0) {
                for (LinkMan linkMan : linkManList) {
                    linkMan.setCus_id(id);
                    linkManMapper.updateIdByLinkMan(linkMan);
                }
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @Override
    public List<Customer> find(String cus_name) throws Exception {
        return customerMapper.getCustomerByName(cus_name);
    }

    @Override
    public Customer find(Customer customer) throws Exception {
        if (customer.getId() == null) {
            throw new ManageException("该客户不存在");
        }
        customer = customerMapper.getCustomerByCustomer(customer);
        return customer;
    }

    @Override
    public List<Customer> find() throws Exception {
        return customerMapper.find();
    }

    @Override
    public Customer find(Integer id) throws Exception {
        return customerMapper.getCustomerById(id);
    }

    @Override
    public Page<Customer> getCustomerByQueryVo(QueryVo queryVo) throws Exception {
        int page = queryVo.getPage();
        int size = queryVo.getSize();
        queryVo.setStart((page - 1) * size);
        int total = customerMapper.getTotalNum(queryVo);
        List<Customer> list = customerMapper.getCustomerByQueryVo(queryVo);
        Page<Customer> customerPage=new Page<>(total,page,size,list);
        return customerPage;
    }

    @Override
    public List<Count> getCountGroupByRank() throws Exception {
        return customerMapper.getCountGroupByRank();
    }

    @Override
    public List<Count> getCountGroupByDest() throws Exception {
        return customerMapper.getCountGroupByDest();
    }
}
