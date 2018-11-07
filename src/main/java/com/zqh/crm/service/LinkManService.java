package com.zqh.crm.service;

import com.zqh.crm.pojo.LinkMan;

import java.util.List;

public interface LinkManService {
    void add(LinkMan linkMan) throws Exception;
    void delete(Integer id) throws Exception;
    void update(LinkMan linkMan) throws Exception;

    /**
     * 根据姓名模糊查询
     * @param lm_name
     * @return
     * @throws Exception
     */
    List<LinkMan> find(String lm_name) throws Exception;

    /**
     * 查询所有联系人
     * @return
     */
    List<LinkMan> find() throws Exception;
    LinkMan find(Integer id) throws Exception;
}
