package com.zephon.service.impl;

import com.zephon.mapper.BackGoodsMapper;
import com.zephon.pojo.Goods;
import com.zephon.service.BackGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.service.impl
 * @date 19-6-7 下午12:45
 * @Copyright ©
 */
@Service
public class BackGoodsServiceImpl implements BackGoodsService {
    @Resource
    private BackGoodsMapper backGoodsMapper;
    @Override
    public List<Goods> getAllGoods() {
        return backGoodsMapper.selAllGoods();
    }

    @Override
    public int deleteByID(int id) {
        return backGoodsMapper.deleteByID(id);
    }

    @Override
    public Goods getGoodsByID(int id) {
        return backGoodsMapper.selGoodsByID(id);
    }

    @Override
    public int modify(Goods goods) {
        return backGoodsMapper.updGoodsByID(goods);
    }
    @Override
    public int addGoods(Goods goods){
        return backGoodsMapper.insGoods(goods);
    }
}
