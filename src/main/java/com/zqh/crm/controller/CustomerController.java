package com.zqh.crm.controller;


import com.zqh.crm.pojo.BaseDir;
import com.zqh.crm.pojo.Customer;
import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.pojo.QueryVo;
import com.zqh.crm.service.BaseDirService;
import com.zqh.crm.service.CustomerService;
import com.zqh.crm.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.zqh.crm.controller.validations.cus.cusLoginValidation;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private BaseDirService baseDirService;

    @RequestMapping("/addView")
    public String customer_addView(Model model) throws Exception {
        List<BaseDir> cus_rank = baseDirService.findByTypeName("客户级别");
        List<BaseDir> cus_dest = baseDirService.findByTypeName("信息来源");

        model.addAttribute("cus_rank", cus_rank);
        model.addAttribute("cus_dest", cus_dest);
        return "customer/add";
    }

    @RequestMapping("/add")
    public String add(Model model, @ModelAttribute @Validated(value = {cusLoginValidation.class}) Customer customer, BindingResult bindingResult, String linkManName) throws Exception {
        //数据验证
        List<ObjectError> allErrors = bindingResult.getAllErrors();
        if (allErrors.size() != 0) {
            model.addAttribute("error", allErrors);
            return "customer/add";
        }

        List<LinkMan> linkManList = StringToList(linkManName);
        customer.setLinkManList(linkManList);
        customerService.add(customer);
        model.addAttribute("info", "信息保存成功");
        return "customer/add";
    }

    /**
     * 返回所有客户信息
     */
    @RequestMapping("/manageView")
    public String cus_View(Model model) throws Exception {
        List<Customer> customers = customerService.find();
        model.addAttribute("customers", customers);
        return "customer/cus_manage";
    }

    @RequestMapping("/cusList")
    public String cusList() throws Exception {
        return "customer/cusList";
    }

    /**
     * id    type_name
     * 1     客户级别
     * 2     信息来源
     */
    @RequestMapping("/cus_dir")
    public @ResponseBody
    List<BaseDir> cus_dir(Integer id) throws Exception {
        System.out.println(id);
        List<BaseDir> list = baseDirService.findByTypeId(id);
        return list;
    }

    /**
     * 分页获取数据
     *
     * @param queryVo
     * @return
     * @throws Exception
     */
    @RequestMapping("/cusListPage")
    public @ResponseBody
    Page<Customer> cusListPage(QueryVo queryVo) throws Exception {
        Page<Customer> page = customerService.getCustomerByQueryVo(queryVo);
        return page;
    }

    /**
     * 删除单个用户
     */
    @RequestMapping("/delete/{cus_id}")
    public String delete(HttpServletRequest request, Model model, @PathVariable("cus_id") Integer cus_id) throws Exception {
        String header = request.getHeader("Referer");
        Customer customer = customerService.find(cus_id);
        if (customer == null) {
            model.addAttribute("info", "该客户不存在");
            return header;
        }
        customerService.delete(customer);
        return "redirect:" + header;
    }

    /**
     * 返回1个客户细节
     */
    @RequestMapping("/detail")

    public String detail(Model model, Integer cus_id) throws Exception {
        Customer customer = customerService.find(cus_id);
        if (customer == null) {
            model.addAttribute("info", "该客户不存在");
            return "customer/cus_manage";
        }
        List<BaseDir> cus_rank = baseDirService.findByTypeName("客户级别");
        List<BaseDir> cus_dest = baseDirService.findByTypeName("信息来源");

        model.addAttribute("cus_rank", cus_rank);
        model.addAttribute("cus_dest", cus_dest);
        model.addAttribute("customer", customer);
        return "customer/detail";
    }


    /**
     * 修改客户信息
     */
    @RequestMapping("/update")
    public String update(Model model, Customer customer, String linkManName) throws Exception {

        //将联系人的字符串转化为联系人呢集合
        List<LinkMan> list = StringToList(linkManName);

        if (list != null && list.size() != 0) {
            customer.setLinkManList(list);
        }
        boolean b = customerService.update(customer);
        if (b)
            model.addAttribute("info", "信息保存成功");
        else
            model.addAttribute("info", "信息保存失败");
        return "customer/add";
    }

    /**
     * 将联系人的字符串转化为联系人呢集合
     *
     * @param str
     * @return linkManList
     * @throws Exception
     */
    private List<LinkMan> StringToList(String str) throws Exception {
        List<LinkMan> linkManList = new ArrayList<>();
        String[] split = str.split("[^\\dA-Za-z\\u3007\\u4E00-\\u9FCB\\uE815-\\uE864]");
        //asList返回的是Arrays内部的list，不能使用remove方法
        List<String> list = new ArrayList<>(Arrays.asList(split));

        for (int i = 0; i < list.size(); i++) {
            if (!list.get(i).equals("")) {
                LinkMan linkMan = new LinkMan();
                linkMan.setLm_name(list.get(i));
                linkManList.add(linkMan);
            }
        }
        return linkManList;
    }

}
