package com.zqh.crm.service.impl;


import com.zqh.crm.mapper.LinkManMapper;
import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.service.LinkManService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class LinkManServiceImpl implements LinkManService {
    @Autowired
    private LinkManMapper linkManMapper;

    @Override
    public void add(LinkMan linkMan) throws Exception {
        linkManMapper.insertLinkManByLinkMan(linkMan);
    }

    @Override
    public void delete(Integer id) throws Exception {
        linkManMapper.deleteLinkManById(id);
    }

    @Override
    public void update(LinkMan linkMan) throws Exception {
        linkManMapper.updateByLinkMan(linkMan);
    }

    @Override
    public List<LinkMan> find(String lm_name) throws Exception {

        return null;
    }

    @Override
    public List<LinkMan> find() throws Exception {
        List<LinkMan> list = linkManMapper.getLinkManList();
        return list;
    }

    @Override
    public LinkMan find(Integer id) throws Exception {
        return linkManMapper.getLinkManById(id);
    }
}
