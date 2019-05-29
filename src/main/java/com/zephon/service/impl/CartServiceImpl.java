package com.zephon.service.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zephon.mapper.CartMapper;
import com.zephon.pojo.Cart;
import com.zephon.pojo.Goods;
import com.zephon.service.CartService;
import com.zephon.util.MapResultHandler;
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
    @Override
    public int addToCart(Map<Goods, Integer> map) throws JsonProcessingException {
        if(cartMapper.delAll()!=1){
            System.out.println("error");
        }
        ObjectMapper mapper = new ObjectMapper();
        for(Goods key:map.keySet()){
            String json = mapper.writeValueAsString(key);
            int index = cartMapper.insCart(json, map.get(key));
            if(index<0){
                System.out.println("insCart error");
                return 0;
            }
        }
        return 1;
    }

    @Override
    public int updCart(Cart cart) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(cart.getGoodsMapJson());
        return cartMapper.updCart(json,0);
    }

    @Override
    public Map<Goods,Integer> getAllCart() throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        List<Cart> cartList = cartMapper.selAllCart();
        if(cartList.isEmpty()){return null;}
        System.out.println("cartList"+cartList);
        Map<Goods,Integer> map = new HashMap<>();
        for(Cart c:cartList){
            map.put(mapper.readValue(c.getGoodsMapJson(),Goods.class),c.getNum());
        }
        return map;
        /*Map<String, Integer> map = cartMapper.selAllCart();
        System.out.println("map--"+map.keySet());
        if(map==null)return null;
        ObjectMapper mapper = new ObjectMapper();
        Map<Goods,Integer> cartMap = new HashMap<>();
        //JavaType jvt = mapper.getTypeFactory().constructParametricType(HashMap.class,Goods.class,Integer.class);
        for(String json:map.keySet()){
            Goods goods = mapper.readValue(json, Goods.class);
            cartMap.put(goods,map.get(json));
        }
        return cartMap;*/
    }
}
