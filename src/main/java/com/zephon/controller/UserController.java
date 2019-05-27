package com.zephon.controller;

import com.zephon.pojo.User;
import com.zephon.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.controller
 * @date 19-5-27 上午11:55
 * @Copyright ©
 */
@Controller
public class UserController {
    @Resource
    UserService userServiceImpl;
    @RequestMapping("register")
    public String Register(User user, HttpSession session){
        System.out.println(user);
        int index = userServiceImpl.register(user);
        if(index>0){
            session.setAttribute("user",user);
            return "redirect:index";
        }else{
            return "redirect:/register.jsp";
        }
    }
    @RequestMapping("login")
    public String login(User user, HttpServletRequest request){
        System.out.println(user);
        User u = userServiceImpl.login(user);
        if(u!=null){
            request.getSession().setAttribute("user",u);
            return "redirect:index";
        }else{
            request.setAttribute("state","登录失败");
            return "forward:login.jsp";
        }
    }

    @RequestMapping("exit")
    public String exit(HttpSession session){
        session.removeAttribute("user");
        return "redirect:index";
    }
}
