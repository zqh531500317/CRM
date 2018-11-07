package com.zqh.crm.mapper;

import com.zqh.crm.pojo.LinkMan;

import java.util.List;

public interface LinkManMapper {
    void updateByLinkMan(LinkMan linkMan) throws Exception;
    void updateIdByLinkMan(LinkMan linkMan) throws Exception;
    List<LinkMan> getLinkManList()throws Exception;
    LinkMan getLinkManById(Integer id)throws Exception;
    void deleteLinkManById(Integer id) throws Exception;
    void insertLinkManByLinkMan(LinkMan linkMan) throws Exception;
}
