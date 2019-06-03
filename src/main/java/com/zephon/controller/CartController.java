package com.zephon.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zephon.pojo.Cart;
import com.zephon.pojo.Goods;
import com.zephon.service.CartService;
import com.zephon.service.GoodsService;
import com.zephon.service.impl.GoodsServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.controller
 * @date 19-5-28 下午3:23
 * @Copyright ©
 */
@Controller
public class CartController {
    @Resource
    GoodsService goodsServiceImpl;
    @RequestMapping("addToCart")
    @ResponseBody
    public void addToCart(Goods goods, int num, HttpServletRequest req){
        System.out.println("addToCart");
        HttpSession session = req.getSession();
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        Integer total = (Integer) session.getAttribute("total");
        if(map==null){
            System.out.println("mapnull");
            map = new HashMap();
        }
        if(total==null){
            total = 0;
        }
        total+=num;

        goods = goodsServiceImpl.getGoodsById(goods.getId());

        if(map.get(goods)==null){
            map.put(goods,num);
        }else{
            map.put(goods,map.get(goods)+num);
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",total);
        System.out.println("map---"+map);
        System.out.println("total---"+total);


        /*System.out.println("addToCart");
        System.out.println("goods:"+goods+"--"+num);
        goods = goodsServiceImpl.getGoodsById(goods.getId());
        Cart cart = new Cart();
        Map<Goods,Integer> map = (Map<Goods, Integer>) req.getSession().getAttribute("cart");
        Map m = null;
        try {
            m = cartServiceImpl.getAllCart();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(map==null&&m!=null) {
             map = m;
        }else if(m==null){
            map = new HashMap<>();
        }
        System.out.println("All"+map);
        map.put(goods,num);

        req.getSession().setAttribute("cart",map);
        cart.setGoodsMap(map);
        System.out.println(map.get(goods));
        if(map.get(goods)==1){
            cartServiceImpl.addToCart(cart);
        }else{
            cartServiceImpl.updCart(cart);
        }*/
    }

    @RequestMapping("removeCart")
    @ResponseBody
    @SuppressWarnings("unchecked")
    public void removeCart(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        System.out.println("removeCart");
        System.out.println("map");
        int num=0;
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                num=map.get(key);
                map.put(key,0);
                map.remove(key);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")-num);
        System.out.println("removeMap---"+map);
    }
    @RequestMapping("numPlus")
    @ResponseBody
    public void numPlus(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        System.out.println("map");
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                map.replace(key,map.get(key)+1);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")+1);
        System.out.println("plus---"+map);
    }

    @RequestMapping("numReduce")
    @ResponseBody
    public void numReduce(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        System.out.println("map");
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                map.replace(key,map.get(key)-1);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")-1);
        System.out.println("plus---"+map);
    }

    @RequestMapping("numReduse")
    @ResponseBody
    public void numReduse(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        System.out.println("removeCart");
        System.out.println("map");
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                map.replace(key,map.get(key)-1);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")-1);
        System.out.println("reduce---"+map);
    }

    @RequestMapping("cart")
    public String cart(){
        return "carts";
    }

    @RequestMapping("refresh")
    @ResponseBody
    public void refresh(HttpServletResponse resp,HttpSession session){
        try {
            resp.getWriter().write(String.valueOf(session.getAttribute("total")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
