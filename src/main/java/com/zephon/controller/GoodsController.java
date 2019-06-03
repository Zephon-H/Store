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
 * @date 19-5-27 下午1:11
 * @Copyright ©
 */
@Controller
public class GoodsController {
    @Resource
    private GoodsService goodsServiceImpl;

    @RequestMapping("index")
    public String index(HttpServletRequest req){
        req.setAttribute("slideList",goodsServiceImpl.getSlide());
        return "index";
    }

    @RequestMapping("selSixGoods")
    @ResponseBody
    public void getSixGoods(HttpServletResponse resp){
        System.out.println("selGoods");
        List<Goods> list = goodsServiceImpl.getSixGoods();
        ajax(list,resp);
    }

    @RequestMapping("selRecommend")
    @ResponseBody
    public void selRecommend(HttpServletResponse resp){
        System.out.println("selRecommend");
        List<Goods> list = goodsServiceImpl.getRecomend();
        ajax(list,resp);
    }

    @RequestMapping("products")
    public String products(String type){
        System.out.println(type);

        return "products";
    }

    @RequestMapping("details")
    public String details(int id,String type,HttpServletRequest req){
        System.out.println("details");
        System.out.println(goodsServiceImpl.getSimilar(type));
        req.setAttribute("similarList",goodsServiceImpl.getSimilar(type));
        req.setAttribute("goods",goodsServiceImpl.getGoodsById(id));
        return "details";
    }

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

    @RequestMapping("selSlide")
    @ResponseBody
    public void selSlide(HttpServletResponse resp){
        System.out.println("selSlide");
        List<Goods> list = goodsServiceImpl.getSlide();
        ajax(list,resp);
    }

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
