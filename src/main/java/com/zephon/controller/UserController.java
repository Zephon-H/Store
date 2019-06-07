package com.zephon.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zephon.pojo.Goods;
import com.zephon.pojo.User;
import com.zephon.service.CartService;
import com.zephon.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
    @Resource
    CartService cartServiceImpl;

    private org.apache.log4j.Logger logger = Logger.getLogger(BackUserController.class);

    /**
     * @Author Zephon
     * @Description 注册
     * @Date 19-6-3 下午6:05
     * @Param [user, session]
     * @return java.lang.String
     **/
    @RequestMapping("register")
    public String Register(User user, HttpSession session){
        System.out.println(user);
        int index = userServiceImpl.register(user);
        if(index>0){
            logger.debug("用户编号为"+user.getUid()+"的用户注册了");
            session.setAttribute("user",user);
            return "redirect:index";
        }else{
            return "redirect:/register.jsp";
        }
    }

    /**
     * @Author Zephon
     * @Description 登录
     * @Date 19-6-3 下午6:05
     * @Param [user, session, request]
     * @return java.lang.String
     **/
    @RequestMapping("login")
    public String login(User user, HttpSession session,HttpServletRequest request){
        System.out.println(user);
        User u = userServiceImpl.login(user);
        if(u!=null){
            logger.debug("用户编号为"+user.getUid()+"的用户登录了");
            session.setAttribute("user",u);
            try {
                Map<Goods,Integer> cart = cartServiceImpl.getAllCart(user.getUid());
                System.out.println("cart--"+cart);
                int total = 0;
                if(cart==null){
                    cart = new HashMap<>();
                }else{
                    for(Goods key:cart.keySet()){
                        total+=cart.get(key);
                    }
                }
                session.setAttribute("cart",cart);
                session.setAttribute("total",total);
                System.out.println("loginCart"+cart);

            } catch (IOException e) {
                e.printStackTrace();
            }
            return "redirect:index";
        }else{
            request.setAttribute("state","登录失败");
            return "forward:login.jsp";
        }
    }

    /**
     * @Author Zephon
     * @Description 退出，同时保存session中购物车信息到数据库
     * @Date 19-6-3 下午6:06
     * @Param [session]
     * @return java.lang.String
     **/
    @RequestMapping("exit")
    public String exit(HttpSession session){
        logger.debug("用户名为"+session.getAttribute("user")+"的用户退出了");
        User user = (User) session.getAttribute("user");
        Map map = (Map) session.getAttribute("cart");
        try {
            cartServiceImpl.addToCart(map,user.getUid());
        } catch (JsonProcessingException e) {
            System.out.println("保存购物车失败");
        }
        session.removeAttribute("user");
        session.removeAttribute("cart");
        session.removeAttribute("total");
        return "redirect:login";
    }

    /**
     * 后台跳转
     * @return
     */
    @RequestMapping("backstage")
    public String backstage(){
        return "backstage/login";
    }
}
