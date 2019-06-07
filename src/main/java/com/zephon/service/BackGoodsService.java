package com.zephon.service;

import com.zephon.pojo.Goods;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service
 * @date 19-6-7 下午12:44
 * @Copyright ©
 */
public interface BackGoodsService {
    List<Goods> getAllGoods();
    int deleteByID(int id);
    Goods getGoodsByID(int id);
    int modify(Goods goods);
    int addGoods(Goods goods);
}
