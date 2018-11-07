package com.zqh.crm.controller;

import com.zqh.crm.pojo.LinkMan;
import com.zqh.crm.service.LinkManService;
import com.zqh.crm.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.List;

@Controller
@RequestMapping("/linkMan")
public class LinkManController {
    @Autowired
    private LinkManService linkManService;
    @Value("${fileDestStr}")
    public String fileDestStr;

    /**
     * 返回所有联系人信息
     */
    @RequestMapping("/pageView")
    public String linkManView(Model model) throws Exception {
        List<LinkMan> list = linkManService.find();
        model.addAttribute("list", list);
        return "linkMan/lm_manage";
    }

    /**
     * 跳转至联系人添加页面
     */
    @RequestMapping("/addView")
    public String addView() throws Exception {
        return "linkMan/add";
    }

    /**
     * 新增联系人
     */
    @RequestMapping("/add")
    public String add(Model model, LinkMan linkMan, @RequestParam(value = "file", required = false) MultipartFile file) throws Exception {
        if (file != null) {
            String lm_file = file.getOriginalFilename();
            InputStream inputStream = file.getInputStream();
            boolean b = FileUtil.upload(fileDestStr, lm_file, inputStream);
            if (b) {
                linkMan.setLm_file(lm_file);
            }
        }
        linkManService.add(linkMan);
        model.addAttribute("info", "保存成功");
        return "linkMan/add";
    }

    /**
     * 联系人详情
     */
    @RequestMapping("/detail")
    public String detail(HttpServletRequest request, Model model, Integer cus_id) throws Exception {
        LinkMan linkMan = linkManService.find(cus_id);
        if (linkMan == null) {
            model.addAttribute("info", "该联系人不存在");
            return request.getHeader("Referer");
        }
        model.addAttribute("linkMan", linkMan);
        return "linkMan/detail";
    }

    /**
     * 更新联系人信息
     */
    @RequestMapping("/update")
    public String update(HttpServletRequest request, Model model, LinkMan linkMan, MultipartFile file) throws Exception {
        if (file != null) {
            String lm_file = file.getOriginalFilename();
            InputStream inputStream = file.getInputStream();
            boolean b = FileUtil.upload(fileDestStr, lm_file, inputStream);
            if (b) {
                linkMan.setLm_file(lm_file);
            }
        }
        linkManService.update(linkMan);
        model.addAttribute("info", "保存成功");
        return "linkMan/detail";
    }

    /**
     * 删除联系人
     */
    @RequestMapping("/delete/{id}")
    public String delete(HttpServletRequest request, Model model, @PathVariable("id") Integer id) throws Exception {
        String header = request.getHeader("Referer");
        LinkMan linkMan = linkManService.find(id);
        if (linkMan == null) {
            model.addAttribute("info", "该联系人不存在");
            return header;
        }
        linkManService.delete(id);
        return "redirect:" + header;
    }
}
