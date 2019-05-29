package com.zephon.service.impl;

import com.zephon.mapper.GoodsMapper;
import com.zephon.pojo.Goods;
import com.zephon.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.impl
 * @date 19-5-27 下午1:10
 * @Copyright ©
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper goodsMapper;
    @Override
    public List<Goods> getSixGoods() {
        return goodsMapper.selSixGoods();
    }

    @Override
    public List<Goods> getRecomend() {
        return goodsMapper.selTop3BySale();
    }

    @Override
    public List<Goods> getPage(int pageSize, int pageNum) {
        return goodsMapper.selPage(pageSize*(pageNum-1),pageSize);
    }

    @Override
    public List<Goods> getSlide() {
        return goodsMapper.selSlide();
    }

    @Override
    public Goods getGoodsById(int id) {
        return goodsMapper.selGoodsById(id);
    }

    @Override
    public List<Goods> getSimilar(String type) {
        return goodsMapper.selSimilarByType(type);
    }
}
