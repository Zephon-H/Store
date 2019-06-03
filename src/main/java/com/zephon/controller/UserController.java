package com.zephon.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zephon.pojo.Cart;
import com.zephon.pojo.Goods;
import com.zephon.pojo.User;
import com.zephon.service.CartService;
import com.zephon.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Logger;

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
    public String login(User user, HttpSession session,HttpServletRequest request){
        System.out.println(user);
        User u = userServiceImpl.login(user);
        if(u!=null){
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

    @RequestMapping("exit")
    public String exit(HttpSession session){
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
    @RequestMapping("backstage")
    public String backstage(){
        return "backstage/login";
    }
}
