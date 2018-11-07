package com.zqh.crm.controller;

import com.zqh.crm.pojo.Manage;
import com.zqh.crm.service.ManageService;
import com.zqh.crm.utils.MD5Util;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class ManageController {
    @Autowired
    private ManageService manageService;

    @RequestMapping(value = "/login")
    public String manageLogin(Model model, HttpSession httpSession,String name,
                              String psw) throws Exception {

        Manage manage = manageService.find(name);
        if (manage == null) {
            model.addAttribute("error", "该账户不存在");
            return "forward:/resource/index.jsp";
        } else if (!manage.getManagePsw().equals(MD5Util.EncoderByMd5(psw))) {
            model.addAttribute("error", "密码错误");
            return "forward:/resource/index.jsp";
        } else {
            httpSession.setAttribute("manage", manage);
            httpSession.setMaxInactiveInterval(60 * 10);
            return "redirect:/manage/";
        }
    }

    @RequestMapping("/")
    public String manage() throws Exception {
        return "manage";
    }

    @RequestMapping("/logout")
    public String manageLogout(HttpSession httpSession) throws Exception {
        httpSession.invalidate();
        return "redirect:/resource/index.jsp";
    }
}
