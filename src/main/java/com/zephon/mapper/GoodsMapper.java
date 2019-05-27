package com.zephon.mapper;

import com.zephon.pojo.Goods;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper
 * @date 19-5-27 下午1:09
 * @Copyright ©
 */
public interface GoodsMapper {
    @Select("select * from store_goods limit 6")
    List<Goods> selSixGoods();

    @Select("select * from store_goods order by sales desc limit 3")
    List<Goods> selTop3BySale();

    @Select("select * from store_goods")
    List<Goods> selAllGoods();

    @Select("select * from store_goods limit #{arg0},#{arg1}")
    List<Goods> selPage(int pageStart,int pageSize);

    @Select("select * from store_goods order by id limit 3")
    List<Goods> selSlide();
}
