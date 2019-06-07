package com.zephon.controller;

import com.zephon.pojo.Goods;
import com.zephon.service.GoodsService;
import org.apache.log4j.Logger;
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
 * @Description 购物车控制器
 * @date 19-5-28 下午3:23
 * @Copyright ©
 */
@Controller
public class CartController {
    @Resource
    GoodsService goodsServiceImpl;

    private org.apache.log4j.Logger logger = Logger.getLogger(BackUserController.class);

    /**
     * @Author Zephon
     * @Description 添加商品到购物车
     * @Date 19-6-3 下午5:54
     * @Param [goods, num, req]
     * @return void
     **/
    @RequestMapping("addToCart")
    @ResponseBody
    public void addToCart(Goods goods, int num, HttpServletRequest req){
        HttpSession session = req.getSession();
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        Integer total = (Integer) session.getAttribute("total");
        if(map==null){
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
        System.out.println("total---"+total);
        logger.debug("用户添加商品编号为"+goods.getId()+"的商品"+num+"件到购物车");
    }

    /**
     * @Author Zephon
     * @Description 根据id从购物车移除商品
     * @Date 19-6-3 下午5:55
     * @Param [id, session]
     * @return void
     **/
    @RequestMapping("removeCart")
    @ResponseBody
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
        logger.debug("用户将商品编号为"+id+"的商品从购物车中移除了");
    }

    /**
     * @Author Zephon
     * @Description 购物车中点击+号，根据id修改购物车中商品的数量+1
     * @Date 19-6-3 下午5:56
     * @Param [id, session]
     * @return void
     **/
    @RequestMapping("numPlus")
    @ResponseBody
    public void numPlus(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                map.replace(key,map.get(key)+1);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")+1);
    }

    /**
     * @Author Zephon
     * @Description 购物车中点击-号，根据id修改购物车中商品的数量-1
     * @Date 19-6-3 下午5:56
     * @Param [id, session]
     * @return void
     **/
    @RequestMapping("numReduce")
    @ResponseBody
    public void numReduce(int id,HttpSession session){
        Map<Goods,Integer> map = (Map<Goods, Integer>) session.getAttribute("cart");
        for(Goods key:map.keySet()){
            if(key.getId()==id){
                map.replace(key,map.get(key)-1);
            }
        }
        session.setAttribute("cart",map);
        session.setAttribute("total",(int)session.getAttribute("total")-1);
    }

    /**
     * @Author Zephon
     * @Description cart对应的页面转换，从/cart转为/WEB-INF/page/carts.jsp
     * @Date 19-6-3 下午5:58
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping("cart")
    public String cart(){
        return "carts";
    }

    /**
     * @Author Zephon
     * @Description 页面刷新，查看购物车数量时刷新数量
     * @Date 19-6-3 下午5:59
     * @Param [resp, session]
     * @return void
     **/
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
