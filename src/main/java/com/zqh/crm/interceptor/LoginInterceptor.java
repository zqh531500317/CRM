package com.zqh.crm.interceptor;

import com.zqh.crm.pojo.Manage;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //不对登录和登出拦截
        String url = httpServletRequest.getRequestURI();
        if (url.equals(httpServletRequest.getContextPath() + "/manage/login")
                || url.equals(httpServletRequest.getContextPath() + "/manage/logout")) {
            return true;
        }
        //未登录则先跳转至登录页面
        Manage manage = (Manage) httpServletRequest.getSession().getAttribute("manage");
        if (manage == null) {
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/manage/login");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
