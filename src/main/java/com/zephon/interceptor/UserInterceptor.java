package com.zephon.interceptor;

import com.zephon.service.GoodsService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.interceptor
 * @date 19-5-27 下午7:42
 * @Copyright ©
 */
public class UserInterceptor implements HandlerInterceptor {
    @Resource
    private GoodsService goodsServiceImpl;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("user");
        if(request.getRequestURI().endsWith("login")||request.getRequestURI().endsWith("register")){
            return true;
        }
        if(request.getRequestURI().endsWith("backstage")){
            return true;
        }
        if(user!=null){
            return true;
        }
        response.sendRedirect("/Store/login.jsp");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
