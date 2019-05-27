package com.zephon.service;

import com.zephon.pojo.Goods;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service
 * @date 19-5-27 下午1:10
 * @Copyright ©
 */
public interface GoodsService {
    List<Goods> getSixGoods();
    List<Goods> getRecomend();
    List<Goods> getPage(int pageSize,int pageNum);
    List<Goods> getSlide();
}
