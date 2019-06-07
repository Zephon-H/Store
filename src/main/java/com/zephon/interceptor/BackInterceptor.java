package com.zephon.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.interceptor
 * @date 19-6-7 下午12:09
 * @Copyright ©
 */
public class BackInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("backUser");
        if(request.getRequestURI().endsWith("login")||request.getRequestURI().endsWith("register")){
            return true;
        }
        if(request.getRequestURI().endsWith("backstage")||request.getRequestURI().endsWith("Login")){
            return true;
        }
        if(user!=null){
            return true;
        }
        response.sendRedirect("/Store/backstage");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
