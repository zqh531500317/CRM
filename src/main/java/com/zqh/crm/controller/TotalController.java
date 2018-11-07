package com.zqh.crm.controller;

import com.zqh.crm.service.CustomerService;
import com.zqh.crm.utils.EchartsUtil.Count;
import com.zqh.crm.utils.EchartsUtil.EchartFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("total")
public class TotalController {
    @Autowired
    private CustomerService customerService;

    @RequestMapping("/cus/rank")
    public String cusRank() throws Exception {
        return "total/rank";
    }

    @RequestMapping("/cus/dest")
    public String cusDest() throws Exception {
        return "total/dest";
    }
    @ResponseBody
    @RequestMapping("rank/bar/json")
    public Object test1() throws Exception {
        List<Count> list = customerService.getCountGroupByRank();
        return EchartFactory.createBar(list);
    }

    @ResponseBody
    @RequestMapping("rank/pie/json")
    public Object test2() throws Exception {
        List<Count> list = customerService.getCountGroupByRank();
        return EchartFactory.createPie(list);
    }

    @ResponseBody
    @RequestMapping("dest/bar/json")
    public Object test3() throws Exception {
        List<Count> list = customerService.getCountGroupByDest();
        return EchartFactory.createBar(list);
    }

    @ResponseBody
    @RequestMapping("dest/pie/json")
    public Object test4() throws Exception {
        List<Count> list = customerService.getCountGroupByDest();
        return EchartFactory.createPie(list);
    }
}
