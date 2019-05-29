package com.zephon.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zephon.pojo.Cart;
import com.zephon.pojo.Goods;

import java.io.IOException;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service
 * @date 19-5-28 下午5:11
 * @Copyright ©
 */
public interface CartService {
    int addToCart(Map<Goods, Integer> map) throws JsonProcessingException;
    int updCart(Cart cart) throws JsonProcessingException;
    Map<Goods,Integer> getAllCart() throws IOException;
}
