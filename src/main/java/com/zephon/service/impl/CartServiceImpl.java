package com.zephon.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zephon.mapper.CartMapper;
import com.zephon.pojo.Cart;
import com.zephon.pojo.Goods;
import com.zephon.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.impl
 * @date 19-5-28 下午5:15
 * @Copyright ©
 */
@Service
public class CartServiceImpl implements CartService {
    @Resource
    private CartMapper cartMapper;

    /**
     * @Author Zephon
     * @Description 将map转换为json字符串添加到数据库
     * @Date 19-6-3 下午6:17
     * @Param [map, uid]
     * @return int
     **/
    @Override
    public int addToCart(Map<Goods, Integer> map,int uid) throws JsonProcessingException {
        if(cartMapper.delAll()!=1){
            System.out.println("error");
        }
        ObjectMapper mapper = new ObjectMapper();
        for(Goods key:map.keySet()){
            String json = mapper.writeValueAsString(key);
            int index = cartMapper.insCart(json, map.get(key),uid);
            if(index<0){
                System.out.println("insCart error");
                return 0;
            }
        }
        return 1;
    }

    /**
     * @Author Zephon
     * @Description 更新购物车数据库
     * @Date 19-6-3 下午6:18
     * @Param [cart]
     * @return int
     **/
    @Override
    public int updCart(Cart cart) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(cart.getGoodsMapJson());
        return cartMapper.updCart(json,0);
    }

    /**
     * @Author Zephon
     * @Description 将购物车数据库中的json字符串转为map类型
     * @Date 19-6-3 下午6:19
     * @Param [uid]
     * @return java.util.Map<com.zephon.pojo.Goods,java.lang.Integer>
     **/
    @Override
    public Map<Goods,Integer> getAllCart(int uid) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        List<Cart> cartList = cartMapper.selAllCart(uid);
        if(cartList.isEmpty()){return null;}
        System.out.println("cartList"+cartList);
        Map<Goods,Integer> map = new HashMap<>();
        for(Cart c:cartList){
            map.put(mapper.readValue(c.getGoodsMapJson(),Goods.class),c.getNum());
        }
        return map;
    }
}
