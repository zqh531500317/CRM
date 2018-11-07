package com.zqh.crm.mapper;

import com.zqh.crm.pojo.LinkMan;
import core.superTest;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class LinkManMapperTest extends superTest {

    @Test
    public void updateByLinkMan() {
    }

    @Test
    public void updateIdByLinkMan() throws Exception {
        LinkManMapper mapper = applicationContext.getBean(LinkManMapper.class);
        LinkMan linkMan=new LinkMan();
        linkMan.setId(13);
        linkMan.setLm_file("d");
        mapper.updateByLinkMan(linkMan);
    }

    @Test
    public void getLinkManList() throws Exception {
        LinkManMapper mapper = applicationContext.getBean(LinkManMapper.class);
        List<LinkMan> linkManList = mapper.getLinkManList();
        for (LinkMan linkMan : linkManList) {
            System.out.println(linkMan);
        }
    }
    @Test
    public void deleteLinkManById() throws Exception {
        LinkManMapper mapper = applicationContext.getBean(LinkManMapper.class);
        mapper.deleteLinkManById(11);
    }
    @Test
    public void insertLinkManByLinkMan() throws Exception {
        LinkManMapper mapper = applicationContext.getBean(LinkManMapper.class);
        LinkMan linkMan=new LinkMan();
        linkMan.setLm_name("测试");
        linkMan.setLm_file("d:\\");
        linkMan.setCus_id(122);
        mapper.insertLinkManByLinkMan(linkMan);
        System.out.println(linkMan);
    }
    @Test
    public void getLinkManById() throws Exception{
        LinkManMapper mapper = applicationContext.getBean(LinkManMapper.class);
        LinkMan linkMan = mapper.getLinkManById(1);
        System.out.println(linkMan);
    }
}