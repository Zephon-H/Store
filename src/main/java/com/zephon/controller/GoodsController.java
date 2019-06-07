package com.zephon.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zephon.pojo.Goods;
import com.zephon.pojo.User;
import com.zephon.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.controller
 * @Description 商品控制器
 * @date 19-5-27 下午1:11
 * @Copyright ©
 */
@Controller
public class GoodsController {
    @Resource
    private GoodsService goodsServiceImpl;

    /**
     * @Author Zephon
     * @Description index页面转换并且设置动态轮播图
     * @Date 19-6-3 下午6:00
     * @Param [req]
     * @return java.lang.String
     **/
    @RequestMapping("index")
    public String index(HttpServletRequest req){
        req.setAttribute("slideList",goodsServiceImpl.getSlide());
        return "index";
    }

    /**
     * @Author Zephon
     * @Description ajax选择六个商品信息，在index中展示
     * @Date 19-6-3 下午6:00
     * @Param [resp]
     * @return void
     **/
    @RequestMapping("selSixGoods")
    @ResponseBody
    public void getSixGoods(HttpServletResponse resp){
        System.out.println("selGoods");
        List<Goods> list = goodsServiceImpl.getSixGoods();
        ajax(list,resp);
    }

    /**
     * @Author Zephon
     * @Description ajax选择推荐商品
     * @Date 19-6-3 下午6:01
     * @Param [resp]
     * @return void
     **/
    @RequestMapping("selRecommend")
    @ResponseBody
    public void selRecommend(HttpServletResponse resp){
        System.out.println("selRecommend");
        List<Goods> list = goodsServiceImpl.getRecomend();
        ajax(list,resp);
    }

    /**
     * @Author Zephon
     * @Description products页面转换
     * @Date 19-6-3 下午6:01
     * @Param [type]
     * @return java.lang.String
     **/
    @RequestMapping("products")
    public String products(String type){
        System.out.println(type);

        return "products";
    }

    /**
     * @Author Zephon
     * @Description details页面转换，并设置商品对应id和类型
     * @Date 19-6-3 下午6:02
     * @Param [id, type, req]
     * @return java.lang.String
     **/
    @RequestMapping("details")
    public String details(int id,String type,HttpServletRequest req){
        System.out.println("details");
        System.out.println(goodsServiceImpl.getSimilar(type));
        req.setAttribute("similarList",goodsServiceImpl.getSimilar(type));
        req.setAttribute("goods",goodsServiceImpl.getGoodsById(id));
        return "details";
    }

    /**
     * @Author Zephon
     * @Description ajax使用懒加载，分页显示
     * @Date 19-6-3 下午6:03
     * @Param [resp, page]
     * @return void
     **/
    @RequestMapping("selPage")
    @ResponseBody
    public void selPage(HttpServletResponse resp, @RequestParam(defaultValue = "1") String page){
        int pageSize = 6;
        int pageNumber = Integer.parseInt(page);
        System.out.println(pageSize+"--"+pageNumber);
        List<Goods> list = goodsServiceImpl.getPage(pageSize, pageNumber);
        System.out.println("list"+list);
        ajax(list,resp);
    }

    /**
     * @Author Zephon
     * @Description ajax轮播图动态刷新
     * @Date 19-6-3 下午6:04
     * @Param [resp]
     * @return void
     **/
    @RequestMapping("selSlide")
    @ResponseBody
    public void selSlide(HttpServletResponse resp){
        System.out.println("selSlide");
        List<Goods> list = goodsServiceImpl.getSlide();
        ajax(list,resp);
    }

    /**
     * @Author Zephon
     * @Description ajax共有方法封装
     * @Date 19-6-3 下午6:04
     * @Param [list, resp]
     * @return void
     **/
    public void ajax(List list,HttpServletResponse resp){
        System.out.println(list);
        ObjectMapper mapper = new ObjectMapper();
        String str="";
        try {
            str = mapper.writeValueAsString(list);
            System.out.println("str"+str);
            resp.setContentType("application/json;charset=utf-8");
            PrintWriter writer = resp.getWriter();
            writer.println(str);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @Author Zephon
     * @Description 根据类型模糊匹配用分页方式显示商品
     * @Date 19-6-3 下午6:05
     * @Param [resp, page, type]
     * @return void
     **/
    @RequestMapping("selPageByType")
    @ResponseBody
    public void selPageByType(HttpServletResponse resp, @RequestParam(defaultValue = "1") String page,String type){
        int pageSize = 6;
        int pageNumber = Integer.parseInt(page);
        System.out.println(pageSize+"--"+pageNumber);
        List<Goods> list = goodsServiceImpl.getPageByType(type,pageSize, pageNumber);
        System.out.println("list"+list);
        ajax(list,resp);
    }
}
