package com.zqh.crm.controller;

import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.pojo.Visit;
import com.zqh.crm.service.CustomerService;
import com.zqh.crm.service.LinkManService;
import com.zqh.crm.service.VisitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/visit")
public class VisitController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private LinkManService linkManService;
    @Autowired
    private VisitService visitService;
    @RequestMapping("/addView")
    public String addView(HttpSession session,Model model) throws Exception {
        List<Customer> customerList = customerService.find();
        List<LinkMan> linkManList = linkManService.find();
        model.addAttribute("customerList",customerList);
        model.addAttribute("linkManList",linkManList);

        String info = (String) session.getAttribute("info");
        session.removeAttribute("info");
        model.addAttribute("info",info);
        return "visit/add";
    }
    @RequestMapping("/pageView")
    public String pageView(Model model) throws Exception{
        List<Visit> list = visitService.selectAll();
        model.addAttribute("list",list);
        return "visit/list";
    }
    @RequestMapping("/add")
    public String add(HttpSession session,Visit visit) throws Exception{
        visitService.insert(visit);
        session.setAttribute("info","保存成功");
        return "redirect:./addView";
    }

}
