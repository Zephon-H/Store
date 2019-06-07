package com.zephon.controller;

import com.zephon.pojo.BackUser;
import com.zephon.service.BackUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.backstage.controller
 * @date 19-6-3 下午5:03
 * @Copyright ©
 */
@Controller
public class BackUserController {
    @Resource
    private BackUserService backUserServiceImpl;
    private Logger logger = Logger.getLogger(BackUserController.class);
    @RequestMapping("backLogin")
    public String backLogin(BackUser backUser, HttpSession session){
        logger.debug(backUser.getUname()+"登录后台");
        System.out.println(backUser.getUname()+"--"+backUser.getPwd());
        if(backUserServiceImpl.login(backUser)!=null){
            session.setAttribute("backUser",backUser);
            return "redirect:backIndex";
        }else{
            return "backstage/login";
        }
    }
    @RequestMapping("backIndex")
    public String backIndex(){
        return "backstage/index";
    }

    @RequestMapping("backUserManage")
    public String backUserManage(HttpServletRequest request){
        request.setAttribute("userList",backUserServiceImpl.getAllUser());
        return "backstage/userManage";
    }
}

